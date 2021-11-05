package com.sample;

import org.kie.api.KieServices;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;
import org.kie.api.event.rule.DefaultAgendaEventListener;
import org.kie.api.event.rule.BeforeMatchFiredEvent;
import org.kie.api.event.rule.AfterMatchFiredEvent;
import org.kie.api.runtime.rule.QueryResults;
import org.kie.api.runtime.rule.QueryResultsRow;
import org.kie.api.definition.type.FactType;
import org.kie.api.KieBase;

/**
 * This is a sample class to launch a rule.
 */
public class DroolsTest {

    public static final void main(String[] args) {
        try {
            // load up the knowledge base
	        KieServices ks = KieServices.Factory.get();
    	    KieContainer kContainer = ks.getKieClasspathContainer();
        	KieSession kSession = kContainer.newKieSession("ksession-rules");

            // Add listeners for trace
            // kSession.addEventListener( new DefaultAgendaEventListener() {
            //     public void beforeMatchFired(BeforeMatchFiredEvent event) {
            //         super.beforeMatchFired( event );
            //         System.out.println( event );
            //     }
            // });
            // kSession.addEventListener( new DefaultAgendaEventListener() {
            //     public void afterMatchFired(AfterMatchFiredEvent event) {
            //         super.afterMatchFired( event );
            //         System.out.println( event );
            //     }
            // });
            // go !
            kSession.fireAllRules();

            KieBase kbase = kContainer.getKieBase("rules");
            FactType traceType = kbase.getFactType("com.sample.parametric", "Investment");
            Class<?> traceClass = traceType.getFactClass();

            QueryResults results = kSession.getQueryResults("rule trace");
            System.out.println("The conclusion is:");
            for (QueryResultsRow row : results ) {
                Object traceObj = row.get("$rule");
                System.out.println(traceClass.cast(traceObj));
            }
        } catch (Throwable t) {
            t.printStackTrace();
        }
    }
}

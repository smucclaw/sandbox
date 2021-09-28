import pandas as pd
import time
import streamlit as st

# to enhance web responsiveness
@st.cache
def load_dataset(data_link):
    dataset = pd.read_csv(data_link)
    return dataset


data_link = 'https://raw.githubusercontent.com/smucclaw/sandbox/default/regina/pdpa/pdpa.csv'
data = load_dataset(data_link)

# Create the title for the web app
st.title("Notification of Data Breaches")
st.subheader("My first pdpa web app")

st.header("PDPA Overview in Table")
st.dataframe(data)

#01 Selection for Qn 1
st.markdown("### Q1. Method of Data Breach ")
#A Single-Choice Widgets - import from df
selected_class_radio = st.radio("", data['M_data_breach'].unique())
# 3 formats to display outcome
st.write("Selected Data Breach: ", selected_class_radio)
st.info("Selected Data Breach: " + selected_class_radio)
st.success("Selected Data Breach: " + selected_class_radio)
st.markdown("___")

#B Multi-select from df
selected_class_M = st.multiselect("Method of Data Breach", data['M_data_breach'].unique())
st.write("Selected Data Breach: ", selected_class_M)

st.markdown("___")

#C multi-select Checkbox - hard code method
st.text("Select Data Breach method -- select all that apply")
option_1 = st.checkbox("access")
option_2 = st.checkbox("collection")
option_3 = st.checkbox("use")
option_4 = st.checkbox("disclosure")
option_5 = st.checkbox("copying")
option_6 = st.checkbox("modification")
option_7 = st.checkbox("disposal of personal data")

st.markdown("___")

#02 Selection for Qn 2
st.markdown("### Q2. What was the impact of the data breach?")
#A single-selection by dropdown and outcome - import from df
selected_impact = st.selectbox("", data['S_impact'].head(7).unique())
if selected_impact == "select one":
    st.info("Select one to find out if you need to notify PDPC.")
elif selected_impact == "no impact":
    st.success("You are not in any breach. No need to notify PDPC.")
elif selected_impact == "limit to within the organisation":
    st.warning("Selection Option: " + selected_impact + ". You are not in any breach. No need to notify PDPC and may end this session")
else:
    st.error("You would need to notify PDPC and affected individuals unless you pass the exemption in Q3. Proceed to question 3.")

st.markdown("___")

#03 Selection for Qn 3
st.markdown("### Q3. What type of organisation are you acting in the capacity of?")
#A single select - by radio for Organisation Types. hard code method
option = st.radio("",
            ['Organisation with ownership of the personal data.',
             'Data intermediary supporting an organisation which owns the personal data',
             'Public agency which owns/ handles the personal data'
            ])
if option == 'Organisation with ownership of the personal data.':
             st.warning("You need to alert PDPC and the affected individuals.")
elif option == 'Data intermediary supporting an organisation which owns the personal data' :
             st.warning("You need to alert the organisation for their assessment")
else:
    st.warning("You are off the hook. Your session ends here.")
    from PIL import Image
    img = Image.open("scope.jpg")
    st.image(img, width = 800, caption = "Click the black arrow to play")
    audio_file = open ("lucky.mp3", "rb").read()
    st.audio(audio_file,format = 'audio/mp3')
    time.sleep(1)
    st.balloons()

st.markdown("___")

#04 Selection for Qn 4
st.markdown("### 4. Are you within the window period to notify PDPC and affected individuals?")
st.write("Go to side panel to do date checks")
st.markdown("___")
st.sidebar.write("Complete Q1 - Q3 first unless you are certain you need to notify PDPC.")
st.sidebar.subheader('Notification required')

#A Date Input
import datetime
from datetime import timedelta, date

if st.sidebar.checkbox("Check your notification window"):
    breach_date = st.sidebar.date_input("Date of Breach is ", datetime.datetime.now())
    notify_date = st.sidebar.date_input("Date of notification is ", datetime.datetime.now())
    b_date = datetime.datetime.strptime(breach_date.strftime("%d/%m/%y"), "%d/%m/%y").date()
    n_date = datetime.datetime.strptime(notify_date.strftime("%d/%m/%y"), "%d/%m/%y").date()
    gap = (n_date - b_date).days

    #B Progress bar
    start_button = st.sidebar.button("Start the window calculation")
    if start_button:
        progress_bar = st.sidebar.progress(0)
        progress_text = st.sidebar.empty()
        for i in range(101):
            time.sleep(0.003)
            progress_bar.progress(i)
            progress_text.text(f"Progress: {i}%")

        if breach_date > notify_date:
            time.sleep(0.3)
            st.sidebar.error("The data breach cannot happen before the notification date!")
        elif breach_date == notify_date:
            time.sleep(0.5)
            st.sidebar.success("Excellent! You were able to report to PDPC with your efficient assessment.")
        elif gap > 3:
            time.sleep(0.5)
            st.sidebar.error("More than 3 days have lapsed. You have breached [Data Breach Notiifcation Obligation](https://www.pdpc.gov.sg/Overview-of-PDPA/The-Legislation/Personal-Data-Protection-Act/Data-Protection-Obligations)")
        else:
            st.sidebar.info("Good work! You notify PDPC and/or affected individuals within the mandatory 3 days windows with  " + str(3-gap) + " days of allowance.")
    else:
        st.sidebar.write("The progress will be starting by clicking the button.")
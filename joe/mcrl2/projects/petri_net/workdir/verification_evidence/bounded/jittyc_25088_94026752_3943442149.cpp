#define INDEX_BOUND__ 832// These values are not used anymore.
#define ARITY_BOUND__ 9// These values are not used anymore.
#include "mcrl2/data/detail/rewrite/jittycpreamble.h"
namespace {
// Anonymous namespace so the compiler uses internal linkage for the generated
// rewrite code.

struct rewr_functions
{
  // A rewrite_term is a term that may or may not be in normal form. If the method
  // normal_form is invoked, it will calculate a normal form for itself as efficiently as possible.
  template <class REWRITE_TERM>
  static data_expression local_rewrite(const REWRITE_TERM& t, RewriterCompilingJitty* this_rewriter)
  {
    return t.normal_form();
  }

  static const data_expression& local_rewrite(const data_expression& t, RewriterCompilingJitty* )
  {
    return t;
  }

  template < class HEAD, class DATA_EXPR0 >
  class delayed_application1
  {
    protected:
      const HEAD& m_head;
      const DATA_EXPR0& m_arg0;
      RewriterCompilingJitty* this_rewriter;

    public:
      delayed_application1(const HEAD& head, const DATA_EXPR0& arg0, RewriterCompilingJitty* tr)
        : m_head(head), m_arg0(arg0), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(m_head,this_rewriter), local_rewrite(m_arg0,this_rewriter)), this_rewriter);
      }

  };
  template < class HEAD, class DATA_EXPR0, class DATA_EXPR1 >
  class delayed_application2
  {
    protected:
      const HEAD& m_head;
      const DATA_EXPR0& m_arg0;
      const DATA_EXPR1& m_arg1;
      RewriterCompilingJitty* this_rewriter;

    public:
      delayed_application2(const HEAD& head, const DATA_EXPR0& arg0, const DATA_EXPR1& arg1, RewriterCompilingJitty* tr)
        : m_head(head), m_arg0(arg0), m_arg1(arg1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(m_head,this_rewriter), local_rewrite(m_arg0,this_rewriter), local_rewrite(m_arg1,this_rewriter)), this_rewriter);
      }

  };
  template < class HEAD, class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2 >
  class delayed_application3
  {
    protected:
      const HEAD& m_head;
      const DATA_EXPR0& m_arg0;
      const DATA_EXPR1& m_arg1;
      const DATA_EXPR2& m_arg2;
      RewriterCompilingJitty* this_rewriter;

    public:
      delayed_application3(const HEAD& head, const DATA_EXPR0& arg0, const DATA_EXPR1& arg1, const DATA_EXPR2& arg2, RewriterCompilingJitty* tr)
        : m_head(head), m_arg0(arg0), m_arg1(arg1), m_arg2(arg2), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(m_head,this_rewriter), local_rewrite(m_arg0,this_rewriter), local_rewrite(m_arg1,this_rewriter), local_rewrite(m_arg2,this_rewriter)), this_rewriter);
      }

  };
  // We're declaring static members in a struct rather than simple functions in
  // the global scope, so that we don't have to worry about forward declarations.
  // [53] remove_tokens_helper: List(Nat) # List(Nat) -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_53_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F([], @@D(@@N(@@S(@var_0, @@R(@var_0)))), @@X)
    {
      if (uint_address(arg0) == 0x5641ddb556b0) // F1
      {
        const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
        return local_rewrite(var_0, this_rewriter); // R1 @var_0
      }
      else
      {
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@F(|>, @@S(@var_0, @@N(@@S(@var_1, @@D(@@N(@@S(@var_2, @@R(remove_tokens_helper(@var_1, remove_token(@var_0, @var_2))))))))), @@X)
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb56970) // F1
      {
        const data_expression& var_0 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_1 = down_cast<data_expression>(arg0[2]); // S2
        const data_expression& var_2 = arg1; // S1a
        return rewr_53_2(var_1, delayed_rewr_59_2<data_expression, data_expression>(var_0, var_2,  this_rewriter),  this_rewriter); // R1 remove_tokens_helper(@var_1, remove_token(@var_0, @var_2))
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb56580))), arg0, arg1);
  }

  static inline data_expression rewr_53_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_53_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_53_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_53_2(t[0], t[1], this_rewriter); }


  // [59] remove_token: Nat # List(Nat) -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_59_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_59_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_59_2(m_t0, m_t1, this_rewriter);
      }
  };
  
  // [53] remove_tokens_helper: List(Nat) # List(Nat) -> List(Nat)
  static inline const data_expression& rewr_53_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddecf910);
  }

  static inline data_expression rewr_53_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_53_0(this_rewriter); }

  static inline data_expression rewr_53_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_53_0(this_rewriter); }


  // [59] remove_token: Nat # List(Nat) -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_59_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@N(@@F([], @@R([]), @@X))
    {
      if (uint_address(arg1) == 0x5641ddb556b0) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddee3eb0); // R1 []
      }
      else
      {
      }
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@S(@var_0, @@N(@@F(|>, @@S(@var_1, @@N(@@S(@var_2, @@C(@var_0 != @var_1, @@R(remove_token(@var_0, @var_2)), @@C(@var_0 == @var_1, @@R(@var_2), @@D(@@X)))))), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb56970) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg1[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg1[2]); // S2
        if (rewr_61_2(var_0, var_1,  this_rewriter) == sort_bool::true_()) // C
        {
          return rewr_59_2(var_0, var_2,  this_rewriter); // R1 remove_token(@var_0, @var_2)
        }
        else
        {
          if (rewr_35_2(var_0, var_1,  this_rewriter) == sort_bool::true_()) // C
          {
            return var_2; // R1 @var_2
          }
          else
          {
          }
        }
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb568e0))), arg0, arg1);
  }

  static inline data_expression rewr_59_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_59_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_59_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_59_2(t[0], t[1], this_rewriter); }


  // [59] remove_token: Nat # List(Nat) -> List(Nat)
  static inline const data_expression& rewr_59_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee56d0);
  }

  static inline data_expression rewr_59_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_59_0(this_rewriter); }

  static inline data_expression rewr_59_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_59_0(this_rewriter); }


  // [58] fire_trans_fn: (Place -> List(Nat)) # Trans -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_58_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@S(@var_1, @@N(@@S(@var_2, @@R(add_tokens(remove_tokens(@var_0, from(@var_1)), to(@var_1))(@var_2)))))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const data_expression& var_1 = arg1; // S1a
      const DATA_EXPR2& var_2 = arg_not_nf2; // S1b
      return rewr_55_3(delayed_rewr_52_2<DATA_EXPR0, delayed_rewr_42_1<data_expression>>(var_0, delayed_rewr_42_1<data_expression>(var_1,  this_rewriter),  this_rewriter), rewr_57_1(var_1,  this_rewriter), var_2,  this_rewriter); // R1 add_tokens(remove_tokens(@var_0, from(@var_1)), to(@var_1))(@var_2)
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb56850))), local_rewrite(arg_not_nf0,this_rewriter), arg1), local_rewrite(arg_not_nf2,this_rewriter));
  }

  static inline data_expression rewr_58_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_58_3(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_58_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_58_3(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], t[0], this_rewriter); }


  // [52] remove_tokens: (Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_52_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_52_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_52_2(m_t0, m_t1, this_rewriter);
      }
  };
  
  // [42] from: Trans -> List(PlaceTokens)
  template < class DATA_EXPR0>
  class delayed_rewr_42_1
  {
    protected:
      const DATA_EXPR0& m_t0;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_42_1(const DATA_EXPR0& t0, RewriterCompilingJitty* tr)
        : m_t0(t0), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_42_1(m_t0, this_rewriter);
      }
  };
  
  // [58] fire_trans_fn: (Place -> List(Nat)) # Trans -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_58_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@S(@var_1, @@R(add_tokens(remove_tokens(@var_0, from(@var_1)), to(@var_1))))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const data_expression& var_1 = arg1; // S1a
      return rewr_55_2(delayed_rewr_52_2<DATA_EXPR0, delayed_rewr_42_1<data_expression>>(var_0, delayed_rewr_42_1<data_expression>(var_1,  this_rewriter),  this_rewriter), rewr_57_1(var_1,  this_rewriter),  this_rewriter); // R1 add_tokens(remove_tokens(@var_0, from(@var_1)), to(@var_1))
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb56850))), local_rewrite(arg_not_nf0,this_rewriter), arg1);
  }

  static inline data_expression rewr_58_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_58_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_58_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_58_2(t[0], t[1], this_rewriter); }


  // [58] fire_trans_fn: (Place -> List(Nat)) # Trans -> Place -> List(Nat)
  static inline const data_expression& rewr_58_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee36a0);
  }

  static inline data_expression rewr_58_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_58_0(this_rewriter); }

  static inline data_expression rewr_58_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_58_0(this_rewriter); }


  // [55] add_tokens: (Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_55_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@F([], @@D(@@N(@@S(@var_1, @@R(@var_0(@var_1))))), @@X)))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      if (uint_address(arg1) == 0x5641ddb564f0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter)), this_rewriter); // R1 @var_0(@var_1)
      }
      else
      {
      }
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@S(@var_0, @@N(@@F(|>, @@F(place_tokens, @@S(@var_1, @@N(@@S(@var_2, @@D(@@N(@@S(@var_3, @@D(@@N(@@S(@var_4, @@R(add_tokens(@var_0, @var_3)[@var_1 -> @var_2 ++ @var_0(@var_1)](@var_4))))))))))), @@D(@@X)), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb56610) // F1
      {
        if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x5641ddb55a40) // F2b place_tokens
        {
          const data_expression& t1 = down_cast<data_expression>(arg1[1]);
          const data_expression& var_1 = down_cast<data_expression>(t1[1]); // S2
          const data_expression& var_2 = down_cast<data_expression>(t1[2]); // S2
          const data_expression& var_3 = down_cast<data_expression>(arg1[2]); // S2
          const DATA_EXPR2& var_4 = arg_not_nf2; // S1b
          return rewr_13_4(rewr_55_2(var_0, var_3,  this_rewriter), var_1, delayed_rewr_56_2<data_expression, delayed_application1<data_expression,data_expression>>(var_2, delayed_application1<data_expression,data_expression>(var_0,var_1, this_rewriter),  this_rewriter), var_4,  this_rewriter); // R1 add_tokens(@var_0, @var_3)[@var_1 -> @var_2 ++ @var_0(@var_1)](@var_4)
        }
        else
        {
        }
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb566a0))), arg0, arg1), local_rewrite(arg_not_nf2,this_rewriter));
  }

  static inline data_expression rewr_55_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_55_3(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_55_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_55_3(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], t[0], this_rewriter); }


  // [56] ++: List(Nat) # List(Nat) -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_56_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_56_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_56_2(m_t0, m_t1, this_rewriter);
      }
  };
  
  // [55] add_tokens: (Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_55_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@F([], @@R(@var_0), @@X)))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      if (uint_address(arg1) == 0x5641ddb564f0) // F1
      {
        return local_rewrite(var_0, this_rewriter); // R1 @var_0
      }
      else
      {
      }
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@S(@var_0, @@N(@@F(|>, @@F(place_tokens, @@S(@var_1, @@N(@@S(@var_2, @@D(@@N(@@S(@var_3, @@R(add_tokens(@var_0, @var_3)[@var_1 -> @var_2 ++ @var_0(@var_1)]))))))), @@D(@@X)), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb56610) // F1
      {
        if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x5641ddb55a40) // F2b place_tokens
        {
          const data_expression& t1 = down_cast<data_expression>(arg1[1]);
          const data_expression& var_1 = down_cast<data_expression>(t1[1]); // S2
          const data_expression& var_2 = down_cast<data_expression>(t1[2]); // S2
          const data_expression& var_3 = down_cast<data_expression>(arg1[2]); // S2
          return rewr_13_3(rewr_55_2(var_0, var_3,  this_rewriter), var_1, delayed_rewr_56_2<data_expression, delayed_application1<data_expression,data_expression>>(var_2, delayed_application1<data_expression,data_expression>(var_0,var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 add_tokens(@var_0, @var_3)[@var_1 -> @var_2 ++ @var_0(@var_1)]
        }
        else
        {
        }
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb566a0))), arg0, arg1);
  }

  static inline data_expression rewr_55_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_55_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_55_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_55_2(t[0], t[1], this_rewriter); }


  // [55] add_tokens: (Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)
  static inline const data_expression& rewr_55_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee3810);
  }

  static inline data_expression rewr_55_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_55_0(this_rewriter); }

  static inline data_expression rewr_55_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_55_0(this_rewriter); }


  // [52] remove_tokens: (Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_52_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@F([], @@D(@@N(@@S(@var_1, @@R(@var_0(@var_1))))), @@X)))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      if (uint_address(arg1) == 0x5641ddb564f0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter)), this_rewriter); // R1 @var_0(@var_1)
      }
      else
      {
      }
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@S(@var_0, @@N(@@F(|>, @@F(place_tokens, @@S(@var_1, @@N(@@S(@var_2, @@D(@@N(@@S(@var_3, @@D(@@N(@@S(@var_4, @@R(remove_tokens(@var_0, @var_3)[@var_1 -> remove_tokens_helper(@var_2, @var_0(@var_1))](@var_4))))))))))), @@D(@@X)), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb56610) // F1
      {
        if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x5641ddb55a40) // F2b place_tokens
        {
          const data_expression& t1 = down_cast<data_expression>(arg1[1]);
          const data_expression& var_1 = down_cast<data_expression>(t1[1]); // S2
          const data_expression& var_2 = down_cast<data_expression>(t1[2]); // S2
          const data_expression& var_3 = down_cast<data_expression>(arg1[2]); // S2
          const DATA_EXPR2& var_4 = arg_not_nf2; // S1b
          return rewr_13_4(rewr_52_2(var_0, var_3,  this_rewriter), var_1, delayed_rewr_53_2<data_expression, delayed_application1<data_expression,data_expression>>(var_2, delayed_application1<data_expression,data_expression>(var_0,var_1, this_rewriter),  this_rewriter), var_4,  this_rewriter); // R1 remove_tokens(@var_0, @var_3)[@var_1 -> remove_tokens_helper(@var_2, @var_0(@var_1))](@var_4)
        }
        else
        {
        }
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb56520))), arg0, arg1), local_rewrite(arg_not_nf2,this_rewriter));
  }

  static inline data_expression rewr_52_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_52_3(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_52_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_52_3(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], t[0], this_rewriter); }


  // [53] remove_tokens_helper: List(Nat) # List(Nat) -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_53_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_53_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_53_2(m_t0, m_t1, this_rewriter);
      }
  };
  
  // [52] remove_tokens: (Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_52_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@F([], @@R(@var_0), @@X)))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      if (uint_address(arg1) == 0x5641ddb564f0) // F1
      {
        return local_rewrite(var_0, this_rewriter); // R1 @var_0
      }
      else
      {
      }
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@S(@var_0, @@N(@@F(|>, @@F(place_tokens, @@S(@var_1, @@N(@@S(@var_2, @@D(@@N(@@S(@var_3, @@R(remove_tokens(@var_0, @var_3)[@var_1 -> remove_tokens_helper(@var_2, @var_0(@var_1))]))))))), @@D(@@X)), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb56610) // F1
      {
        if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x5641ddb55a40) // F2b place_tokens
        {
          const data_expression& t1 = down_cast<data_expression>(arg1[1]);
          const data_expression& var_1 = down_cast<data_expression>(t1[1]); // S2
          const data_expression& var_2 = down_cast<data_expression>(t1[2]); // S2
          const data_expression& var_3 = down_cast<data_expression>(arg1[2]); // S2
          return rewr_13_3(rewr_52_2(var_0, var_3,  this_rewriter), var_1, delayed_rewr_53_2<data_expression, delayed_application1<data_expression,data_expression>>(var_2, delayed_application1<data_expression,data_expression>(var_0,var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 remove_tokens(@var_0, @var_3)[@var_1 -> remove_tokens_helper(@var_2, @var_0(@var_1))]
        }
        else
        {
        }
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb56520))), arg0, arg1);
  }

  static inline data_expression rewr_52_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_52_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_52_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_52_2(t[0], t[1], this_rewriter); }


  // [52] remove_tokens: (Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)
  static inline const data_expression& rewr_52_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddcc2980);
  }

  static inline data_expression rewr_52_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_52_0(this_rewriter); }

  static inline data_expression rewr_52_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_52_0(this_rewriter); }


  // [816] @equal_arguments: MarkingTrans # MarkingTrans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_816_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@F(marking_trans, @@S(@var_1, @@N(@@S(@var_2, @@D(@@N(@@M(@var_0, @@R(true), @@F(marking_trans, @@S(@var_3, @@N(@@S(@var_4, @@R(@var_1 == @var_3 && @var_2 == @var_4)))), @@X))))))), @@N(@@M(@var_0, @@R(true), @@X))))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddbfa3b0) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
        }
        else
        {
          if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddbfa3b0) // F1
          {
            const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
            const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
            return rewr_45_2(rewr_89_2(var_1, var_3,  this_rewriter), delayed_rewr_87_2<data_expression, data_expression>(var_2, var_4,  this_rewriter),  this_rewriter); // R1 @var_1 == @var_3 && @var_2 == @var_4
          }
          else
          {
          }
        }
      }
      else
      {
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbfa470))), arg0, arg1);
  }

  static inline data_expression rewr_816_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_816_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_816_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_816_2(t[0], t[1], this_rewriter); }


  // [87] ==: Trans_name # Trans_name -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_87_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_87_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_87_2(m_t0, m_t1, this_rewriter);
      }
  };
  
  // [816] @equal_arguments: MarkingTrans # MarkingTrans -> Bool
  static inline const data_expression& rewr_816_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee3cf0);
  }

  static inline data_expression rewr_816_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_816_0(this_rewriter); }

  static inline data_expression rewr_816_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_816_0(this_rewriter); }


  // [815] @to_pos: MarkingTrans -> Pos
  template < class DATA_EXPR0>
  static inline data_expression rewr_815_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(marking_trans, @@N(@@R(1)), @@X)
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddbfa3b0) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc29e0); // R1 1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbfa440))), arg0);
  }

  static inline data_expression rewr_815_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_815_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_815_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_815_1(t[0], this_rewriter); }


  // [815] @to_pos: MarkingTrans -> Pos
  static inline const data_expression& rewr_815_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee38a0);
  }

  static inline data_expression rewr_815_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_815_0(this_rewriter); }

  static inline data_expression rewr_815_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_815_0(this_rewriter); }


  // [813] marking': MarkingTrans -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_813_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(marking_trans, @@S(@var_0, @@N(@@D(@@N(@@S(@var_2, @@R(@var_0(@var_2))))))), @@X)
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddbfa3b0) // F1
      {
        const data_expression& var_0 = down_cast<data_expression>(arg0[1]); // S2
        const DATA_EXPR1& var_2 = arg_not_nf1; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_0, local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_0(@var_2)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbfa3e0))), arg0), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_813_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_813_2(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_813_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_813_2(down_cast<application>(t.head())[0], t[0], this_rewriter); }


  // [813] marking': MarkingTrans -> Place -> List(Nat)
  template < class DATA_EXPR0>
  static inline data_expression rewr_813_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(marking_trans, @@S(@var_0, @@N(@@R(@var_0))), @@X)
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddbfa3b0) // F1
      {
        const data_expression& var_0 = down_cast<data_expression>(arg0[1]); // S2
        return var_0; // R1 @var_0
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbfa3e0))), arg0);
  }

  static inline data_expression rewr_813_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_813_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_813_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_813_1(t[0], this_rewriter); }


  // [813] marking': MarkingTrans -> Place -> List(Nat)
  static inline const data_expression& rewr_813_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee3450);
  }

  static inline data_expression rewr_813_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_813_0(this_rewriter); }

  static inline data_expression rewr_813_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_813_0(this_rewriter); }


  // [796] @equal_arguments: PlaceTokens # PlaceTokens -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_796_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@F(place_tokens, @@S(@var_1, @@N(@@S(@var_2, @@D(@@N(@@M(@var_0, @@R(true), @@F(place_tokens, @@S(@var_3, @@N(@@S(@var_4, @@R(@var_1 == @var_3 && @var_2 == @var_4)))), @@X))))))), @@N(@@M(@var_0, @@R(true), @@X))))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb55a40) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
        }
        else
        {
          if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb55a40) // F1
          {
            const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
            const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
            return rewr_45_2(rewr_705_2(var_1, var_3,  this_rewriter), delayed_rewr_299_2<data_expression, data_expression>(var_2, var_4,  this_rewriter),  this_rewriter); // R1 @var_1 == @var_3 && @var_2 == @var_4
          }
          else
          {
          }
        }
      }
      else
      {
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbf9450))), arg0, arg1);
  }

  static inline data_expression rewr_796_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_796_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_796_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_796_2(t[0], t[1], this_rewriter); }


  // [299] ==: List(Nat) # List(Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_299_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_299_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_299_2(m_t0, m_t1, this_rewriter);
      }
  };
  
  // [796] @equal_arguments: PlaceTokens # PlaceTokens -> Bool
  static inline const data_expression& rewr_796_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee3b30);
  }

  static inline data_expression rewr_796_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_796_0(this_rewriter); }

  static inline data_expression rewr_796_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_796_0(this_rewriter); }


  // [795] @to_pos: PlaceTokens -> Pos
  template < class DATA_EXPR0>
  static inline data_expression rewr_795_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(place_tokens, @@N(@@R(1)), @@X)
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb55a40) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc29e0); // R1 1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbf9420))), arg0);
  }

  static inline data_expression rewr_795_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_795_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_795_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_795_1(t[0], this_rewriter); }


  // [795] @to_pos: PlaceTokens -> Pos
  static inline const data_expression& rewr_795_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee3240);
  }

  static inline data_expression rewr_795_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_795_0(this_rewriter); }

  static inline data_expression rewr_795_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_795_0(this_rewriter); }


  // [776] @equal_arguments: Trans # Trans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_776_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@F(trans, @@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@N(@@S(@var_5, @@D(@@N(@@M(@var_0, @@R(true), @@F(trans, @@S(@var_6, @@N(@@S(@var_7, @@N(@@S(@var_8, @@N(@@S(@var_9, @@N(@@S(@var_10, @@R(@var_1 == @var_6 && @var_2 == @var_7 && @var_3 == @var_8 && @var_4 == @var_9 && @var_5 == @var_10)))))))))), @@X))))))))))))), @@N(@@M(@var_0, @@R(true), @@X))))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb55c80) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        const data_expression& var_3 = down_cast<data_expression>(arg0[3]); // S2
        const data_expression& var_4 = down_cast<data_expression>(arg0[4]); // S2
        const data_expression& var_5 = down_cast<data_expression>(arg0[5]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
        }
        else
        {
          if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb55c80) // F1
          {
            const data_expression& var_6 = down_cast<data_expression>(arg1[1]); // S2
            const data_expression& var_7 = down_cast<data_expression>(arg1[2]); // S2
            const data_expression& var_8 = down_cast<data_expression>(arg1[3]); // S2
            const data_expression& var_9 = down_cast<data_expression>(arg1[4]); // S2
            const data_expression& var_10 = down_cast<data_expression>(arg1[5]); // S2
            return rewr_45_2(rewr_87_2(var_1, var_6,  this_rewriter), delayed_rewr_45_2<delayed_rewr_402_2<data_expression, data_expression>, delayed_rewr_45_2<delayed_rewr_35_2<data_expression, data_expression>, delayed_rewr_45_2<delayed_rewr_265_2<data_expression, data_expression>, delayed_rewr_265_2<data_expression, data_expression>>>>(delayed_rewr_402_2<data_expression, data_expression>(var_2, var_7,  this_rewriter), delayed_rewr_45_2<delayed_rewr_35_2<data_expression, data_expression>, delayed_rewr_45_2<delayed_rewr_265_2<data_expression, data_expression>, delayed_rewr_265_2<data_expression, data_expression>>>(delayed_rewr_35_2<data_expression, data_expression>(var_3, var_8,  this_rewriter), delayed_rewr_45_2<delayed_rewr_265_2<data_expression, data_expression>, delayed_rewr_265_2<data_expression, data_expression>>(delayed_rewr_265_2<data_expression, data_expression>(var_4, var_9,  this_rewriter), delayed_rewr_265_2<data_expression, data_expression>(var_5, var_10,  this_rewriter),  this_rewriter),  this_rewriter),  this_rewriter),  this_rewriter); // R1 @var_1 == @var_6 && @var_2 == @var_7 && @var_3 == @var_8 && @var_4 == @var_9 && @var_5 == @var_10
          }
          else
          {
          }
        }
      }
      else
      {
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbf86a0))), arg0, arg1);
  }

  static inline data_expression rewr_776_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_776_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_776_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_776_2(t[0], t[1], this_rewriter); }


  // [45] &&: Bool # Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_45_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_45_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_45_2(m_t0, m_t1, this_rewriter);
      }
  };
  
  // [265] ==: List(PlaceTokens) # List(PlaceTokens) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_265_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_265_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_265_2(m_t0, m_t1, this_rewriter);
      }
  };
  
  // [35] ==: Nat # Nat -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_35_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_35_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_35_2(m_t0, m_t1, this_rewriter);
      }
  };
  
  // [402] ==: Bool # Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_402_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_402_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_402_2(m_t0, m_t1, this_rewriter);
      }
  };
  
  // [776] @equal_arguments: Trans # Trans -> Bool
  static inline const data_expression& rewr_776_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddcc13f0);
  }

  static inline data_expression rewr_776_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_776_0(this_rewriter); }

  static inline data_expression rewr_776_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_776_0(this_rewriter); }


  // [775] @to_pos: Trans -> Pos
  template < class DATA_EXPR0>
  static inline data_expression rewr_775_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(trans, @@N(@@N(@@N(@@N(@@R(1))))), @@X)
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb55c80) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc29e0); // R1 1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbf8670))), arg0);
  }

  static inline data_expression rewr_775_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_775_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_775_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_775_1(t[0], this_rewriter); }


  // [775] @to_pos: Trans -> Pos
  static inline const data_expression& rewr_775_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee4310);
  }

  static inline data_expression rewr_775_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_775_0(this_rewriter); }

  static inline data_expression rewr_775_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_775_0(this_rewriter); }


  // [57] to: Trans -> List(PlaceTokens)
  template < class DATA_EXPR0>
  static inline data_expression rewr_57_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(trans, @@N(@@N(@@N(@@N(@@S(@var_4, @@R(@var_4)))))), @@X)
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb55c80) // F1
      {
        const data_expression& var_4 = down_cast<data_expression>(arg0[5]); // S2
        return var_4; // R1 @var_4
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb567c0))), arg0);
  }

  static inline data_expression rewr_57_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_57_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_57_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_57_1(t[0], this_rewriter); }


  // [57] to: Trans -> List(PlaceTokens)
  static inline const data_expression& rewr_57_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee35f0);
  }

  static inline data_expression rewr_57_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_57_0(this_rewriter); }

  static inline data_expression rewr_57_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_57_0(this_rewriter); }


  // [42] from: Trans -> List(PlaceTokens)
  template < class DATA_EXPR0>
  static inline data_expression rewr_42_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(trans, @@N(@@N(@@N(@@S(@var_3, @@N(@@R(@var_3)))))), @@X)
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb55c80) // F1
      {
        const data_expression& var_3 = down_cast<data_expression>(arg0[4]); // S2
        return var_3; // R1 @var_3
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb560a0))), arg0);
  }

  static inline data_expression rewr_42_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_42_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_42_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_42_1(t[0], this_rewriter); }


  // [42] from: Trans -> List(PlaceTokens)
  static inline const data_expression& rewr_42_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddcb3150);
  }

  static inline data_expression rewr_42_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_42_0(this_rewriter); }

  static inline data_expression rewr_42_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_42_0(this_rewriter); }


  // [40] guard: Trans -> Bool
  template < class DATA_EXPR0>
  static inline data_expression rewr_40_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(trans, @@N(@@S(@var_1, @@N(@@N(@@N(@@R(@var_1)))))), @@X)
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb55c80) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[2]); // S2
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb55fe0))), arg0);
  }

  static inline data_expression rewr_40_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_40_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_40_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_40_1(t[0], this_rewriter); }


  // [40] guard: Trans -> Bool
  static inline const data_expression& rewr_40_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddcb3090);
  }

  static inline data_expression rewr_40_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_40_0(this_rewriter); }

  static inline data_expression rewr_40_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_40_0(this_rewriter); }


  // [86] trans_name: Trans -> Trans_name
  template < class DATA_EXPR0>
  static inline data_expression rewr_86_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(trans, @@S(@var_0, @@N(@@N(@@N(@@N(@@R(@var_0)))))), @@X)
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb55c80) // F1
      {
        const data_expression& var_0 = down_cast<data_expression>(arg0[1]); // S2
        return var_0; // R1 @var_0
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb57e10))), arg0);
  }

  static inline data_expression rewr_86_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_86_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_86_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_86_1(t[0], this_rewriter); }


  // [86] trans_name: Trans -> Trans_name
  static inline const data_expression& rewr_86_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddcc13c0);
  }

  static inline data_expression rewr_86_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_86_0(this_rewriter); }

  static inline data_expression rewr_86_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_86_0(this_rewriter); }


  // [761] @equal_arguments: Trans_name # Trans_name -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_761_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@F(t3, @@D(@@N(@@M(@var_0, @@R(true), @@F(t3, @@R(true), @@X)))), @@F(t0, @@D(@@N(@@M(@var_0, @@R(true), @@F(t0, @@R(true), @@X)))), @@F(t2, @@D(@@N(@@M(@var_0, @@R(true), @@F(t2, @@R(true), @@X)))), @@F(t1, @@D(@@N(@@M(@var_0, @@R(true), @@F(t1, @@R(true), @@X)))), @@N(@@M(@var_0, @@R(true), @@X)))))))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address(arg0) == 0x5641ddb55c50) // F1
      {
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
        }
        else
        {
          if (uint_address(arg1) == 0x5641ddb55c50) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
          }
          else
          {
          }
        }
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb55f50) // F1
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
          }
          else
          {
            if (uint_address(arg1) == 0x5641ddb55f50) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
            }
            else
            {
            }
          }
        }
        else
        {
          if (uint_address(arg0) == 0x5641ddb55d40) // F1
          {
            if (var_0 == arg1) // M
            {
              return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
            }
            else
            {
              if (uint_address(arg1) == 0x5641ddb55d40) // F1
              {
                return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
              }
              else
              {
              }
            }
          }
          else
          {
            if (uint_address(arg0) == 0x5641ddb55ec0) // F1
            {
              if (var_0 == arg1) // M
              {
                return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
              }
              else
              {
                if (uint_address(arg1) == 0x5641ddb55ec0) // F1
                {
                  return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
                }
                else
                {
                }
              }
            }
            else
            {
              if (var_0 == arg1) // M
              {
                return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
              }
              else
              {
              }
            }
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbf73b0))), arg0, arg1);
  }

  static inline data_expression rewr_761_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_761_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_761_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_761_2(t[0], t[1], this_rewriter); }


  // [761] @equal_arguments: Trans_name # Trans_name -> Bool
  static inline const data_expression& rewr_761_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee3870);
  }

  static inline data_expression rewr_761_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_761_0(this_rewriter); }

  static inline data_expression rewr_761_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_761_0(this_rewriter); }


  // [760] @to_pos: Trans_name -> Pos
  template < class DATA_EXPR0>
  static inline data_expression rewr_760_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(t3, @@R(4), @@F(t0, @@R(1), @@F(t2, @@R(3), @@F(t1, @@R(2), @@X))))
    {
      if (uint_address(arg0) == 0x5641ddb55c50) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddee3e80); // R1 4
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb55f50) // F1
        {
          return *reinterpret_cast<const data_expression*>(0x5641ddcc29e0); // R1 1
        }
        else
        {
          if (uint_address(arg0) == 0x5641ddb55d40) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcb30c0); // R1 3
          }
          else
          {
            if (uint_address(arg0) == 0x5641ddb55ec0) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x5641ddcc2900); // R1 2
            }
            else
            {
            }
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbf7380))), arg0);
  }

  static inline data_expression rewr_760_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_760_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_760_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_760_1(t[0], this_rewriter); }


  // [760] @to_pos: Trans_name -> Pos
  static inline const data_expression& rewr_760_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddecfd60);
  }

  static inline data_expression rewr_760_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_760_0(this_rewriter); }

  static inline data_expression rewr_760_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_760_0(this_rewriter); }


  // [747] @less_arguments: Place # Place -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_747_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@F(p5, @@D(@@N(@@F(p5, @@R(false), @@X))), @@F(p0, @@D(@@N(@@F(p0, @@R(false), @@X))), @@F(p4, @@D(@@N(@@F(p4, @@R(false), @@X))), @@F(p1, @@D(@@N(@@F(p1, @@R(false), @@X))), @@F(p3, @@D(@@N(@@F(p3, @@R(false), @@X))), @@F(p2, @@D(@@N(@@F(p2, @@R(false), @@X))), @@X))))))
    {
      if (uint_address(arg0) == 0x5641ddb55a10) // F1
      {
        if (uint_address(arg1) == 0x5641ddb55a10) // F1
        {
          return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
        }
        else
        {
        }
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb55680) // F1
        {
          if (uint_address(arg1) == 0x5641ddb55680) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
          }
          else
          {
          }
        }
        else
        {
          if (uint_address(arg0) == 0x5641ddb55b00) // F1
          {
            if (uint_address(arg1) == 0x5641ddb55b00) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
            }
            else
            {
            }
          }
          else
          {
            if (uint_address(arg0) == 0x5641ddb55da0) // F1
            {
              if (uint_address(arg1) == 0x5641ddb55da0) // F1
              {
                return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
              }
              else
              {
              }
            }
            else
            {
              if (uint_address(arg0) == 0x5641ddb55b90) // F1
              {
                if (uint_address(arg1) == 0x5641ddb55b90) // F1
                {
                  return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
                }
                else
                {
                }
              }
              else
              {
                if (uint_address(arg0) == 0x5641ddb55ce0) // F1
                {
                  if (uint_address(arg1) == 0x5641ddb55ce0) // F1
                  {
                    return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
                  }
                  else
                  {
                  }
                }
                else
                {
                }
              }
            }
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbf6570))), arg0, arg1);
  }

  static inline data_expression rewr_747_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_747_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_747_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_747_2(t[0], t[1], this_rewriter); }


  // [747] @less_arguments: Place # Place -> Bool
  static inline const data_expression& rewr_747_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddcb3120);
  }

  static inline data_expression rewr_747_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_747_0(this_rewriter); }

  static inline data_expression rewr_747_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_747_0(this_rewriter); }


  // [746] @equal_arguments: Place # Place -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_746_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@F(p5, @@D(@@N(@@M(@var_0, @@R(true), @@F(p5, @@R(true), @@X)))), @@F(p0, @@D(@@N(@@M(@var_0, @@R(true), @@F(p0, @@R(true), @@X)))), @@F(p4, @@D(@@N(@@M(@var_0, @@R(true), @@F(p4, @@R(true), @@X)))), @@F(p1, @@D(@@N(@@M(@var_0, @@R(true), @@F(p1, @@R(true), @@X)))), @@F(p3, @@D(@@N(@@M(@var_0, @@R(true), @@F(p3, @@R(true), @@X)))), @@F(p2, @@D(@@N(@@M(@var_0, @@R(true), @@F(p2, @@R(true), @@X)))), @@N(@@M(@var_0, @@R(true), @@X)))))))))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address(arg0) == 0x5641ddb55a10) // F1
      {
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
        }
        else
        {
          if (uint_address(arg1) == 0x5641ddb55a10) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
          }
          else
          {
          }
        }
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb55680) // F1
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
          }
          else
          {
            if (uint_address(arg1) == 0x5641ddb55680) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
            }
            else
            {
            }
          }
        }
        else
        {
          if (uint_address(arg0) == 0x5641ddb55b00) // F1
          {
            if (var_0 == arg1) // M
            {
              return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
            }
            else
            {
              if (uint_address(arg1) == 0x5641ddb55b00) // F1
              {
                return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
              }
              else
              {
              }
            }
          }
          else
          {
            if (uint_address(arg0) == 0x5641ddb55da0) // F1
            {
              if (var_0 == arg1) // M
              {
                return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
              }
              else
              {
                if (uint_address(arg1) == 0x5641ddb55da0) // F1
                {
                  return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
                }
                else
                {
                }
              }
            }
            else
            {
              if (uint_address(arg0) == 0x5641ddb55b90) // F1
              {
                if (var_0 == arg1) // M
                {
                  return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
                }
                else
                {
                  if (uint_address(arg1) == 0x5641ddb55b90) // F1
                  {
                    return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
                  }
                  else
                  {
                  }
                }
              }
              else
              {
                if (uint_address(arg0) == 0x5641ddb55ce0) // F1
                {
                  if (var_0 == arg1) // M
                  {
                    return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
                  }
                  else
                  {
                    if (uint_address(arg1) == 0x5641ddb55ce0) // F1
                    {
                      return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
                    }
                    else
                    {
                    }
                  }
                }
                else
                {
                  if (var_0 == arg1) // M
                  {
                    return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
                  }
                  else
                  {
                  }
                }
              }
            }
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbf6540))), arg0, arg1);
  }

  static inline data_expression rewr_746_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_746_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_746_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_746_2(t[0], t[1], this_rewriter); }


  // [746] @equal_arguments: Place # Place -> Bool
  static inline const data_expression& rewr_746_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee36d0);
  }

  static inline data_expression rewr_746_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_746_0(this_rewriter); }

  static inline data_expression rewr_746_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_746_0(this_rewriter); }


  // [745] @to_pos: Place -> Pos
  template < class DATA_EXPR0>
  static inline data_expression rewr_745_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(p5, @@R(6), @@F(p0, @@R(1), @@F(p4, @@R(5), @@F(p1, @@R(2), @@F(p3, @@R(4), @@F(p2, @@R(3), @@X))))))
    {
      if (uint_address(arg0) == 0x5641ddb55a10) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddee4230); // R1 6
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb55680) // F1
        {
          return *reinterpret_cast<const data_expression*>(0x5641ddcc29e0); // R1 1
        }
        else
        {
          if (uint_address(arg0) == 0x5641ddb55b00) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcb31e0); // R1 5
          }
          else
          {
            if (uint_address(arg0) == 0x5641ddb55da0) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x5641ddcc2900); // R1 2
            }
            else
            {
              if (uint_address(arg0) == 0x5641ddb55b90) // F1
              {
                return *reinterpret_cast<const data_expression*>(0x5641ddee3e80); // R1 4
              }
              else
              {
                if (uint_address(arg0) == 0x5641ddb55ce0) // F1
                {
                  return *reinterpret_cast<const data_expression*>(0x5641ddcb30c0); // R1 3
                }
                else
                {
                }
              }
            }
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbf6510))), arg0);
  }

  static inline data_expression rewr_745_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_745_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_745_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_745_1(t[0], this_rewriter); }


  // [745] @to_pos: Place -> Pos
  static inline const data_expression& rewr_745_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee4340);
  }

  static inline data_expression rewr_745_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_745_0(this_rewriter); }

  static inline data_expression rewr_745_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_745_0(this_rewriter); }


  // [731] if: Bool # @NatPair # @NatPair -> @NatPair
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_731_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbf58b0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_731_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_731_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_731_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_731_3(t[0], t[1], t[2], this_rewriter); }


  // [731] if: Bool # @NatPair # @NatPair -> @NatPair
  static inline const data_expression& rewr_731_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddcc4d50);
  }

  static inline data_expression rewr_731_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_731_0(this_rewriter); }

  static inline data_expression rewr_731_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_731_0(this_rewriter); }


  // [730] !=: @NatPair # @NatPair -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_730_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_699_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbf5880))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_730_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_730_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_730_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_730_2(t[0], t[1], this_rewriter); }


  // [730] !=: @NatPair # @NatPair -> Bool
  static inline const data_expression& rewr_730_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddcc1420);
  }

  static inline data_expression rewr_730_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_730_0(this_rewriter); }

  static inline data_expression rewr_730_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_730_0(this_rewriter); }


  // [699] ==: @NatPair # @NatPair -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_699_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@F(@cPair, @@S(@var_1, @@N(@@S(@var_2, @@D(@@N(@@M(@var_0, @@R(true), @@F(@cPair, @@S(@var_3, @@N(@@S(@var_4, @@R(@var_1 == @var_3 && @var_2 == @var_4)))), @@X))))))), @@N(@@M(@var_0, @@R(true), @@X))))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb59400) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
        }
        else
        {
          if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb59400) // F1
          {
            const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
            const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
            return rewr_45_2(rewr_35_2(var_1, var_3,  this_rewriter), delayed_rewr_35_2<data_expression, data_expression>(var_2, var_4,  this_rewriter),  this_rewriter); // R1 @var_1 == @var_3 && @var_2 == @var_4
          }
          else
          {
          }
        }
      }
      else
      {
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbf3ae0))), arg0, arg1);
  }

  static inline data_expression rewr_699_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_699_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_699_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_699_2(t[0], t[1], this_rewriter); }


  // [699] ==: @NatPair # @NatPair -> Bool
  static inline const data_expression& rewr_699_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddcc2950);
  }

  static inline data_expression rewr_699_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_699_0(this_rewriter); }

  static inline data_expression rewr_699_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_699_0(this_rewriter); }


  // [725] if: Bool # MarkingTrans # MarkingTrans -> MarkingTrans
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_725_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbf5580))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_725_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_725_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_725_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_725_3(t[0], t[1], t[2], this_rewriter); }


  // [725] if: Bool # MarkingTrans # MarkingTrans -> MarkingTrans
  static inline const data_expression& rewr_725_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee3700);
  }

  static inline data_expression rewr_725_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_725_0(this_rewriter); }

  static inline data_expression rewr_725_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_725_0(this_rewriter); }


  // [724] !=: MarkingTrans # MarkingTrans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_724_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_683_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbf5550))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_724_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_724_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_724_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_724_2(t[0], t[1], this_rewriter); }


  // [724] !=: MarkingTrans # MarkingTrans -> Bool
  static inline const data_expression& rewr_724_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddcc28d0);
  }

  static inline data_expression rewr_724_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_724_0(this_rewriter); }

  static inline data_expression rewr_724_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_724_0(this_rewriter); }


  // [683] ==: MarkingTrans # MarkingTrans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_683_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@S(@var_1, @@C(@to_pos(@var_0) != @to_pos(@var_1), @@R(false), @@C(@to_pos(@var_0) == @to_pos(@var_1), @@R(@equal_arguments(@var_0, @var_1)), @@M(@var_0, @@R(true), @@X))))))
    {
      const data_expression& var_0 = arg0; // S1a
      const data_expression& var_1 = arg1; // S1a
      if (rewr_332_2(delayed_rewr_815_1<data_expression>(var_0,  this_rewriter), delayed_rewr_815_1<data_expression>(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
      }
      else
      {
        if (rewr_83_2(rewr_815_1(var_0,  this_rewriter), rewr_815_1(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
        {
          return rewr_816_2(var_0, var_1,  this_rewriter); // R1 @equal_arguments(@var_0, @var_1)
        }
        else
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc9380))), arg0, arg1);
  }

  static inline data_expression rewr_683_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_683_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_683_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_683_2(t[0], t[1], this_rewriter); }


  // [815] @to_pos: MarkingTrans -> Pos
  template < class DATA_EXPR0>
  class delayed_rewr_815_1
  {
    protected:
      const DATA_EXPR0& m_t0;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_815_1(const DATA_EXPR0& t0, RewriterCompilingJitty* tr)
        : m_t0(t0), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_815_1(m_t0, this_rewriter);
      }
  };
  
  // [683] ==: MarkingTrans # MarkingTrans -> Bool
  static inline const data_expression& rewr_683_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddcc29b0);
  }

  static inline data_expression rewr_683_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_683_0(this_rewriter); }

  static inline data_expression rewr_683_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_683_0(this_rewriter); }


  // [720] if: Bool # Trans # Trans -> Trans
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_720_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbf5340))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_720_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_720_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_720_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_720_3(t[0], t[1], t[2], this_rewriter); }


  // [720] if: Bool # Trans # Trans -> Trans
  static inline const data_expression& rewr_720_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee5120);
  }

  static inline data_expression rewr_720_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_720_0(this_rewriter); }

  static inline data_expression rewr_720_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_720_0(this_rewriter); }


  // [425] !=: Trans # Trans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_425_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_81_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbbf870))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_425_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_425_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_425_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_425_2(t[0], t[1], this_rewriter); }


  // [425] !=: Trans # Trans -> Bool
  static inline const data_expression& rewr_425_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee51f0);
  }

  static inline data_expression rewr_425_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_425_0(this_rewriter); }

  static inline data_expression rewr_425_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_425_0(this_rewriter); }


  // [81] ==: Trans # Trans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_81_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@S(@var_1, @@C(@to_pos(@var_0) != @to_pos(@var_1), @@R(false), @@C(@to_pos(@var_0) == @to_pos(@var_1), @@R(@equal_arguments(@var_0, @var_1)), @@M(@var_0, @@R(true), @@X))))))
    {
      const data_expression& var_0 = arg0; // S1a
      const data_expression& var_1 = arg1; // S1a
      if (rewr_332_2(delayed_rewr_775_1<data_expression>(var_0,  this_rewriter), delayed_rewr_775_1<data_expression>(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
      }
      else
      {
        if (rewr_83_2(rewr_775_1(var_0,  this_rewriter), rewr_775_1(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
        {
          return rewr_776_2(var_0, var_1,  this_rewriter); // R1 @equal_arguments(@var_0, @var_1)
        }
        else
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb57660))), arg0, arg1);
  }

  static inline data_expression rewr_81_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_81_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_81_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_81_2(t[0], t[1], this_rewriter); }


  // [775] @to_pos: Trans -> Pos
  template < class DATA_EXPR0>
  class delayed_rewr_775_1
  {
    protected:
      const DATA_EXPR0& m_t0;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_775_1(const DATA_EXPR0& t0, RewriterCompilingJitty* tr)
        : m_t0(t0), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_775_1(m_t0, this_rewriter);
      }
  };
  
  // [81] ==: Trans # Trans -> Bool
  static inline const data_expression& rewr_81_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee3900);
  }

  static inline data_expression rewr_81_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_81_0(this_rewriter); }

  static inline data_expression rewr_81_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_81_0(this_rewriter); }


  // [716] if: Bool # PlaceTokens # PlaceTokens -> PlaceTokens
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_716_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbf5130))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_716_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_716_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_716_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_716_3(t[0], t[1], t[2], this_rewriter); }


  // [716] if: Bool # PlaceTokens # PlaceTokens -> PlaceTokens
  static inline const data_expression& rewr_716_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0d280);
  }

  static inline data_expression rewr_716_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_716_0(this_rewriter); }

  static inline data_expression rewr_716_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_716_0(this_rewriter); }


  // [362] !=: PlaceTokens # PlaceTokens -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_362_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_266_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5fbe0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_362_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_362_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_362_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_362_2(t[0], t[1], this_rewriter); }


  // [362] !=: PlaceTokens # PlaceTokens -> Bool
  static inline const data_expression& rewr_362_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0d130);
  }

  static inline data_expression rewr_362_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_362_0(this_rewriter); }

  static inline data_expression rewr_362_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_362_0(this_rewriter); }


  // [266] ==: PlaceTokens # PlaceTokens -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_266_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@S(@var_1, @@C(@to_pos(@var_0) != @to_pos(@var_1), @@R(false), @@C(@to_pos(@var_0) == @to_pos(@var_1), @@R(@equal_arguments(@var_0, @var_1)), @@M(@var_0, @@R(true), @@X))))))
    {
      const data_expression& var_0 = arg0; // S1a
      const data_expression& var_1 = arg1; // S1a
      if (rewr_332_2(delayed_rewr_795_1<data_expression>(var_0,  this_rewriter), delayed_rewr_795_1<data_expression>(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
      }
      else
      {
        if (rewr_83_2(rewr_795_1(var_0,  this_rewriter), rewr_795_1(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
        {
          return rewr_796_2(var_0, var_1,  this_rewriter); // R1 @equal_arguments(@var_0, @var_1)
        }
        else
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5b1d0))), arg0, arg1);
  }

  static inline data_expression rewr_266_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_266_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_266_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_266_2(t[0], t[1], this_rewriter); }


  // [795] @to_pos: PlaceTokens -> Pos
  template < class DATA_EXPR0>
  class delayed_rewr_795_1
  {
    protected:
      const DATA_EXPR0& m_t0;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_795_1(const DATA_EXPR0& t0, RewriterCompilingJitty* tr)
        : m_t0(t0), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_795_1(m_t0, this_rewriter);
      }
  };
  
  // [266] ==: PlaceTokens # PlaceTokens -> Bool
  static inline const data_expression& rewr_266_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddcb31b0);
  }

  static inline data_expression rewr_266_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_266_0(this_rewriter); }

  static inline data_expression rewr_266_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_266_0(this_rewriter); }


  // [711] if: Bool # Trans_name # Trans_name -> Trans_name
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_711_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbf4e30))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_711_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_711_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_711_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_711_3(t[0], t[1], t[2], this_rewriter); }


  // [711] if: Bool # Trans_name # Trans_name -> Trans_name
  static inline const data_expression& rewr_711_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee52b0);
  }

  static inline data_expression rewr_711_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_711_0(this_rewriter); }

  static inline data_expression rewr_711_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_711_0(this_rewriter); }


  // [710] !=: Trans_name # Trans_name -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_710_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_87_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbf4e00))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_710_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_710_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_710_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_710_2(t[0], t[1], this_rewriter); }


  // [710] !=: Trans_name # Trans_name -> Bool
  static inline const data_expression& rewr_710_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee3bc0);
  }

  static inline data_expression rewr_710_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_710_0(this_rewriter); }

  static inline data_expression rewr_710_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_710_0(this_rewriter); }


  // [87] ==: Trans_name # Trans_name -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_87_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@S(@var_1, @@C(@to_pos(@var_0) != @to_pos(@var_1), @@R(false), @@C(@to_pos(@var_0) == @to_pos(@var_1), @@R(@equal_arguments(@var_0, @var_1)), @@M(@var_0, @@R(true), @@X))))))
    {
      const data_expression& var_0 = arg0; // S1a
      const data_expression& var_1 = arg1; // S1a
      if (rewr_332_2(delayed_rewr_760_1<data_expression>(var_0,  this_rewriter), delayed_rewr_760_1<data_expression>(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
      }
      else
      {
        if (rewr_83_2(rewr_760_1(var_0,  this_rewriter), rewr_760_1(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
        {
          return rewr_761_2(var_0, var_1,  this_rewriter); // R1 @equal_arguments(@var_0, @var_1)
        }
        else
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb57e40))), arg0, arg1);
  }

  static inline data_expression rewr_87_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_87_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_87_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_87_2(t[0], t[1], this_rewriter); }


  // [760] @to_pos: Trans_name -> Pos
  template < class DATA_EXPR0>
  class delayed_rewr_760_1
  {
    protected:
      const DATA_EXPR0& m_t0;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_760_1(const DATA_EXPR0& t0, RewriterCompilingJitty* tr)
        : m_t0(t0), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_760_1(m_t0, this_rewriter);
      }
  };
  
  // [87] ==: Trans_name # Trans_name -> Bool
  static inline const data_expression& rewr_87_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddcc14f0);
  }

  static inline data_expression rewr_87_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_87_0(this_rewriter); }

  static inline data_expression rewr_87_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_87_0(this_rewriter); }


  // [706] if: Bool # Place # Place -> Place
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_706_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbf4bf0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_706_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_706_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_706_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_706_3(t[0], t[1], t[2], this_rewriter); }


  // [706] if: Bool # Place # Place -> Place
  static inline const data_expression& rewr_706_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0d250);
  }

  static inline data_expression rewr_706_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_706_0(this_rewriter); }

  static inline data_expression rewr_706_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_706_0(this_rewriter); }


  // [705] ==: Place # Place -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_705_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@S(@var_1, @@C(@to_pos(@var_0) != @to_pos(@var_1), @@R(false), @@C(@to_pos(@var_0) == @to_pos(@var_1), @@R(@equal_arguments(@var_0, @var_1)), @@M(@var_0, @@R(true), @@X))))))
    {
      const data_expression& var_0 = arg0; // S1a
      const data_expression& var_1 = arg1; // S1a
      if (rewr_332_2(delayed_rewr_745_1<data_expression>(var_0,  this_rewriter), delayed_rewr_745_1<data_expression>(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
      }
      else
      {
        if (rewr_83_2(rewr_745_1(var_0,  this_rewriter), rewr_745_1(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
        {
          return rewr_746_2(var_0, var_1,  this_rewriter); // R1 @equal_arguments(@var_0, @var_1)
        }
        else
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbf4bc0))), arg0, arg1);
  }

  static inline data_expression rewr_705_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_705_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_705_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_705_2(t[0], t[1], this_rewriter); }


  // [745] @to_pos: Place -> Pos
  template < class DATA_EXPR0>
  class delayed_rewr_745_1
  {
    protected:
      const DATA_EXPR0& m_t0;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_745_1(const DATA_EXPR0& t0, RewriterCompilingJitty* tr)
        : m_t0(t0), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_745_1(m_t0, this_rewriter);
      }
  };
  
  // [705] ==: Place # Place -> Bool
  static inline const data_expression& rewr_705_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee3e50);
  }

  static inline data_expression rewr_705_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_705_0(this_rewriter); }

  static inline data_expression rewr_705_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_705_0(this_rewriter); }


  // [315] !=: Place # Place -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_315_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_705_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5de70))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_315_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_315_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_315_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_315_2(t[0], t[1], this_rewriter); }


  // [315] !=: Place # Place -> Bool
  static inline const data_expression& rewr_315_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee3b90);
  }

  static inline data_expression rewr_315_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_315_0(this_rewriter); }

  static inline data_expression rewr_315_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_315_0(this_rewriter); }


  // [314] <: Place # Place -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_314_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@S(@var_1, @@C(@to_pos(@var_0) > @to_pos(@var_1), @@R(false), @@C(@to_pos(@var_0) == @to_pos(@var_1), @@R(@less_arguments(@var_0, @var_1)), @@C(@to_pos(@var_0) < @to_pos(@var_1), @@R(true), @@M(@var_0, @@R(false), @@X)))))))
    {
      const data_expression& var_0 = arg0; // S1a
      const data_expression& var_1 = arg1; // S1a
      if (rewr_704_2(delayed_rewr_745_1<data_expression>(var_0,  this_rewriter), delayed_rewr_745_1<data_expression>(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
      }
      else
      {
        if (rewr_83_2(rewr_745_1(var_0,  this_rewriter), rewr_745_1(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
        {
          return rewr_747_2(var_0, var_1,  this_rewriter); // R1 @less_arguments(@var_0, @var_1)
        }
        else
        {
          if (rewr_104_2(delayed_rewr_745_1<data_expression>(var_0,  this_rewriter), rewr_745_1(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
          }
          else
          {
            if (var_0 == arg1) // M
            {
              return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
            }
            else
            {
            }
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5dde0))), arg0, arg1);
  }

  static inline data_expression rewr_314_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_314_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_314_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_314_2(t[0], t[1], this_rewriter); }


  // [314] <: Place # Place -> Bool
  static inline const data_expression& rewr_314_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0d1c0);
  }

  static inline data_expression rewr_314_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_314_0(this_rewriter); }

  static inline data_expression rewr_314_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_314_0(this_rewriter); }


  // [704] >: Pos # Pos -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_704_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(@var_1 < @var_0))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_104_2(var_1, local_rewrite(var_0, this_rewriter),  this_rewriter); // R1 @var_1 < @var_0
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbf4a40))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_704_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_704_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_704_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_704_2(t[0], t[1], this_rewriter); }


  // [704] >: Pos # Pos -> Bool
  static inline const data_expression& rewr_704_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee50f0);
  }

  static inline data_expression rewr_704_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_704_0(this_rewriter); }

  static inline data_expression rewr_704_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_704_0(this_rewriter); }


  // [697] if: Bool # Pos # Pos -> Pos
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_697_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbf2b20))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_697_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_697_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_697_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_697_3(t[0], t[1], t[2], this_rewriter); }


  // [697] if: Bool # Pos # Pos -> Pos
  static inline const data_expression& rewr_697_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee5220);
  }

  static inline data_expression rewr_697_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_697_0(this_rewriter); }

  static inline data_expression rewr_697_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_697_0(this_rewriter); }


  // [692] <=: Pos # Pos -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_692_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(1, @@D(@@N(@@S(@var_0, @@R(true)))), @@X)
    {
      if (uint_address(arg0) == 0x5641ddb571b0) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@F(succ, @@S(@var_1, @@D(@@N(@@M(@var_0, @@R(true), @@F(1, @@R(false), @@F(@cDub, @@S(@var_2, @@N(@@S(@var_3, @@R(@var_1 < 2 * @var_3 + if(@var_2, 1, 0))))), @@X)))))), @@F(@cDub, @@S(@var_1, @@N(@@S(@var_2, @@D(@@N(@@M(@var_0, @@R(true), @@F(succ, @@S(@var_3, @@R(@pospred(2 * @var_2 + if(@var_1, 1, 0)) <= @var_3)), @@F(1, @@R(false), @@F(@cDub, @@S(@var_3, @@N(@@S(@var_4, @@R(if(@var_1 => @var_3, @var_2 <= @var_4, @var_2 < @var_4))))), @@X))))))))), @@N(@@M(@var_0, @@R(true), @@X)))))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb59040) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
        }
        else
        {
          if (uint_address(arg1) == 0x5641ddb571b0) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb57210) // F1
            {
              const data_expression& var_2 = down_cast<data_expression>(arg1[1]); // S2
              const data_expression& var_3 = down_cast<data_expression>(arg1[2]); // S2
              return rewr_104_2(var_1, rewr_80_2(var_2, var_3,  this_rewriter),  this_rewriter); // R1 @var_1 < 2 * @var_3 + if(@var_2, 1, 0)
            }
            else
            {
            }
          }
        }
      }
      else
      {
        if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb57210) // F1
        {
          const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
          const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb59040) // F1
            {
              const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
              return rewr_692_2(rewr_114_1(rewr_80_2(var_1, var_2,  this_rewriter),  this_rewriter), var_3,  this_rewriter); // R1 @pospred(2 * @var_2 + if(@var_1, 1, 0)) <= @var_3
            }
            else
            {
              if (uint_address(arg1) == 0x5641ddb571b0) // F1
              {
                return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
              }
              else
              {
                if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb57210) // F1
                {
                  const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
                  const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
                  return rewr_84_3(rewr_44_2(var_1, var_3,  this_rewriter), delayed_rewr_692_2<data_expression, data_expression>(var_2, var_4,  this_rewriter), delayed_rewr_104_2<data_expression, data_expression>(var_2, var_4,  this_rewriter),  this_rewriter); // R1 if(@var_1 => @var_3, @var_2 <= @var_4, @var_2 < @var_4)
                }
                else
                {
                }
              }
            }
          }
        }
        else
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbf1d40))), arg0, arg1);
  }

  static inline data_expression rewr_692_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_692_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_692_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_692_2(t[0], t[1], this_rewriter); }


  // [104] <: Pos # Pos -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_104_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_104_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_104_2(m_t0, m_t1, this_rewriter);
      }
  };
  
  // [692] <=: Pos # Pos -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_692_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_692_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_692_2(m_t0, m_t1, this_rewriter);
      }
  };
  
  // [692] <=: Pos # Pos -> Bool
  static inline const data_expression& rewr_692_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee5370);
  }

  static inline data_expression rewr_692_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_692_0(this_rewriter); }

  static inline data_expression rewr_692_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_692_0(this_rewriter); }


  // [332] !=: Pos # Pos -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_332_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_83_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5e9e0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_332_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_332_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_332_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_332_2(t[0], t[1], this_rewriter); }


  // [332] !=: Pos # Pos -> Bool
  static inline const data_expression& rewr_332_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee5280);
  }

  static inline data_expression rewr_332_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_332_0(this_rewriter); }

  static inline data_expression rewr_332_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_332_0(this_rewriter); }


  // [114] @pospred: Pos -> Pos
  template < class DATA_EXPR0>
  static inline data_expression rewr_114_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(@cDub, @@F(true, @@D(@@N(@@S(@var_0, @@R(2 * @var_0)))), @@F(false, @@D(@@N(@@F(@cDub, @@S(@var_0, @@N(@@S(@var_1, @@R(2 * @pospred(2 * @var_1 + if(@var_0, 1, 0)) + 1)))), @@F(1, @@R(1), @@D(@@X))))), @@D(@@X))), @@F(1, @@R(1), @@X))
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb57210) // F1
      {
        if (uint_address(arg0[1]) == 0x5641ddb557a0) // F2a true
        {
          const data_expression& t1 = down_cast<data_expression>(arg0[1]);
          const data_expression& var_0 = down_cast<data_expression>(arg0[2]); // S2
          return rewr_80_2(*reinterpret_cast<const data_expression*>(0x5641ddcc1390), var_0,  this_rewriter); // R1 2 * @var_0
        }
        else
        {
          if (uint_address(arg0[1]) == 0x5641ddb571e0) // F2a false
          {
            const data_expression& t1 = down_cast<data_expression>(arg0[1]);
            if (is_application_no_check(down_cast<data_expression>(arg0[2])) && uint_address(down_cast<data_expression>(arg0[2])[0]) == 0x5641ddb57210) // F2b @cDub
            {
              const data_expression& t2 = down_cast<data_expression>(arg0[2]);
              const data_expression& var_0 = down_cast<data_expression>(t2[1]); // S2
              const data_expression& var_1 = down_cast<data_expression>(t2[2]); // S2
              return rewr_80_2(*reinterpret_cast<const data_expression*>(0x5641ddcc2a10), rewr_114_1(rewr_80_2(var_0, var_1,  this_rewriter),  this_rewriter),  this_rewriter); // R1 2 * @pospred(2 * @var_1 + if(@var_0, 1, 0)) + 1
            }
            else
            {
              if (uint_address(arg0[2]) == 0x5641ddb571b0) // F2a @c1
              {
                const data_expression& t2 = down_cast<data_expression>(arg0[2]);
                return *reinterpret_cast<const data_expression*>(0x5641ddcc29e0); // R1 1
              }
              else
              {
              }
            }
          }
          else
          {
          }
        }
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb571b0) // F1
        {
          return *reinterpret_cast<const data_expression*>(0x5641ddcc29e0); // R1 1
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb59310))), arg0);
  }

  static inline data_expression rewr_114_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_114_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_114_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_114_1(t[0], this_rewriter); }


  // [114] @pospred: Pos -> Pos
  static inline const data_expression& rewr_114_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee5040);
  }

  static inline data_expression rewr_114_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_114_0(this_rewriter); }

  static inline data_expression rewr_114_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_114_0(this_rewriter); }


  // [104] <: Pos # Pos -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_104_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@N(@@F(1, @@R(false), @@X))
    {
      if (uint_address(arg1) == 0x5641ddb571b0) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
      }
      else
      {
      }
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@S(@var_0, @@F(1, @@D(@@N(@@M(@var_0, @@R(false), @@F(@cDub, @@N(@@R(true)), @@F(succ, @@R(true), @@X))))), @@F(@cDub, @@S(@var_1, @@N(@@S(@var_2, @@D(@@N(@@M(@var_0, @@R(false), @@F(succ, @@S(@var_3, @@R(2 * @var_2 + if(@var_1, 1, 0) <= @var_3)), @@F(@cDub, @@S(@var_3, @@N(@@S(@var_4, @@R(if(@var_3 => @var_1, @var_2 < @var_4, @var_2 <= @var_4))))), @@X)))))))), @@F(succ, @@S(@var_1, @@D(@@N(@@M(@var_0, @@R(false), @@F(@cDub, @@S(@var_2, @@N(@@S(@var_3, @@R(@var_1 < @pospred(2 * @var_3 + if(@var_2, 1, 0)))))), @@X))))), @@N(@@M(@var_0, @@R(false), @@X))))))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address(arg0) == 0x5641ddb571b0) // F1
      {
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
        }
        else
        {
          if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb57210) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb59040) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
            }
            else
            {
            }
          }
        }
      }
      else
      {
        if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb57210) // F1
        {
          const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
          const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb59040) // F1
            {
              const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
              return rewr_692_2(rewr_80_2(var_1, var_2,  this_rewriter), var_3,  this_rewriter); // R1 2 * @var_2 + if(@var_1, 1, 0) <= @var_3
            }
            else
            {
              if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb57210) // F1
              {
                const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
                const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
                return rewr_84_3(rewr_44_2(var_3, var_1,  this_rewriter), delayed_rewr_104_2<data_expression, data_expression>(var_2, var_4,  this_rewriter), delayed_rewr_692_2<data_expression, data_expression>(var_2, var_4,  this_rewriter),  this_rewriter); // R1 if(@var_3 => @var_1, @var_2 < @var_4, @var_2 <= @var_4)
              }
              else
              {
              }
            }
          }
        }
        else
        {
          if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb59040) // F1
          {
            const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
            if (var_0 == arg1) // M
            {
              return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
            }
            else
            {
              if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb57210) // F1
              {
                const data_expression& var_2 = down_cast<data_expression>(arg1[1]); // S2
                const data_expression& var_3 = down_cast<data_expression>(arg1[2]); // S2
                return rewr_104_2(var_1, rewr_114_1(rewr_80_2(var_2, var_3,  this_rewriter),  this_rewriter),  this_rewriter); // R1 @var_1 < @pospred(2 * @var_3 + if(@var_2, 1, 0))
              }
              else
              {
              }
            }
          }
          else
          {
            if (var_0 == arg1) // M
            {
              return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
            }
            else
            {
            }
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb59070))), arg0, arg1);
  }

  static inline data_expression rewr_104_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_104_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_104_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_104_2(t[0], t[1], this_rewriter); }


  // [104] <: Pos # Pos -> Bool
  static inline const data_expression& rewr_104_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0d1f0);
  }

  static inline data_expression rewr_104_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_104_0(this_rewriter); }

  static inline data_expression rewr_104_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_104_0(this_rewriter); }


  // [103] succ: Pos -> Pos
  template < class DATA_EXPR0>
  static inline data_expression rewr_103_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(@cDub, @@F(true, @@D(@@N(@@S(@var_0, @@R(2 * succ(@var_0))))), @@F(false, @@D(@@N(@@S(@var_0, @@R(2 * @var_0 + 1)))), @@D(@@X))), @@F(1, @@R(2), @@X))
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb57210) // F1
      {
        if (uint_address(arg0[1]) == 0x5641ddb557a0) // F2a true
        {
          const data_expression& t1 = down_cast<data_expression>(arg0[1]);
          const data_expression& var_0 = down_cast<data_expression>(arg0[2]); // S2
          return rewr_80_2(*reinterpret_cast<const data_expression*>(0x5641ddcc1390), rewr_103_1(var_0,  this_rewriter),  this_rewriter); // R1 2 * succ(@var_0)
        }
        else
        {
          if (uint_address(arg0[1]) == 0x5641ddb571e0) // F2a false
          {
            const data_expression& t1 = down_cast<data_expression>(arg0[1]);
            const data_expression& var_0 = down_cast<data_expression>(arg0[2]); // S2
            return rewr_80_2(*reinterpret_cast<const data_expression*>(0x5641ddcc2a10), var_0,  this_rewriter); // R1 2 * @var_0 + 1
          }
          else
          {
          }
        }
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb571b0) // F1
        {
          return *reinterpret_cast<const data_expression*>(0x5641ddcc2900); // R1 2
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb59040))), arg0);
  }

  static inline data_expression rewr_103_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_103_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_103_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_103_1(t[0], this_rewriter); }


  // [103] succ: Pos -> Pos
  static inline const data_expression& rewr_103_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddcc2a70);
  }

  static inline data_expression rewr_103_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_103_0(this_rewriter); }

  static inline data_expression rewr_103_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_103_0(this_rewriter); }


  // [83] ==: Pos # Pos -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_83_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@F(@cDub, @@S(@var_1, @@F(true, @@D(@@N(@@S(@var_2, @@D(@@N(@@M(@var_0, @@R(true), @@F(1, @@R(false), @@F(@cDub, @@M(@var_1, @@F(false, @@D(@@N(@@R(false))), @@N(@@S(@var_3, @@R(@var_2 == @var_3)))), @@F(false, @@D(@@N(@@R(false))), @@D(@@X))), @@F(succ, @@S(@var_3, @@R(@pospred(2 * @var_2 + if(@var_1, 1, 0)) == @var_3)), @@X))))))))), @@F(false, @@D(@@N(@@S(@var_2, @@D(@@N(@@M(@var_0, @@R(true), @@F(1, @@R(false), @@F(@cDub, @@M(@var_1, @@F(true, @@D(@@N(@@R(false))), @@N(@@S(@var_3, @@R(@var_2 == @var_3)))), @@F(true, @@D(@@N(@@R(false))), @@D(@@X))), @@F(succ, @@S(@var_3, @@R(@pospred(2 * @var_2 + if(@var_1, 1, 0)) == @var_3)), @@X))))))))), @@N(@@S(@var_2, @@D(@@N(@@M(@var_0, @@R(true), @@F(1, @@R(false), @@F(succ, @@S(@var_3, @@R(@pospred(2 * @var_2 + if(@var_1, 1, 0)) == @var_3)), @@F(@cDub, @@M(@var_1, @@N(@@S(@var_3, @@R(@var_2 == @var_3))), @@D(@@X)), @@X))))))))))), @@F(1, @@D(@@N(@@M(@var_0, @@R(true), @@F(succ, @@R(false), @@F(@cDub, @@N(@@R(false)), @@X))))), @@F(succ, @@S(@var_1, @@D(@@N(@@M(@var_0, @@R(true), @@F(@cDub, @@S(@var_2, @@N(@@S(@var_3, @@R(@var_1 == @pospred(2 * @var_3 + if(@var_2, 1, 0)))))), @@F(1, @@R(false), @@X)))))), @@N(@@M(@var_0, @@R(true), @@X))))))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb57210) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        if (uint_address(arg0[1]) == 0x5641ddb557a0) // F2a true
        {
          const data_expression& t1 = down_cast<data_expression>(arg0[1]);
          const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
          }
          else
          {
            if (uint_address(arg1) == 0x5641ddb571b0) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
            }
            else
            {
              if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb57210) // F1
              {
                if (var_1 == arg1[1]) // M
                {
                  if (uint_address(arg1[1]) == 0x5641ddb571e0) // F2a false
                  {
                    const data_expression& t3 = down_cast<data_expression>(arg1[1]);
                    return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
                  }
                  else
                  {
                    const data_expression& var_3 = down_cast<data_expression>(arg1[2]); // S2
                    return rewr_83_2(var_2, var_3,  this_rewriter); // R1 @var_2 == @var_3
                  }
                }
                else
                {
                  if (uint_address(arg1[1]) == 0x5641ddb571e0) // F2a false
                  {
                    const data_expression& t3 = down_cast<data_expression>(arg1[1]);
                    return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
                  }
                  else
                  {
                  }
                }
              }
              else
              {
                if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb59040) // F1
                {
                  const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
                  return rewr_83_2(rewr_114_1(rewr_80_2(var_1, var_2,  this_rewriter),  this_rewriter), var_3,  this_rewriter); // R1 @pospred(2 * @var_2 + if(@var_1, 1, 0)) == @var_3
                }
                else
                {
                }
              }
            }
          }
        }
        else
        {
          if (uint_address(arg0[1]) == 0x5641ddb571e0) // F2a false
          {
            const data_expression& t1 = down_cast<data_expression>(arg0[1]);
            const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
            if (var_0 == arg1) // M
            {
              return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
            }
            else
            {
              if (uint_address(arg1) == 0x5641ddb571b0) // F1
              {
                return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
              }
              else
              {
                if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb57210) // F1
                {
                  if (var_1 == arg1[1]) // M
                  {
                    if (uint_address(arg1[1]) == 0x5641ddb557a0) // F2a true
                    {
                      const data_expression& t3 = down_cast<data_expression>(arg1[1]);
                      return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
                    }
                    else
                    {
                      const data_expression& var_3 = down_cast<data_expression>(arg1[2]); // S2
                      return rewr_83_2(var_2, var_3,  this_rewriter); // R1 @var_2 == @var_3
                    }
                  }
                  else
                  {
                    if (uint_address(arg1[1]) == 0x5641ddb557a0) // F2a true
                    {
                      const data_expression& t3 = down_cast<data_expression>(arg1[1]);
                      return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
                    }
                    else
                    {
                    }
                  }
                }
                else
                {
                  if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb59040) // F1
                  {
                    const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
                    return rewr_83_2(rewr_114_1(rewr_80_2(var_1, var_2,  this_rewriter),  this_rewriter), var_3,  this_rewriter); // R1 @pospred(2 * @var_2 + if(@var_1, 1, 0)) == @var_3
                  }
                  else
                  {
                  }
                }
              }
            }
          }
          else
          {
            const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
            if (var_0 == arg1) // M
            {
              return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
            }
            else
            {
              if (uint_address(arg1) == 0x5641ddb571b0) // F1
              {
                return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
              }
              else
              {
                if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb59040) // F1
                {
                  const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
                  return rewr_83_2(rewr_114_1(rewr_80_2(var_1, var_2,  this_rewriter),  this_rewriter), var_3,  this_rewriter); // R1 @pospred(2 * @var_2 + if(@var_1, 1, 0)) == @var_3
                }
                else
                {
                  if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb57210) // F1
                  {
                    if (var_1 == arg1[1]) // M
                    {
                      const data_expression& var_3 = down_cast<data_expression>(arg1[2]); // S2
                      return rewr_83_2(var_2, var_3,  this_rewriter); // R1 @var_2 == @var_3
                    }
                    else
                    {
                    }
                  }
                  else
                  {
                  }
                }
              }
            }
          }
        }
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb571b0) // F1
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb59040) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
            }
            else
            {
              if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb57210) // F1
              {
                return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
              }
              else
              {
              }
            }
          }
        }
        else
        {
          if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb59040) // F1
          {
            const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
            if (var_0 == arg1) // M
            {
              return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
            }
            else
            {
              if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb57210) // F1
              {
                const data_expression& var_2 = down_cast<data_expression>(arg1[1]); // S2
                const data_expression& var_3 = down_cast<data_expression>(arg1[2]); // S2
                return rewr_83_2(var_1, rewr_114_1(rewr_80_2(var_2, var_3,  this_rewriter),  this_rewriter),  this_rewriter); // R1 @var_1 == @pospred(2 * @var_3 + if(@var_2, 1, 0))
              }
              else
              {
                if (uint_address(arg1) == 0x5641ddb571b0) // F1
                {
                  return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
                }
                else
                {
                }
              }
            }
          }
          else
          {
            if (var_0 == arg1) // M
            {
              return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
            }
            else
            {
            }
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb57a20))), arg0, arg1);
  }

  static inline data_expression rewr_83_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_83_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_83_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_83_2(t[0], t[1], this_rewriter); }


  // [83] ==: Pos # Pos -> Bool
  static inline const data_expression& rewr_83_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0ce30);
  }

  static inline data_expression rewr_83_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_83_0(this_rewriter); }

  static inline data_expression rewr_83_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_83_0(this_rewriter); }


  // [693] if: Bool # Nat # Nat -> Nat
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_693_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbf1ef0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_693_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_693_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_693_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_693_3(t[0], t[1], t[2], this_rewriter); }


  // [693] if: Bool # Nat # Nat -> Nat
  static inline const data_expression& rewr_693_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddcb30f0);
  }

  static inline data_expression rewr_693_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_693_0(this_rewriter); }

  static inline data_expression rewr_693_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_693_0(this_rewriter); }


  // [101] succ: Nat -> Pos
  template < class DATA_EXPR0>
  static inline data_expression rewr_101_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(@cNat, @@S(@var_0, @@R(succ(@var_0))), @@F(0, @@R(1), @@X))
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb559b0) // F1
      {
        const data_expression& var_0 = down_cast<data_expression>(arg0[1]); // S2
        return rewr_103_1(var_0,  this_rewriter); // R1 succ(@var_0)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb56fd0) // F1
        {
          return *reinterpret_cast<const data_expression*>(0x5641ddcc29e0); // R1 1
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb58fe0))), arg0);
  }

  static inline data_expression rewr_101_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_101_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_101_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_101_1(t[0], this_rewriter); }


  // [101] succ: Nat -> Pos
  static inline const data_expression& rewr_101_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0d390);
  }

  static inline data_expression rewr_101_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_101_0(this_rewriter); }

  static inline data_expression rewr_101_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_101_0(this_rewriter); }


  // [88] <: Nat # Nat -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_88_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@N(@@F(0, @@R(false), @@X))
    {
      if (uint_address(arg1) == 0x5641ddb56fd0) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
      }
      else
      {
      }
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@S(@var_0, @@F(@cNat, @@S(@var_1, @@D(@@N(@@M(@var_0, @@R(false), @@F(@cNat, @@S(@var_2, @@R(@var_1 < @var_2)), @@X))))), @@F(0, @@D(@@N(@@M(@var_0, @@R(false), @@F(@cNat, @@R(true), @@X)))), @@N(@@M(@var_0, @@R(false), @@X)))))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb559b0) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
        }
        else
        {
          if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb559b0) // F1
          {
            const data_expression& var_2 = down_cast<data_expression>(arg1[1]); // S2
            return rewr_104_2(var_1, var_2,  this_rewriter); // R1 @var_1 < @var_2
          }
          else
          {
          }
        }
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb56fd0) // F1
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb559b0) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
            }
            else
            {
            }
          }
        }
        else
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb57f00))), arg0, arg1);
  }

  static inline data_expression rewr_88_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_88_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_88_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_88_2(t[0], t[1], this_rewriter); }


  // [88] <: Nat # Nat -> Bool
  static inline const data_expression& rewr_88_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee54c0);
  }

  static inline data_expression rewr_88_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_88_0(this_rewriter); }

  static inline data_expression rewr_88_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_88_0(this_rewriter); }


  // [61] !=: Nat # Nat -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_61_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_35_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb56a60))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_61_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_61_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_61_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_61_2(t[0], t[1], this_rewriter); }


  // [61] !=: Nat # Nat -> Bool
  static inline const data_expression& rewr_61_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0d4f0);
  }

  static inline data_expression rewr_61_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_61_0(this_rewriter); }

  static inline data_expression rewr_61_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_61_0(this_rewriter); }


  // [35] ==: Nat # Nat -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_35_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@F(@cNat, @@S(@var_1, @@D(@@N(@@M(@var_0, @@R(true), @@F(@cNat, @@S(@var_2, @@R(@var_1 == @var_2)), @@F(0, @@R(false), @@X)))))), @@F(0, @@D(@@N(@@M(@var_0, @@R(true), @@F(@cNat, @@R(false), @@X)))), @@N(@@M(@var_0, @@R(true), @@X)))))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb559b0) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
        }
        else
        {
          if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb559b0) // F1
          {
            const data_expression& var_2 = down_cast<data_expression>(arg1[1]); // S2
            return rewr_83_2(var_1, var_2,  this_rewriter); // R1 @var_1 == @var_2
          }
          else
          {
            if (uint_address(arg1) == 0x5641ddb56fd0) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
            }
            else
            {
            }
          }
        }
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb56fd0) // F1
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb559b0) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
            }
            else
            {
            }
          }
        }
        else
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb55e60))), arg0, arg1);
  }

  static inline data_expression rewr_35_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_35_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_35_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_35_2(t[0], t[1], this_rewriter); }


  // [35] ==: Nat # Nat -> Bool
  static inline const data_expression& rewr_35_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee3650);
  }

  static inline data_expression rewr_35_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_35_0(this_rewriter); }

  static inline data_expression rewr_35_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_35_0(this_rewriter); }


  // [565] !=: Bool # Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_565_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_402_2(local_rewrite(var_0, this_rewriter), var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc5060))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_565_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_565_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_565_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_565_2(t[0], t[1], this_rewriter); }


  // [565] !=: Bool # Bool -> Bool
  static inline const data_expression& rewr_565_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddcb3060);
  }

  static inline data_expression rewr_565_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_565_0(this_rewriter); }

  static inline data_expression rewr_565_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_565_0(this_rewriter); }


  // [402] ==: Bool # Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_402_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@S(@var_0, @@R(!@var_0)))), @@F(true, @@D(@@N(@@S(@var_0, @@R(@var_0)))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
        return rewr_85_1(local_rewrite(var_0, this_rewriter),  this_rewriter); // R1 !@var_0
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@F(true, @@R(@var_0), @@F(false, @@R(!@var_0), @@X)))))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
        if (uint_address(arg1) == 0x5641ddb557a0) // F1
        {
          return var_0; // R1 @var_0
        }
        else
        {
          if (uint_address(arg1) == 0x5641ddb571e0) // F1
          {
            return rewr_85_1(var_0,  this_rewriter); // R1 !@var_0
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbbea90))), arg0, arg1);
  }

  static inline data_expression rewr_402_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_402_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_402_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_402_2(t[0], t[1], this_rewriter); }


  // [402] ==: Bool # Bool -> Bool
  static inline const data_expression& rewr_402_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddcc14c0);
  }

  static inline data_expression rewr_402_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_402_0(this_rewriter); }

  static inline data_expression rewr_402_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_402_0(this_rewriter); }


  // [85] !: Bool -> Bool
  template < class DATA_EXPR0>
  static inline data_expression rewr_85_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(!, @@S(@var_0, @@R(@var_0)), @@F(true, @@R(false), @@F(false, @@R(true), @@X)))
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb57db0) // F1
      {
        const data_expression& var_0 = down_cast<data_expression>(arg0[1]); // S2
        return var_0; // R1 @var_0
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
        }
        else
        {
          if (uint_address(arg0) == 0x5641ddb571e0) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb57db0))), arg0);
  }

  static inline data_expression rewr_85_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_85_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_85_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_85_1(t[0], this_rewriter); }


  // [85] !: Bool -> Bool
  static inline const data_expression& rewr_85_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0cb00);
  }

  static inline data_expression rewr_85_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_85_0(this_rewriter); }

  static inline data_expression rewr_85_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_85_0(this_rewriter); }


  // [84] if: Bool # Bool # Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_84_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb57d80))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_84_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_84_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_84_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_84_3(t[0], t[1], t[2], this_rewriter); }


  // [84] if: Bool # Bool # Bool -> Bool
  static inline const data_expression& rewr_84_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddcb3180);
  }

  static inline data_expression rewr_84_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_84_0(this_rewriter); }

  static inline data_expression rewr_84_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_84_0(this_rewriter); }


  // [82] ||: Bool # Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_82_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@S(@var_0, @@R(@var_0)))), @@F(true, @@D(@@N(@@S(@var_0, @@R(true)))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
        return local_rewrite(var_0, this_rewriter); // R1 @var_0
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@F(true, @@R(true), @@F(false, @@R(@var_0), @@X))))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address(arg1) == 0x5641ddb557a0) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
        if (uint_address(arg1) == 0x5641ddb571e0) // F1
        {
          return var_0; // R1 @var_0
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb57780))), arg0, arg1);
  }

  static inline data_expression rewr_82_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_82_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_82_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_82_2(t[0], t[1], this_rewriter); }


  // [82] ||: Bool # Bool -> Bool
  static inline const data_expression& rewr_82_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee3df0);
  }

  static inline data_expression rewr_82_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_82_0(this_rewriter); }

  static inline data_expression rewr_82_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_82_0(this_rewriter); }


  // [45] &&: Bool # Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_45_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@S(@var_0, @@R(false)))), @@F(true, @@D(@@N(@@S(@var_0, @@R(@var_0)))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@F(true, @@R(@var_0), @@F(false, @@R(false), @@X))))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address(arg1) == 0x5641ddb557a0) // F1
      {
        return var_0; // R1 @var_0
      }
      else
      {
        if (uint_address(arg1) == 0x5641ddb571e0) // F1
        {
          return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb561c0))), arg0, arg1);
  }

  static inline data_expression rewr_45_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_45_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_45_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_45_2(t[0], t[1], this_rewriter); }


  // [45] &&: Bool # Bool -> Bool
  static inline const data_expression& rewr_45_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0d4c0);
  }

  static inline data_expression rewr_45_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_45_0(this_rewriter); }

  static inline data_expression rewr_45_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_45_0(this_rewriter); }


  // [44] =>: Bool # Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_44_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@S(@var_0, @@R(true)))), @@F(true, @@D(@@N(@@S(@var_0, @@R(@var_0)))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@F(true, @@R(true), @@F(false, @@R(!@var_0), @@X))))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address(arg1) == 0x5641ddb557a0) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
        if (uint_address(arg1) == 0x5641ddb571e0) // F1
        {
          return rewr_85_1(var_0,  this_rewriter); // R1 !@var_0
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb56160))), arg0, arg1);
  }

  static inline data_expression rewr_44_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_44_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_44_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_44_2(t[0], t[1], this_rewriter); }


  // [44] =>: Bool # Bool -> Bool
  static inline const data_expression& rewr_44_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddecfe80);
  }

  static inline data_expression rewr_44_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_44_0(this_rewriter); }

  static inline data_expression rewr_44_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_44_0(this_rewriter); }


  // [678] if: Bool # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) -> (Place -> List(Nat)) # Trans_name -> MarkingTrans
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_678_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc8fc0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_678_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_678_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_678_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_678_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [678] if: Bool # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) -> (Place -> List(Nat)) # Trans_name -> MarkingTrans
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_678_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc8fc0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_678_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_678_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_678_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_678_3(t[0], t[1], t[2], this_rewriter); }


  // [678] if: Bool # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) -> (Place -> List(Nat)) # Trans_name -> MarkingTrans
  static inline const data_expression& rewr_678_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0cbc0);
  }

  static inline data_expression rewr_678_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_678_0(this_rewriter); }

  static inline data_expression rewr_678_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_678_0(this_rewriter); }


  // [677] !=: ((Place -> List(Nat)) # Trans_name -> MarkingTrans) # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_677_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_676_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc8f90))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_677_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_677_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_677_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_677_2(t[0], t[1], this_rewriter); }


  // [677] !=: ((Place -> List(Nat)) # Trans_name -> MarkingTrans) # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) -> Bool
  static inline const data_expression& rewr_677_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddcc2a40);
  }

  static inline data_expression rewr_677_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_677_0(this_rewriter); }

  static inline data_expression rewr_677_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_677_0(this_rewriter); }


  // [676] ==: ((Place -> List(Nat)) # Trans_name -> MarkingTrans) # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_676_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Place -> List(Nat), x3: Trans_name. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(0), rewr_683_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(1))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(1))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Place -> List(Nat), x3: Trans_name. @var_0(x1, x3) == @var_1(x1, x3)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc8f60))), arg0, arg1);
  }

  static inline data_expression rewr_676_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_676_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_676_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_676_2(t[0], t[1], this_rewriter); }


  // [676] ==: ((Place -> List(Nat)) # Trans_name -> MarkingTrans) # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) -> Bool
  static inline const data_expression& rewr_676_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0d520);
  }

  static inline data_expression rewr_676_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_676_0(this_rewriter); }

  static inline data_expression rewr_676_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_676_0(this_rewriter); }


  // [593] if: Bool # ((Place -> List(Nat)) # (Place -> List(Nat)) -> Bool) # ((Place -> List(Nat)) # (Place -> List(Nat)) -> Bool) -> (Place -> List(Nat)) # (Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_593_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc5fc0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_593_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_593_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_593_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_593_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [593] if: Bool # ((Place -> List(Nat)) # (Place -> List(Nat)) -> Bool) # ((Place -> List(Nat)) # (Place -> List(Nat)) -> Bool) -> (Place -> List(Nat)) # (Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_593_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc5fc0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_593_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_593_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_593_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_593_3(t[0], t[1], t[2], this_rewriter); }


  // [593] if: Bool # ((Place -> List(Nat)) # (Place -> List(Nat)) -> Bool) # ((Place -> List(Nat)) # (Place -> List(Nat)) -> Bool) -> (Place -> List(Nat)) # (Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_593_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0cc20);
  }

  static inline data_expression rewr_593_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_593_0(this_rewriter); }

  static inline data_expression rewr_593_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_593_0(this_rewriter); }


  // [592] !=: ((Place -> List(Nat)) # (Place -> List(Nat)) -> Bool) # ((Place -> List(Nat)) # (Place -> List(Nat)) -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_592_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_591_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc5f90))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_592_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_592_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_592_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_592_2(t[0], t[1], this_rewriter); }


  // [592] !=: ((Place -> List(Nat)) # (Place -> List(Nat)) -> Bool) # ((Place -> List(Nat)) # (Place -> List(Nat)) -> Bool) -> Bool
  static inline const data_expression& rewr_592_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee4860);
  }

  static inline data_expression rewr_592_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_592_0(this_rewriter); }

  static inline data_expression rewr_592_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_592_0(this_rewriter); }


  // [591] ==: ((Place -> List(Nat)) # (Place -> List(Nat)) -> Bool) # ((Place -> List(Nat)) # (Place -> List(Nat)) -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_591_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: Place -> List(Nat). @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(1), rewr_402_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(2))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(2)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: Place -> List(Nat). @var_0(x1, x3) == @var_1(x1, x3)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc5f60))), arg0, arg1);
  }

  static inline data_expression rewr_591_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_591_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_591_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_591_2(t[0], t[1], this_rewriter); }


  // [591] ==: ((Place -> List(Nat)) # (Place -> List(Nat)) -> Bool) # ((Place -> List(Nat)) # (Place -> List(Nat)) -> Bool) -> Bool
  static inline const data_expression& rewr_591_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee4770);
  }

  static inline data_expression rewr_591_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_591_0(this_rewriter); }

  static inline data_expression rewr_591_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_591_0(this_rewriter); }


  // [586] if: Bool # (Trans_name # Trans_name -> Bool) # (Trans_name # Trans_name -> Bool) -> Trans_name # Trans_name -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_586_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc5ae0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_586_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_586_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_586_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_586_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [586] if: Bool # (Trans_name # Trans_name -> Bool) # (Trans_name # Trans_name -> Bool) -> Trans_name # Trans_name -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_586_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc5ae0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_586_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_586_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_586_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_586_3(t[0], t[1], t[2], this_rewriter); }


  // [586] if: Bool # (Trans_name # Trans_name -> Bool) # (Trans_name # Trans_name -> Bool) -> Trans_name # Trans_name -> Bool
  static inline const data_expression& rewr_586_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0d3f0);
  }

  static inline data_expression rewr_586_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_586_0(this_rewriter); }

  static inline data_expression rewr_586_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_586_0(this_rewriter); }


  // [585] !=: (Trans_name # Trans_name -> Bool) # (Trans_name # Trans_name -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_585_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_584_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc5ab0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_585_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_585_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_585_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_585_2(t[0], t[1], this_rewriter); }


  // [585] !=: (Trans_name # Trans_name -> Bool) # (Trans_name # Trans_name -> Bool) -> Bool
  static inline const data_expression& rewr_585_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee4800);
  }

  static inline data_expression rewr_585_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_585_0(this_rewriter); }

  static inline data_expression rewr_585_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_585_0(this_rewriter); }


  // [584] ==: (Trans_name # Trans_name -> Bool) # (Trans_name # Trans_name -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_584_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: Trans_name. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(2), rewr_402_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(3)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(1))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(3)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(1)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: Trans_name. @var_0(x1, x3) == @var_1(x1, x3)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc5a80))), arg0, arg1);
  }

  static inline data_expression rewr_584_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_584_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_584_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_584_2(t[0], t[1], this_rewriter); }


  // [584] ==: (Trans_name # Trans_name -> Bool) # (Trans_name # Trans_name -> Bool) -> Bool
  static inline const data_expression& rewr_584_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0d490);
  }

  static inline data_expression rewr_584_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_584_0(this_rewriter); }

  static inline data_expression rewr_584_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_584_0(this_rewriter); }


  // [579] if: Bool # (Trans -> Trans_name) # (Trans -> Trans_name) -> Trans -> Trans_name
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_579_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_0(@var_2)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc56c0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_579_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_579_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_579_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_579_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [579] if: Bool # (Trans -> Trans_name) # (Trans -> Trans_name) -> Trans -> Trans_name
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_579_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc56c0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_579_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_579_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_579_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_579_3(t[0], t[1], t[2], this_rewriter); }


  // [579] if: Bool # (Trans -> Trans_name) # (Trans -> Trans_name) -> Trans -> Trans_name
  static inline const data_expression& rewr_579_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddecfe50);
  }

  static inline data_expression rewr_579_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_579_0(this_rewriter); }

  static inline data_expression rewr_579_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_579_0(this_rewriter); }


  // [578] !=: (Trans -> Trans_name) # (Trans -> Trans_name) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_578_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_577_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc5690))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_578_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_578_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_578_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_578_2(t[0], t[1], this_rewriter); }


  // [578] !=: (Trans -> Trans_name) # (Trans -> Trans_name) -> Bool
  static inline const data_expression& rewr_578_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0d100);
  }

  static inline data_expression rewr_578_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_578_0(this_rewriter); }

  static inline data_expression rewr_578_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_578_0(this_rewriter); }


  // [577] ==: (Trans -> Trans_name) # (Trans -> Trans_name) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_577_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Trans. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(3), rewr_87_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(4))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(4))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Trans. @var_0(x1) == @var_1(x1)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc5660))), arg0, arg1);
  }

  static inline data_expression rewr_577_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_577_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_577_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_577_2(t[0], t[1], this_rewriter); }


  // [577] ==: (Trans -> Trans_name) # (Trans -> Trans_name) -> Bool
  static inline const data_expression& rewr_577_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0d660);
  }

  static inline data_expression rewr_577_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_577_0(this_rewriter); }

  static inline data_expression rewr_577_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_577_0(this_rewriter); }


  // [568] if: Bool # (Bool -> Bool) # (Bool -> Bool) -> Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_568_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_0(@var_2)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc5120))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_568_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_568_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_568_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_568_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [568] if: Bool # (Bool -> Bool) # (Bool -> Bool) -> Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_568_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc5120))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_568_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_568_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_568_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_568_3(t[0], t[1], t[2], this_rewriter); }


  // [568] if: Bool # (Bool -> Bool) # (Bool -> Bool) -> Bool -> Bool
  static inline const data_expression& rewr_568_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee48f0);
  }

  static inline data_expression rewr_568_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_568_0(this_rewriter); }

  static inline data_expression rewr_568_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_568_0(this_rewriter); }


  // [567] !=: (Bool -> Bool) # (Bool -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_567_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_566_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc50f0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_567_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_567_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_567_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_567_2(t[0], t[1], this_rewriter); }


  // [567] !=: (Bool -> Bool) # (Bool -> Bool) -> Bool
  static inline const data_expression& rewr_567_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0d6c0);
  }

  static inline data_expression rewr_567_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_567_0(this_rewriter); }

  static inline data_expression rewr_567_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_567_0(this_rewriter); }


  // [566] ==: (Bool -> Bool) # (Bool -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_566_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Bool. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(4), rewr_402_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(5))), this_rewriter), delayed_application1<data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(5)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Bool. @var_0(x1) == @var_1(x1)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc50c0))), arg0, arg1);
  }

  static inline data_expression rewr_566_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_566_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_566_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_566_2(t[0], t[1], this_rewriter); }


  // [566] ==: (Bool -> Bool) # (Bool -> Bool) -> Bool
  static inline const data_expression& rewr_566_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0d070);
  }

  static inline data_expression rewr_566_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_566_0(this_rewriter); }

  static inline data_expression rewr_566_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_566_0(this_rewriter); }


  // [555] if: Bool # (Bool # Bool # Bool -> Bool) # (Bool # Bool # Bool -> Bool) -> Bool # Bool # Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4, class DATA_EXPR5>
  static inline data_expression rewr_555_6(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, const DATA_EXPR5& arg_not_nf5, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_1(@var_2, @var_3, @var_4)))))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_0(@var_2, @var_3, @var_4)))))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter), local_rewrite(var_4, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3, @var_4)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter), local_rewrite(var_4, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3, @var_4)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_1(@var_2, @var_3, @var_4)))))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter), local_rewrite(var_4, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3, @var_4)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc4a30))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter), local_rewrite(arg_not_nf5,this_rewriter));
  }

  static inline data_expression rewr_555_6_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_555_6(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_555_6_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_555_6(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], t[2], this_rewriter); }


  // [555] if: Bool # (Bool # Bool # Bool -> Bool) # (Bool # Bool # Bool -> Bool) -> Bool # Bool # Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_555_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc4a30))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_555_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_555_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_555_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_555_3(t[0], t[1], t[2], this_rewriter); }


  // [555] if: Bool # (Bool # Bool # Bool -> Bool) # (Bool # Bool # Bool -> Bool) -> Bool # Bool # Bool -> Bool
  static inline const data_expression& rewr_555_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee53d0);
  }

  static inline data_expression rewr_555_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_555_0(this_rewriter); }

  static inline data_expression rewr_555_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_555_0(this_rewriter); }


  // [554] !=: (Bool # Bool # Bool -> Bool) # (Bool # Bool # Bool -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_554_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_553_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc4a00))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_554_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_554_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_554_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_554_2(t[0], t[1], this_rewriter); }


  // [554] !=: (Bool # Bool # Bool -> Bool) # (Bool # Bool # Bool -> Bool) -> Bool
  static inline const data_expression& rewr_554_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0d0a0);
  }

  static inline data_expression rewr_554_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_554_0(this_rewriter); }

  static inline data_expression rewr_554_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_554_0(this_rewriter); }


  // [553] ==: (Bool # Bool # Bool -> Bool) # (Bool # Bool # Bool -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_553_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x2,x5: Bool. @var_0(x1, x2, x5) == @var_1(x1, x2, x5)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(5), rewr_402_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(5)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(6)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(7))), this_rewriter), delayed_application3<data_expression,data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(5)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(6)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(7)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x2,x5: Bool. @var_0(x1, x2, x5) == @var_1(x1, x2, x5)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc49d0))), arg0, arg1);
  }

  static inline data_expression rewr_553_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_553_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_553_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_553_2(t[0], t[1], this_rewriter); }


  // [553] ==: (Bool # Bool # Bool -> Bool) # (Bool # Bool # Bool -> Bool) -> Bool
  static inline const data_expression& rewr_553_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddeebd50);
  }

  static inline data_expression rewr_553_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_553_0(this_rewriter); }

  static inline data_expression rewr_553_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_553_0(this_rewriter); }


  // [548] if: Bool # (Pos # Pos -> Bool) # (Pos # Pos -> Bool) -> Pos # Pos -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_548_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc4580))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_548_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_548_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_548_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_548_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [548] if: Bool # (Pos # Pos -> Bool) # (Pos # Pos -> Bool) -> Pos # Pos -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_548_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc4580))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_548_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_548_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_548_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_548_3(t[0], t[1], t[2], this_rewriter); }


  // [548] if: Bool # (Pos # Pos -> Bool) # (Pos # Pos -> Bool) -> Pos # Pos -> Bool
  static inline const data_expression& rewr_548_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee4670);
  }

  static inline data_expression rewr_548_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_548_0(this_rewriter); }

  static inline data_expression rewr_548_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_548_0(this_rewriter); }


  // [547] !=: (Pos # Pos -> Bool) # (Pos # Pos -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_547_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_546_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc4550))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_547_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_547_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_547_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_547_2(t[0], t[1], this_rewriter); }


  // [547] !=: (Pos # Pos -> Bool) # (Pos # Pos -> Bool) -> Bool
  static inline const data_expression& rewr_547_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee3270);
  }

  static inline data_expression rewr_547_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_547_0(this_rewriter); }

  static inline data_expression rewr_547_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_547_0(this_rewriter); }


  // [546] ==: (Pos # Pos -> Bool) # (Pos # Pos -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_546_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: Pos. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(6), rewr_402_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(8)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(9))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(8)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(9)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: Pos. @var_0(x1, x3) == @var_1(x1, x3)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc4520))), arg0, arg1);
  }

  static inline data_expression rewr_546_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_546_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_546_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_546_2(t[0], t[1], this_rewriter); }


  // [546] ==: (Pos # Pos -> Bool) # (Pos # Pos -> Bool) -> Bool
  static inline const data_expression& rewr_546_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddcc5d40);
  }

  static inline data_expression rewr_546_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_546_0(this_rewriter); }

  static inline data_expression rewr_546_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_546_0(this_rewriter); }


  // [541] if: Bool # (Trans # Trans -> Bool) # (Trans # Trans -> Bool) -> Trans # Trans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_541_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc40d0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_541_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_541_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_541_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_541_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [541] if: Bool # (Trans # Trans -> Bool) # (Trans # Trans -> Bool) -> Trans # Trans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_541_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc40d0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_541_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_541_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_541_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_541_3(t[0], t[1], t[2], this_rewriter); }


  // [541] if: Bool # (Trans # Trans -> Bool) # (Trans # Trans -> Bool) -> Trans # Trans -> Bool
  static inline const data_expression& rewr_541_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddeebf00);
  }

  static inline data_expression rewr_541_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_541_0(this_rewriter); }

  static inline data_expression rewr_541_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_541_0(this_rewriter); }


  // [540] !=: (Trans # Trans -> Bool) # (Trans # Trans -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_540_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_539_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc40a0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_540_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_540_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_540_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_540_2(t[0], t[1], this_rewriter); }


  // [540] !=: (Trans # Trans -> Bool) # (Trans # Trans -> Bool) -> Bool
  static inline const data_expression& rewr_540_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddcc5c80);
  }

  static inline data_expression rewr_540_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_540_0(this_rewriter); }

  static inline data_expression rewr_540_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_540_0(this_rewriter); }


  // [539] ==: (Trans # Trans -> Bool) # (Trans # Trans -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_539_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: Trans. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(7), rewr_402_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(4)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(10))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(4)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(10)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: Trans. @var_0(x1, x3) == @var_1(x1, x3)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc4070))), arg0, arg1);
  }

  static inline data_expression rewr_539_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_539_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_539_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_539_2(t[0], t[1], this_rewriter); }


  // [539] ==: (Trans # Trans -> Bool) # (Trans # Trans -> Bool) -> Bool
  static inline const data_expression& rewr_539_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddcc57f0);
  }

  static inline data_expression rewr_539_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_539_0(this_rewriter); }

  static inline data_expression rewr_539_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_539_0(this_rewriter); }


  // [534] if: Bool # (Bool # Pos -> Pos) # (Bool # Pos -> Pos) -> Bool # Pos -> Pos
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_534_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc3bf0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_534_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_534_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_534_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_534_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [534] if: Bool # (Bool # Pos -> Pos) # (Bool # Pos -> Pos) -> Bool # Pos -> Pos
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_534_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc3bf0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_534_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_534_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_534_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_534_3(t[0], t[1], t[2], this_rewriter); }


  // [534] if: Bool # (Bool # Pos -> Pos) # (Bool # Pos -> Pos) -> Bool # Pos -> Pos
  static inline const data_expression& rewr_534_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddcc5820);
  }

  static inline data_expression rewr_534_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_534_0(this_rewriter); }

  static inline data_expression rewr_534_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_534_0(this_rewriter); }


  // [533] !=: (Bool # Pos -> Pos) # (Bool # Pos -> Pos) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_533_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_532_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc3bc0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_533_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_533_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_533_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_533_2(t[0], t[1], this_rewriter); }


  // [533] !=: (Bool # Pos -> Pos) # (Bool # Pos -> Pos) -> Bool
  static inline const data_expression& rewr_533_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddcc5850);
  }

  static inline data_expression rewr_533_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_533_0(this_rewriter); }

  static inline data_expression rewr_533_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_533_0(this_rewriter); }


  // [532] ==: (Bool # Pos -> Pos) # (Bool # Pos -> Pos) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_532_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Bool, x3: Pos. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(8), rewr_83_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(5)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(9))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(5)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(9))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Bool, x3: Pos. @var_0(x1, x3) == @var_1(x1, x3)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc3b90))), arg0, arg1);
  }

  static inline data_expression rewr_532_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_532_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_532_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_532_2(t[0], t[1], this_rewriter); }


  // [532] ==: (Bool # Pos -> Pos) # (Bool # Pos -> Pos) -> Bool
  static inline const data_expression& rewr_532_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0dc90);
  }

  static inline data_expression rewr_532_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_532_0(this_rewriter); }

  static inline data_expression rewr_532_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_532_0(this_rewriter); }


  // [527] if: Bool # (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) # (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) -> Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4, class DATA_EXPR5, class DATA_EXPR6>
  static inline data_expression rewr_527_7(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, const DATA_EXPR5& arg_not_nf5, const DATA_EXPR6& arg_not_nf6, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@N(@@S(@var_5, @@R(@var_1(@var_2, @var_3, @var_4)(@var_5)))))))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@N(@@S(@var_5, @@R(@var_0(@var_2, @var_3, @var_4)(@var_5)))))))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
        const DATA_EXPR6& var_5 = arg_not_nf6; // S1b
        return rewrite_with_arguments_in_normal_form(application(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter), local_rewrite(var_4, this_rewriter)), local_rewrite(var_5, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3, @var_4)(@var_5)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
          const DATA_EXPR6& var_5 = arg_not_nf6; // S1b
          return rewrite_with_arguments_in_normal_form(application(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter), local_rewrite(var_4, this_rewriter)), local_rewrite(var_5, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3, @var_4)(@var_5)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@N(@@S(@var_5, @@R(@var_1(@var_2, @var_3, @var_4)(@var_5)))))))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
        const DATA_EXPR6& var_5 = arg_not_nf6; // S1b
        return rewrite_with_arguments_in_normal_form(application(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter), local_rewrite(var_4, this_rewriter)), local_rewrite(var_5, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3, @var_4)(@var_5)
      }
      else
      {
      }
    }
    return application(application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc3740))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter), local_rewrite(arg_not_nf5,this_rewriter)), local_rewrite(arg_not_nf6,this_rewriter));
  }

  static inline data_expression rewr_527_7_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_527_7(term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[2], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_527_7_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_527_7(down_cast<application>(down_cast<application>(t.head()).head())[0], down_cast<application>(down_cast<application>(t.head()).head())[1], down_cast<application>(down_cast<application>(t.head()).head())[2], down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [527] if: Bool # (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) # (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) -> Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4, class DATA_EXPR5>
  static inline data_expression rewr_527_6(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, const DATA_EXPR5& arg_not_nf5, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_1(@var_2, @var_3, @var_4)))))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_0(@var_2, @var_3, @var_4)))))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter), local_rewrite(var_4, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3, @var_4)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter), local_rewrite(var_4, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3, @var_4)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_1(@var_2, @var_3, @var_4)))))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter), local_rewrite(var_4, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3, @var_4)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc3740))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter), local_rewrite(arg_not_nf5,this_rewriter));
  }

  static inline data_expression rewr_527_6_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_527_6(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_527_6_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_527_6(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], t[2], this_rewriter); }


  // [527] if: Bool # (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) # (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) -> Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_527_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc3740))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_527_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_527_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_527_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_527_3(t[0], t[1], t[2], this_rewriter); }


  // [527] if: Bool # (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) # (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) -> Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)
  static inline const data_expression& rewr_527_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0dcf0);
  }

  static inline data_expression rewr_527_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_527_0(this_rewriter); }

  static inline data_expression rewr_527_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_527_0(this_rewriter); }


  // [526] !=: (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) # (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_526_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_525_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc3710))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_526_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_526_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_526_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_526_2(t[0], t[1], this_rewriter); }


  // [526] !=: (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) # (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_526_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee4580);
  }

  static inline data_expression rewr_526_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_526_0(this_rewriter); }

  static inline data_expression rewr_526_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_526_0(this_rewriter); }


  // [525] ==: (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) # (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_525_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Bool, x2,x5: Place -> List(Nat). @var_0(x1, x2, x5) == @var_1(x1, x2, x5)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(9), rewr_89_2(delayed_application3<data_expression,data_expression,data_expression,data_expression>(local_rewrite(var_0, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(5)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(11)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(12)), this_rewriter), delayed_application3<data_expression,data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(5)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(11)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(12)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Bool, x2,x5: Place -> List(Nat). @var_0(x1, x2, x5) == @var_1(x1, x2, x5)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc36e0))), arg0, arg1);
  }

  static inline data_expression rewr_525_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_525_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_525_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_525_2(t[0], t[1], this_rewriter); }


  // [525] ==: (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) # (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_525_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0e860);
  }

  static inline data_expression rewr_525_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_525_0(this_rewriter); }

  static inline data_expression rewr_525_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_525_0(this_rewriter); }


  // [520] if: Bool # (Nat # List(Nat) -> List(Nat)) # (Nat # List(Nat) -> List(Nat)) -> Nat # List(Nat) -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_520_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc3290))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_520_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_520_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_520_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_520_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [520] if: Bool # (Nat # List(Nat) -> List(Nat)) # (Nat # List(Nat) -> List(Nat)) -> Nat # List(Nat) -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_520_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc3290))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_520_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_520_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_520_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_520_3(t[0], t[1], t[2], this_rewriter); }


  // [520] if: Bool # (Nat # List(Nat) -> List(Nat)) # (Nat # List(Nat) -> List(Nat)) -> Nat # List(Nat) -> List(Nat)
  static inline const data_expression& rewr_520_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0e770);
  }

  static inline data_expression rewr_520_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_520_0(this_rewriter); }

  static inline data_expression rewr_520_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_520_0(this_rewriter); }


  // [519] !=: (Nat # List(Nat) -> List(Nat)) # (Nat # List(Nat) -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_519_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_518_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc3260))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_519_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_519_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_519_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_519_2(t[0], t[1], this_rewriter); }


  // [519] !=: (Nat # List(Nat) -> List(Nat)) # (Nat # List(Nat) -> List(Nat)) -> Bool
  static inline const data_expression& rewr_519_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0e830);
  }

  static inline data_expression rewr_519_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_519_0(this_rewriter); }

  static inline data_expression rewr_519_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_519_0(this_rewriter); }


  // [518] ==: (Nat # List(Nat) -> List(Nat)) # (Nat # List(Nat) -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_518_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Nat, x3: List(Nat). @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(10), rewr_299_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(13)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(14))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(13)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(14))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Nat, x3: List(Nat). @var_0(x1, x3) == @var_1(x1, x3)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc3230))), arg0, arg1);
  }

  static inline data_expression rewr_518_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_518_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_518_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_518_2(t[0], t[1], this_rewriter); }


  // [518] ==: (Nat # List(Nat) -> List(Nat)) # (Nat # List(Nat) -> List(Nat)) -> Bool
  static inline const data_expression& rewr_518_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0d970);
  }

  static inline data_expression rewr_518_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_518_0(this_rewriter); }

  static inline data_expression rewr_518_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_518_0(this_rewriter); }


  // [513] if: Bool # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) -> (Place -> List(Nat)) # Trans -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4, class DATA_EXPR5>
  static inline data_expression rewr_513_6(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, const DATA_EXPR5& arg_not_nf5, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_1(@var_2, @var_3)(@var_4)))))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_0(@var_2, @var_3)(@var_4)))))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
        return rewrite_with_arguments_in_normal_form(application(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), local_rewrite(var_4, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)(@var_4)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
          return rewrite_with_arguments_in_normal_form(application(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), local_rewrite(var_4, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3)(@var_4)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_1(@var_2, @var_3)(@var_4)))))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
        return rewrite_with_arguments_in_normal_form(application(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), local_rewrite(var_4, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)(@var_4)
      }
      else
      {
      }
    }
    return application(application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc2de0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter)), local_rewrite(arg_not_nf5,this_rewriter));
  }

  static inline data_expression rewr_513_6_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_513_6(term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[2], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_513_6_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_513_6(down_cast<application>(down_cast<application>(t.head()).head())[0], down_cast<application>(down_cast<application>(t.head()).head())[1], down_cast<application>(down_cast<application>(t.head()).head())[2], down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], t[0], this_rewriter); }


  // [513] if: Bool # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) -> (Place -> List(Nat)) # Trans -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_513_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc2de0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_513_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_513_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_513_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_513_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [513] if: Bool # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) -> (Place -> List(Nat)) # Trans -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_513_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc2de0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_513_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_513_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_513_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_513_3(t[0], t[1], t[2], this_rewriter); }


  // [513] if: Bool # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) -> (Place -> List(Nat)) # Trans -> Place -> List(Nat)
  static inline const data_expression& rewr_513_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0dde0);
  }

  static inline data_expression rewr_513_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_513_0(this_rewriter); }

  static inline data_expression rewr_513_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_513_0(this_rewriter); }


  // [512] !=: ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_512_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_511_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc2db0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_512_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_512_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_512_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_512_2(t[0], t[1], this_rewriter); }


  // [512] !=: ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_512_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddeeafc0);
  }

  static inline data_expression rewr_512_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_512_0(this_rewriter); }

  static inline data_expression rewr_512_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_512_0(this_rewriter); }


  // [511] ==: ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_511_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Place -> List(Nat), x3: Trans. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(11), rewr_89_2(delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_0, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(10)), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(10)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Place -> List(Nat), x3: Trans. @var_0(x1, x3) == @var_1(x1, x3)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc2d80))), arg0, arg1);
  }

  static inline data_expression rewr_511_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_511_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_511_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_511_2(t[0], t[1], this_rewriter); }


  // [511] ==: ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_511_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0e0a0);
  }

  static inline data_expression rewr_511_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_511_0(this_rewriter); }

  static inline data_expression rewr_511_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_511_0(this_rewriter); }


  // [506] if: Bool # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) -> PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_506_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc2930))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_506_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_506_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_506_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_506_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [506] if: Bool # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) -> PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_506_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc2930))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_506_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_506_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_506_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_506_3(t[0], t[1], t[2], this_rewriter); }


  // [506] if: Bool # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) -> PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)
  static inline const data_expression& rewr_506_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0dac0);
  }

  static inline data_expression rewr_506_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_506_0(this_rewriter); }

  static inline data_expression rewr_506_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_506_0(this_rewriter); }


  // [505] !=: (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_505_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_504_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc2900))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_505_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_505_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_505_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_505_2(t[0], t[1], this_rewriter); }


  // [505] !=: (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) -> Bool
  static inline const data_expression& rewr_505_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddeeb070);
  }

  static inline data_expression rewr_505_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_505_0(this_rewriter); }

  static inline data_expression rewr_505_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_505_0(this_rewriter); }


  // [504] ==: (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_504_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: PlaceTokens, x3: List(PlaceTokens). @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(12), rewr_265_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(15)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(16))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(15)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(16))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: PlaceTokens, x3: List(PlaceTokens). @var_0(x1, x3) == @var_1(x1, x3)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc28d0))), arg0, arg1);
  }

  static inline data_expression rewr_504_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_504_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_504_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_504_2(t[0], t[1], this_rewriter); }


  // [504] ==: (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) -> Bool
  static inline const data_expression& rewr_504_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddeeaf90);
  }

  static inline data_expression rewr_504_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_504_0(this_rewriter); }

  static inline data_expression rewr_504_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_504_0(this_rewriter); }


  // [499] if: Bool # (List(Nat) # List(Nat) -> List(Nat)) # (List(Nat) # List(Nat) -> List(Nat)) -> List(Nat) # List(Nat) -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_499_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc2480))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_499_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_499_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_499_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_499_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [499] if: Bool # (List(Nat) # List(Nat) -> List(Nat)) # (List(Nat) # List(Nat) -> List(Nat)) -> List(Nat) # List(Nat) -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_499_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc2480))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_499_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_499_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_499_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_499_3(t[0], t[1], t[2], this_rewriter); }


  // [499] if: Bool # (List(Nat) # List(Nat) -> List(Nat)) # (List(Nat) # List(Nat) -> List(Nat)) -> List(Nat) # List(Nat) -> List(Nat)
  static inline const data_expression& rewr_499_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0e7d0);
  }

  static inline data_expression rewr_499_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_499_0(this_rewriter); }

  static inline data_expression rewr_499_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_499_0(this_rewriter); }


  // [498] !=: (List(Nat) # List(Nat) -> List(Nat)) # (List(Nat) # List(Nat) -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_498_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_497_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc2450))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_498_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_498_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_498_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_498_2(t[0], t[1], this_rewriter); }


  // [498] !=: (List(Nat) # List(Nat) -> List(Nat)) # (List(Nat) # List(Nat) -> List(Nat)) -> Bool
  static inline const data_expression& rewr_498_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0da60);
  }

  static inline data_expression rewr_498_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_498_0(this_rewriter); }

  static inline data_expression rewr_498_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_498_0(this_rewriter); }


  // [497] ==: (List(Nat) # List(Nat) -> List(Nat)) # (List(Nat) # List(Nat) -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_497_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: List(Nat). @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(13), rewr_299_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(17)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(14))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(17)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(14))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: List(Nat). @var_0(x1, x3) == @var_1(x1, x3)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc2420))), arg0, arg1);
  }

  static inline data_expression rewr_497_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_497_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_497_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_497_2(t[0], t[1], this_rewriter); }


  // [497] ==: (List(Nat) # List(Nat) -> List(Nat)) # (List(Nat) # List(Nat) -> List(Nat)) -> Bool
  static inline const data_expression& rewr_497_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0ce60);
  }

  static inline data_expression rewr_497_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_497_0(this_rewriter); }

  static inline data_expression rewr_497_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_497_0(this_rewriter); }


  // [492] if: Bool # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) -> (Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4, class DATA_EXPR5>
  static inline data_expression rewr_492_6(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, const DATA_EXPR5& arg_not_nf5, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_1(@var_2, @var_3)(@var_4)))))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_0(@var_2, @var_3)(@var_4)))))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
        return rewrite_with_arguments_in_normal_form(application(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), local_rewrite(var_4, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)(@var_4)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
          return rewrite_with_arguments_in_normal_form(application(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), local_rewrite(var_4, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3)(@var_4)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_1(@var_2, @var_3)(@var_4)))))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
        return rewrite_with_arguments_in_normal_form(application(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), local_rewrite(var_4, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)(@var_4)
      }
      else
      {
      }
    }
    return application(application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc1fd0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter)), local_rewrite(arg_not_nf5,this_rewriter));
  }

  static inline data_expression rewr_492_6_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_492_6(term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[2], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_492_6_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_492_6(down_cast<application>(down_cast<application>(t.head()).head())[0], down_cast<application>(down_cast<application>(t.head()).head())[1], down_cast<application>(down_cast<application>(t.head()).head())[2], down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], t[0], this_rewriter); }


  // [492] if: Bool # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) -> (Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_492_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc1fd0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_492_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_492_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_492_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_492_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [492] if: Bool # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) -> (Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_492_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc1fd0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_492_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_492_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_492_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_492_3(t[0], t[1], t[2], this_rewriter); }


  // [492] if: Bool # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) -> (Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)
  static inline const data_expression& rewr_492_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0e9f0);
  }

  static inline data_expression rewr_492_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_492_0(this_rewriter); }

  static inline data_expression rewr_492_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_492_0(this_rewriter); }


  // [491] !=: ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_491_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_490_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc1fa0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_491_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_491_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_491_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_491_2(t[0], t[1], this_rewriter); }


  // [491] !=: ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_491_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddeea880);
  }

  static inline data_expression rewr_491_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_491_0(this_rewriter); }

  static inline data_expression rewr_491_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_491_0(this_rewriter); }


  // [490] ==: ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_490_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Place -> List(Nat), x3: List(PlaceTokens). @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(14), rewr_89_2(delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_0, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(16)), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(16)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Place -> List(Nat), x3: List(PlaceTokens). @var_0(x1, x3) == @var_1(x1, x3)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc1f70))), arg0, arg1);
  }

  static inline data_expression rewr_490_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_490_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_490_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_490_2(t[0], t[1], this_rewriter); }


  // [490] ==: ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_490_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0c8f0);
  }

  static inline data_expression rewr_490_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_490_0(this_rewriter); }

  static inline data_expression rewr_490_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_490_0(this_rewriter); }


  // [485] if: Bool # (Trans # List(Trans) -> Bool) # (Trans # List(Trans) -> Bool) -> Trans # List(Trans) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_485_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc1af0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_485_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_485_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_485_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_485_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [485] if: Bool # (Trans # List(Trans) -> Bool) # (Trans # List(Trans) -> Bool) -> Trans # List(Trans) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_485_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc1af0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_485_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_485_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_485_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_485_3(t[0], t[1], t[2], this_rewriter); }


  // [485] if: Bool # (Trans # List(Trans) -> Bool) # (Trans # List(Trans) -> Bool) -> Trans # List(Trans) -> Bool
  static inline const data_expression& rewr_485_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0f310);
  }

  static inline data_expression rewr_485_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_485_0(this_rewriter); }

  static inline data_expression rewr_485_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_485_0(this_rewriter); }


  // [484] !=: (Trans # List(Trans) -> Bool) # (Trans # List(Trans) -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_484_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_483_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc1ac0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_484_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_484_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_484_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_484_2(t[0], t[1], this_rewriter); }


  // [484] !=: (Trans # List(Trans) -> Bool) # (Trans # List(Trans) -> Bool) -> Bool
  static inline const data_expression& rewr_484_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0f250);
  }

  static inline data_expression rewr_484_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_484_0(this_rewriter); }

  static inline data_expression rewr_484_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_484_0(this_rewriter); }


  // [483] ==: (Trans # List(Trans) -> Bool) # (Trans # List(Trans) -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_483_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Trans, x3: List(Trans). @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(15), rewr_402_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(4)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(18))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(4)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(18)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Trans, x3: List(Trans). @var_0(x1, x3) == @var_1(x1, x3)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc1a90))), arg0, arg1);
  }

  static inline data_expression rewr_483_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_483_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_483_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_483_2(t[0], t[1], this_rewriter); }


  // [483] ==: (Trans # List(Trans) -> Bool) # (Trans # List(Trans) -> Bool) -> Bool
  static inline const data_expression& rewr_483_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0dbc0);
  }

  static inline data_expression rewr_483_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_483_0(this_rewriter); }

  static inline data_expression rewr_483_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_483_0(this_rewriter); }


  // [478] if: Bool # (Trans -> Nat) # (Trans -> Nat) -> Trans -> Nat
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_478_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_0(@var_2)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc16d0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_478_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_478_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_478_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_478_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [478] if: Bool # (Trans -> Nat) # (Trans -> Nat) -> Trans -> Nat
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_478_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc16d0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_478_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_478_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_478_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_478_3(t[0], t[1], t[2], this_rewriter); }


  // [478] if: Bool # (Trans -> Nat) # (Trans -> Nat) -> Trans -> Nat
  static inline const data_expression& rewr_478_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0ee00);
  }

  static inline data_expression rewr_478_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_478_0(this_rewriter); }

  static inline data_expression rewr_478_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_478_0(this_rewriter); }


  // [477] !=: (Trans -> Nat) # (Trans -> Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_477_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_476_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc16a0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_477_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_477_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_477_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_477_2(t[0], t[1], this_rewriter); }


  // [477] !=: (Trans -> Nat) # (Trans -> Nat) -> Bool
  static inline const data_expression& rewr_477_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddeea0b0);
  }

  static inline data_expression rewr_477_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_477_0(this_rewriter); }

  static inline data_expression rewr_477_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_477_0(this_rewriter); }


  // [476] ==: (Trans -> Nat) # (Trans -> Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_476_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Trans. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(3), rewr_35_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(4))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(4))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Trans. @var_0(x1) == @var_1(x1)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc1670))), arg0, arg1);
  }

  static inline data_expression rewr_476_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_476_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_476_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_476_2(t[0], t[1], this_rewriter); }


  // [476] ==: (Trans -> Nat) # (Trans -> Nat) -> Bool
  static inline const data_expression& rewr_476_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddeea140);
  }

  static inline data_expression rewr_476_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_476_0(this_rewriter); }

  static inline data_expression rewr_476_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_476_0(this_rewriter); }


  // [467] if: Bool # ((Place -> List(Nat)) # Trans -> Bool) # ((Place -> List(Nat)) # Trans -> Bool) -> (Place -> List(Nat)) # Trans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_467_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc1100))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_467_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_467_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_467_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_467_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [467] if: Bool # ((Place -> List(Nat)) # Trans -> Bool) # ((Place -> List(Nat)) # Trans -> Bool) -> (Place -> List(Nat)) # Trans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_467_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc1100))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_467_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_467_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_467_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_467_3(t[0], t[1], t[2], this_rewriter); }


  // [467] if: Bool # ((Place -> List(Nat)) # Trans -> Bool) # ((Place -> List(Nat)) # Trans -> Bool) -> (Place -> List(Nat)) # Trans -> Bool
  static inline const data_expression& rewr_467_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddeea220);
  }

  static inline data_expression rewr_467_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_467_0(this_rewriter); }

  static inline data_expression rewr_467_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_467_0(this_rewriter); }


  // [466] !=: ((Place -> List(Nat)) # Trans -> Bool) # ((Place -> List(Nat)) # Trans -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_466_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_465_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc10d0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_466_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_466_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_466_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_466_2(t[0], t[1], this_rewriter); }


  // [466] !=: ((Place -> List(Nat)) # Trans -> Bool) # ((Place -> List(Nat)) # Trans -> Bool) -> Bool
  static inline const data_expression& rewr_466_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0f3a0);
  }

  static inline data_expression rewr_466_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_466_0(this_rewriter); }

  static inline data_expression rewr_466_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_466_0(this_rewriter); }


  // [465] ==: ((Place -> List(Nat)) # Trans -> Bool) # ((Place -> List(Nat)) # Trans -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_465_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Place -> List(Nat), x3: Trans. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(11), rewr_402_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(10))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(10)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Place -> List(Nat), x3: Trans. @var_0(x1, x3) == @var_1(x1, x3)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc10a0))), arg0, arg1);
  }

  static inline data_expression rewr_465_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_465_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_465_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_465_2(t[0], t[1], this_rewriter); }


  // [465] ==: ((Place -> List(Nat)) # Trans -> Bool) # ((Place -> List(Nat)) # Trans -> Bool) -> Bool
  static inline const data_expression& rewr_465_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0f4e0);
  }

  static inline data_expression rewr_465_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_465_0(this_rewriter); }

  static inline data_expression rewr_465_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_465_0(this_rewriter); }


  // [460] if: Bool # (Bool # Bool -> Bool) # (Bool # Bool -> Bool) -> Bool # Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_460_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc0c20))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_460_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_460_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_460_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_460_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [460] if: Bool # (Bool # Bool -> Bool) # (Bool # Bool -> Bool) -> Bool # Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_460_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc0c20))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_460_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_460_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_460_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_460_3(t[0], t[1], t[2], this_rewriter); }


  // [460] if: Bool # (Bool # Bool -> Bool) # (Bool # Bool -> Bool) -> Bool # Bool -> Bool
  static inline const data_expression& rewr_460_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddeea0e0);
  }

  static inline data_expression rewr_460_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_460_0(this_rewriter); }

  static inline data_expression rewr_460_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_460_0(this_rewriter); }


  // [459] !=: (Bool # Bool -> Bool) # (Bool # Bool -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_459_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_458_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc0bf0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_459_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_459_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_459_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_459_2(t[0], t[1], this_rewriter); }


  // [459] !=: (Bool # Bool -> Bool) # (Bool # Bool -> Bool) -> Bool
  static inline const data_expression& rewr_459_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee4620);
  }

  static inline data_expression rewr_459_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_459_0(this_rewriter); }

  static inline data_expression rewr_459_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_459_0(this_rewriter); }


  // [458] ==: (Bool # Bool -> Bool) # (Bool # Bool -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_458_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: Bool. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(16), rewr_402_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(5)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(19))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(5)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(19)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: Bool. @var_0(x1, x3) == @var_1(x1, x3)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc0bc0))), arg0, arg1);
  }

  static inline data_expression rewr_458_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_458_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_458_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_458_2(t[0], t[1], this_rewriter); }


  // [458] ==: (Bool # Bool -> Bool) # (Bool # Bool -> Bool) -> Bool
  static inline const data_expression& rewr_458_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0eec0);
  }

  static inline data_expression rewr_458_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_458_0(this_rewriter); }

  static inline data_expression rewr_458_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_458_0(this_rewriter); }


  // [453] if: Bool # (PlaceTokens # List(PlaceTokens) -> Bool) # (PlaceTokens # List(PlaceTokens) -> Bool) -> PlaceTokens # List(PlaceTokens) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_453_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc0740))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_453_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_453_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_453_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_453_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [453] if: Bool # (PlaceTokens # List(PlaceTokens) -> Bool) # (PlaceTokens # List(PlaceTokens) -> Bool) -> PlaceTokens # List(PlaceTokens) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_453_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc0740))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_453_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_453_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_453_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_453_3(t[0], t[1], t[2], this_rewriter); }


  // [453] if: Bool # (PlaceTokens # List(PlaceTokens) -> Bool) # (PlaceTokens # List(PlaceTokens) -> Bool) -> PlaceTokens # List(PlaceTokens) -> Bool
  static inline const data_expression& rewr_453_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0ec20);
  }

  static inline data_expression rewr_453_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_453_0(this_rewriter); }

  static inline data_expression rewr_453_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_453_0(this_rewriter); }


  // [452] !=: (PlaceTokens # List(PlaceTokens) -> Bool) # (PlaceTokens # List(PlaceTokens) -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_452_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_451_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc0710))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_452_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_452_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_452_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_452_2(t[0], t[1], this_rewriter); }


  // [452] !=: (PlaceTokens # List(PlaceTokens) -> Bool) # (PlaceTokens # List(PlaceTokens) -> Bool) -> Bool
  static inline const data_expression& rewr_452_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0ee60);
  }

  static inline data_expression rewr_452_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_452_0(this_rewriter); }

  static inline data_expression rewr_452_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_452_0(this_rewriter); }


  // [451] ==: (PlaceTokens # List(PlaceTokens) -> Bool) # (PlaceTokens # List(PlaceTokens) -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_451_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: PlaceTokens, x3: List(PlaceTokens). @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(12), rewr_402_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(15)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(16))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(15)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(16)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: PlaceTokens, x3: List(PlaceTokens). @var_0(x1, x3) == @var_1(x1, x3)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc06e0))), arg0, arg1);
  }

  static inline data_expression rewr_451_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_451_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_451_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_451_2(t[0], t[1], this_rewriter); }


  // [451] ==: (PlaceTokens # List(PlaceTokens) -> Bool) # (PlaceTokens # List(PlaceTokens) -> Bool) -> Bool
  static inline const data_expression& rewr_451_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0f400);
  }

  static inline data_expression rewr_451_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_451_0(this_rewriter); }

  static inline data_expression rewr_451_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_451_0(this_rewriter); }


  // [446] if: Bool # (Trans -> List(PlaceTokens)) # (Trans -> List(PlaceTokens)) -> Trans -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_446_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_0(@var_2)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc0320))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_446_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_446_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_446_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_446_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [446] if: Bool # (Trans -> List(PlaceTokens)) # (Trans -> List(PlaceTokens)) -> Trans -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_446_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc0320))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_446_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_446_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_446_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_446_3(t[0], t[1], t[2], this_rewriter); }


  // [446] if: Bool # (Trans -> List(PlaceTokens)) # (Trans -> List(PlaceTokens)) -> Trans -> List(PlaceTokens)
  static inline const data_expression& rewr_446_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0f480);
  }

  static inline data_expression rewr_446_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_446_0(this_rewriter); }

  static inline data_expression rewr_446_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_446_0(this_rewriter); }


  // [445] !=: (Trans -> List(PlaceTokens)) # (Trans -> List(PlaceTokens)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_445_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_444_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc02f0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_445_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_445_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_445_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_445_2(t[0], t[1], this_rewriter); }


  // [445] !=: (Trans -> List(PlaceTokens)) # (Trans -> List(PlaceTokens)) -> Bool
  static inline const data_expression& rewr_445_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee99d0);
  }

  static inline data_expression rewr_445_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_445_0(this_rewriter); }

  static inline data_expression rewr_445_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_445_0(this_rewriter); }


  // [444] ==: (Trans -> List(PlaceTokens)) # (Trans -> List(PlaceTokens)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_444_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Trans. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(3), rewr_265_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(4))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(4))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Trans. @var_0(x1) == @var_1(x1)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbc02c0))), arg0, arg1);
  }

  static inline data_expression rewr_444_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_444_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_444_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_444_2(t[0], t[1], this_rewriter); }


  // [444] ==: (Trans -> List(PlaceTokens)) # (Trans -> List(PlaceTokens)) -> Bool
  static inline const data_expression& rewr_444_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee9a00);
  }

  static inline data_expression rewr_444_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_444_0(this_rewriter); }

  static inline data_expression rewr_444_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_444_0(this_rewriter); }


  // [435] if: Bool # (List(Nat) # List(Nat) -> Bool) # (List(Nat) # List(Nat) -> Bool) -> List(Nat) # List(Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_435_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbbfd50))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_435_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_435_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_435_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_435_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [435] if: Bool # (List(Nat) # List(Nat) -> Bool) # (List(Nat) # List(Nat) -> Bool) -> List(Nat) # List(Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_435_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbbfd50))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_435_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_435_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_435_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_435_3(t[0], t[1], t[2], this_rewriter); }


  // [435] if: Bool # (List(Nat) # List(Nat) -> Bool) # (List(Nat) # List(Nat) -> Bool) -> List(Nat) # List(Nat) -> Bool
  static inline const data_expression& rewr_435_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee9970);
  }

  static inline data_expression rewr_435_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_435_0(this_rewriter); }

  static inline data_expression rewr_435_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_435_0(this_rewriter); }


  // [434] !=: (List(Nat) # List(Nat) -> Bool) # (List(Nat) # List(Nat) -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_434_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_433_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbbfd20))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_434_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_434_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_434_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_434_2(t[0], t[1], this_rewriter); }


  // [434] !=: (List(Nat) # List(Nat) -> Bool) # (List(Nat) # List(Nat) -> Bool) -> Bool
  static inline const data_expression& rewr_434_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0edb0);
  }

  static inline data_expression rewr_434_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_434_0(this_rewriter); }

  static inline data_expression rewr_434_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_434_0(this_rewriter); }


  // [433] ==: (List(Nat) # List(Nat) -> Bool) # (List(Nat) # List(Nat) -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_433_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: List(Nat). @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(13), rewr_402_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(17)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(14))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(17)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(14)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: List(Nat). @var_0(x1, x3) == @var_1(x1, x3)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbbfcf0))), arg0, arg1);
  }

  static inline data_expression rewr_433_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_433_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_433_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_433_2(t[0], t[1], this_rewriter); }


  // [433] ==: (List(Nat) # List(Nat) -> Bool) # (List(Nat) # List(Nat) -> Bool) -> Bool
  static inline const data_expression& rewr_433_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee99a0);
  }

  static inline data_expression rewr_433_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_433_0(this_rewriter); }

  static inline data_expression rewr_433_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_433_0(this_rewriter); }


  // [428] if: Bool # (Trans -> Bool) # (Trans -> Bool) -> Trans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_428_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_0(@var_2)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbbf930))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_428_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_428_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_428_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_428_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [428] if: Bool # (Trans -> Bool) # (Trans -> Bool) -> Trans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_428_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbbf930))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_428_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_428_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_428_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_428_3(t[0], t[1], t[2], this_rewriter); }


  // [428] if: Bool # (Trans -> Bool) # (Trans -> Bool) -> Trans -> Bool
  static inline const data_expression& rewr_428_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee9a30);
  }

  static inline data_expression rewr_428_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_428_0(this_rewriter); }

  static inline data_expression rewr_428_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_428_0(this_rewriter); }


  // [427] !=: (Trans -> Bool) # (Trans -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_427_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_426_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbbf900))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_427_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_427_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_427_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_427_2(t[0], t[1], this_rewriter); }


  // [427] !=: (Trans -> Bool) # (Trans -> Bool) -> Bool
  static inline const data_expression& rewr_427_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0f920);
  }

  static inline data_expression rewr_427_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_427_0(this_rewriter); }

  static inline data_expression rewr_427_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_427_0(this_rewriter); }


  // [426] ==: (Trans -> Bool) # (Trans -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_426_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Trans. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(3), rewr_402_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(4))), this_rewriter), delayed_application1<data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(4)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Trans. @var_0(x1) == @var_1(x1)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbbf8d0))), arg0, arg1);
  }

  static inline data_expression rewr_426_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_426_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_426_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_426_2(t[0], t[1], this_rewriter); }


  // [426] ==: (Trans -> Bool) # (Trans -> Bool) -> Bool
  static inline const data_expression& rewr_426_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0dea0);
  }

  static inline data_expression rewr_426_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_426_0(this_rewriter); }

  static inline data_expression rewr_426_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_426_0(this_rewriter); }


  // [416] if: Bool # ((Place -> List(Nat)) -> List(Trans)) # ((Place -> List(Nat)) -> List(Trans)) -> (Place -> List(Nat)) -> List(Trans)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_416_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_0(@var_2)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbbf270))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_416_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_416_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_416_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_416_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [416] if: Bool # ((Place -> List(Nat)) -> List(Trans)) # ((Place -> List(Nat)) -> List(Trans)) -> (Place -> List(Nat)) -> List(Trans)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_416_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbbf270))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_416_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_416_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_416_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_416_3(t[0], t[1], t[2], this_rewriter); }


  // [416] if: Bool # ((Place -> List(Nat)) -> List(Trans)) # ((Place -> List(Nat)) -> List(Trans)) -> (Place -> List(Nat)) -> List(Trans)
  static inline const data_expression& rewr_416_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0ded0);
  }

  static inline data_expression rewr_416_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_416_0(this_rewriter); }

  static inline data_expression rewr_416_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_416_0(this_rewriter); }


  // [415] !=: ((Place -> List(Nat)) -> List(Trans)) # ((Place -> List(Nat)) -> List(Trans)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_415_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_414_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbbf240))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_415_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_415_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_415_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_415_2(t[0], t[1], this_rewriter); }


  // [415] !=: ((Place -> List(Nat)) -> List(Trans)) # ((Place -> List(Nat)) -> List(Trans)) -> Bool
  static inline const data_expression& rewr_415_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0fb90);
  }

  static inline data_expression rewr_415_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_415_0(this_rewriter); }

  static inline data_expression rewr_415_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_415_0(this_rewriter); }


  // [414] ==: ((Place -> List(Nat)) -> List(Trans)) # ((Place -> List(Nat)) -> List(Trans)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_414_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Place -> List(Nat). @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(17), rewr_284_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(0))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(0))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Place -> List(Nat). @var_0(x1) == @var_1(x1)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbbf210))), arg0, arg1);
  }

  static inline data_expression rewr_414_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_414_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_414_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_414_2(t[0], t[1], this_rewriter); }


  // [414] ==: ((Place -> List(Nat)) -> List(Trans)) # ((Place -> List(Nat)) -> List(Trans)) -> Bool
  static inline const data_expression& rewr_414_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0fcb0);
  }

  static inline data_expression rewr_414_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_414_0(this_rewriter); }

  static inline data_expression rewr_414_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_414_0(this_rewriter); }


  // [405] if: Bool # (Trans # Trans # Trans # Trans -> List(Trans)) # (Trans # Trans # Trans # Trans -> List(Trans)) -> Trans # Trans # Trans # Trans -> List(Trans)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4, class DATA_EXPR5, class DATA_EXPR6>
  static inline data_expression rewr_405_7(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, const DATA_EXPR5& arg_not_nf5, const DATA_EXPR6& arg_not_nf6, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@N(@@S(@var_5, @@R(@var_1(@var_2, @var_3, @var_4, @var_5)))))))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@N(@@S(@var_5, @@R(@var_0(@var_2, @var_3, @var_4, @var_5)))))))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
        const DATA_EXPR6& var_5 = arg_not_nf6; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter), local_rewrite(var_4, this_rewriter), local_rewrite(var_5, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3, @var_4, @var_5)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
          const DATA_EXPR6& var_5 = arg_not_nf6; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter), local_rewrite(var_4, this_rewriter), local_rewrite(var_5, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3, @var_4, @var_5)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@N(@@S(@var_5, @@R(@var_1(@var_2, @var_3, @var_4, @var_5)))))))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
        const DATA_EXPR6& var_5 = arg_not_nf6; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter), local_rewrite(var_4, this_rewriter), local_rewrite(var_5, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3, @var_4, @var_5)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbbebb0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter), local_rewrite(arg_not_nf5,this_rewriter), local_rewrite(arg_not_nf6,this_rewriter));
  }

  static inline data_expression rewr_405_7_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_405_7(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), term_not_in_normal_form(t[3], this_rewriter), this_rewriter); }

  static inline data_expression rewr_405_7_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_405_7(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], t[2], t[3], this_rewriter); }


  // [405] if: Bool # (Trans # Trans # Trans # Trans -> List(Trans)) # (Trans # Trans # Trans # Trans -> List(Trans)) -> Trans # Trans # Trans # Trans -> List(Trans)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_405_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbbebb0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_405_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_405_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_405_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_405_3(t[0], t[1], t[2], this_rewriter); }


  // [405] if: Bool # (Trans # Trans # Trans # Trans -> List(Trans)) # (Trans # Trans # Trans # Trans -> List(Trans)) -> Trans # Trans # Trans # Trans -> List(Trans)
  static inline const data_expression& rewr_405_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddeeb020);
  }

  static inline data_expression rewr_405_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_405_0(this_rewriter); }

  static inline data_expression rewr_405_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_405_0(this_rewriter); }


  // [404] !=: (Trans # Trans # Trans # Trans -> List(Trans)) # (Trans # Trans # Trans # Trans -> List(Trans)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_404_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_403_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbbeb80))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_404_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_404_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_404_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_404_2(t[0], t[1], this_rewriter); }


  // [404] !=: (Trans # Trans # Trans # Trans -> List(Trans)) # (Trans # Trans # Trans # Trans -> List(Trans)) -> Bool
  static inline const data_expression& rewr_404_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0fc50);
  }

  static inline data_expression rewr_404_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_404_0(this_rewriter); }

  static inline data_expression rewr_404_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_404_0(this_rewriter); }


  // [403] ==: (Trans # Trans # Trans # Trans -> List(Trans)) # (Trans # Trans # Trans # Trans -> List(Trans)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_403_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x2,x3,x7: Trans. @var_0(x1, x2, x3, x7) == @var_1(x1, x2, x3, x7)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(18), rewr_284_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(4)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(20)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(10)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(21))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(4)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(20)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(10)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(21))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x2,x3,x7: Trans. @var_0(x1, x2, x3, x7) == @var_1(x1, x2, x3, x7)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbbeb50))), arg0, arg1);
  }

  static inline data_expression rewr_403_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_403_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_403_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_403_2(t[0], t[1], this_rewriter); }


  // [403] ==: (Trans # Trans # Trans # Trans -> List(Trans)) # (Trans # Trans # Trans # Trans -> List(Trans)) -> Bool
  static inline const data_expression& rewr_403_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee91d0);
  }

  static inline data_expression rewr_403_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_403_0(this_rewriter); }

  static inline data_expression rewr_403_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_403_0(this_rewriter); }


  // [397] if: Bool # (Nat # Nat -> Bool) # (Nat # Nat -> Bool) -> Nat # Nat -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_397_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbbe6d0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_397_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_397_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_397_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_397_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [397] if: Bool # (Nat # Nat -> Bool) # (Nat # Nat -> Bool) -> Nat # Nat -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_397_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbbe6d0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_397_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_397_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_397_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_397_3(t[0], t[1], t[2], this_rewriter); }


  // [397] if: Bool # (Nat # Nat -> Bool) # (Nat # Nat -> Bool) -> Nat # Nat -> Bool
  static inline const data_expression& rewr_397_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0f8f0);
  }

  static inline data_expression rewr_397_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_397_0(this_rewriter); }

  static inline data_expression rewr_397_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_397_0(this_rewriter); }


  // [396] !=: (Nat # Nat -> Bool) # (Nat # Nat -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_396_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_395_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbbe6a0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_396_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_396_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_396_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_396_2(t[0], t[1], this_rewriter); }


  // [396] !=: (Nat # Nat -> Bool) # (Nat # Nat -> Bool) -> Bool
  static inline const data_expression& rewr_396_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee9380);
  }

  static inline data_expression rewr_396_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_396_0(this_rewriter); }

  static inline data_expression rewr_396_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_396_0(this_rewriter); }


  // [395] ==: (Nat # Nat -> Bool) # (Nat # Nat -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_395_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: Nat. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(19), rewr_402_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(13)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(22))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(13)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(22)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: Nat. @var_0(x1, x3) == @var_1(x1, x3)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbbe670))), arg0, arg1);
  }

  static inline data_expression rewr_395_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_395_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_395_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_395_2(t[0], t[1], this_rewriter); }


  // [395] ==: (Nat # Nat -> Bool) # (Nat # Nat -> Bool) -> Bool
  static inline const data_expression& rewr_395_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee92f0);
  }

  static inline data_expression rewr_395_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_395_0(this_rewriter); }

  static inline data_expression rewr_395_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_395_0(this_rewriter); }


  // [390] if: Bool # (List(Nat) -> Nat) # (List(Nat) -> Nat) -> List(Nat) -> Nat
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_390_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_0(@var_2)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb60c60))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_390_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_390_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_390_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_390_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [390] if: Bool # (List(Nat) -> Nat) # (List(Nat) -> Nat) -> List(Nat) -> Nat
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_390_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb60c60))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_390_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_390_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_390_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_390_3(t[0], t[1], t[2], this_rewriter); }


  // [390] if: Bool # (List(Nat) -> Nat) # (List(Nat) -> Nat) -> List(Nat) -> Nat
  static inline const data_expression& rewr_390_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0fc20);
  }

  static inline data_expression rewr_390_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_390_0(this_rewriter); }

  static inline data_expression rewr_390_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_390_0(this_rewriter); }


  // [389] !=: (List(Nat) -> Nat) # (List(Nat) -> Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_389_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_388_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb60c30))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_389_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_389_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_389_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_389_2(t[0], t[1], this_rewriter); }


  // [389] !=: (List(Nat) -> Nat) # (List(Nat) -> Nat) -> Bool
  static inline const data_expression& rewr_389_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf10110);
  }

  static inline data_expression rewr_389_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_389_0(this_rewriter); }

  static inline data_expression rewr_389_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_389_0(this_rewriter); }


  // [388] ==: (List(Nat) -> Nat) # (List(Nat) -> Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_388_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: List(Nat). @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(20), rewr_35_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(17))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(17))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: List(Nat). @var_0(x1) == @var_1(x1)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb60c00))), arg0, arg1);
  }

  static inline data_expression rewr_388_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_388_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_388_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_388_2(t[0], t[1], this_rewriter); }


  // [388] ==: (List(Nat) -> Nat) # (List(Nat) -> Nat) -> Bool
  static inline const data_expression& rewr_388_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddeea8b0);
  }

  static inline data_expression rewr_388_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_388_0(this_rewriter); }

  static inline data_expression rewr_388_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_388_0(this_rewriter); }


  // [379] if: Bool # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) -> Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4, class DATA_EXPR5, class DATA_EXPR6, class DATA_EXPR7>
  static inline data_expression rewr_379_8(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, const DATA_EXPR5& arg_not_nf5, const DATA_EXPR6& arg_not_nf6, const DATA_EXPR7& arg_not_nf7, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@N(@@S(@var_5, @@N(@@S(@var_6, @@R(@var_1(@var_2, @var_3, @var_4, @var_5, @var_6)))))))))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@N(@@S(@var_5, @@N(@@S(@var_6, @@R(@var_0(@var_2, @var_3, @var_4, @var_5, @var_6)))))))))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
        const DATA_EXPR6& var_5 = arg_not_nf6; // S1b
        const DATA_EXPR7& var_6 = arg_not_nf7; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter), local_rewrite(var_4, this_rewriter), local_rewrite(var_5, this_rewriter), local_rewrite(var_6, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3, @var_4, @var_5, @var_6)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
          const DATA_EXPR6& var_5 = arg_not_nf6; // S1b
          const DATA_EXPR7& var_6 = arg_not_nf7; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter), local_rewrite(var_4, this_rewriter), local_rewrite(var_5, this_rewriter), local_rewrite(var_6, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3, @var_4, @var_5, @var_6)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@N(@@S(@var_5, @@N(@@S(@var_6, @@R(@var_1(@var_2, @var_3, @var_4, @var_5, @var_6)))))))))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
        const DATA_EXPR6& var_5 = arg_not_nf6; // S1b
        const DATA_EXPR7& var_6 = arg_not_nf7; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter), local_rewrite(var_4, this_rewriter), local_rewrite(var_5, this_rewriter), local_rewrite(var_6, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3, @var_4, @var_5, @var_6)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb605d0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter), local_rewrite(arg_not_nf5,this_rewriter), local_rewrite(arg_not_nf6,this_rewriter), local_rewrite(arg_not_nf7,this_rewriter));
  }

  static inline data_expression rewr_379_8_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_379_8(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), term_not_in_normal_form(t[3], this_rewriter), term_not_in_normal_form(t[4], this_rewriter), this_rewriter); }

  static inline data_expression rewr_379_8_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_379_8(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], t[2], t[3], t[4], this_rewriter); }


  // [379] if: Bool # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) -> Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_379_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb605d0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_379_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_379_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_379_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_379_3(t[0], t[1], t[2], this_rewriter); }


  // [379] if: Bool # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) -> Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans
  static inline const data_expression& rewr_379_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0f100);
  }

  static inline data_expression rewr_379_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_379_0(this_rewriter); }

  static inline data_expression rewr_379_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_379_0(this_rewriter); }


  // [378] !=: (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_378_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_377_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb605a0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_378_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_378_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_378_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_378_2(t[0], t[1], this_rewriter); }


  // [378] !=: (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) -> Bool
  static inline const data_expression& rewr_378_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0dfc0);
  }

  static inline data_expression rewr_378_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_378_0(this_rewriter); }

  static inline data_expression rewr_378_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_378_0(this_rewriter); }


  // [377] ==: (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_377_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Trans_name, x2: Bool, x3: Nat, x4,x9: List(PlaceTokens). @var_0(x1, x2, x3, x4, x9) == @var_1(x1, x2, x3, x4, x9)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(21), rewr_81_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(3)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(6)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(22)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(23)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(24))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(3)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(6)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(22)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(23)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(24))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Trans_name, x2: Bool, x3: Nat, x4,x9: List(PlaceTokens). @var_0(x1, x2, x3, x4, x9) == @var_1(x1, x2, x3, x4, x9)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb60570))), arg0, arg1);
  }

  static inline data_expression rewr_377_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_377_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_377_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_377_2(t[0], t[1], this_rewriter); }


  // [377] ==: (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) -> Bool
  static inline const data_expression& rewr_377_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0f160);
  }

  static inline data_expression rewr_377_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_377_0(this_rewriter); }

  static inline data_expression rewr_377_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_377_0(this_rewriter); }


  // [372] if: Bool # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) -> PlaceTokens # PlaceTokens -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_372_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb600f0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_372_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_372_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_372_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_372_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [372] if: Bool # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) -> PlaceTokens # PlaceTokens -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_372_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb600f0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_372_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_372_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_372_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_372_3(t[0], t[1], t[2], this_rewriter); }


  // [372] if: Bool # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) -> PlaceTokens # PlaceTokens -> List(PlaceTokens)
  static inline const data_expression& rewr_372_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0fd70);
  }

  static inline data_expression rewr_372_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_372_0(this_rewriter); }

  static inline data_expression rewr_372_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_372_0(this_rewriter); }


  // [371] !=: (PlaceTokens # PlaceTokens -> List(PlaceTokens)) # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_371_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_370_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb600c0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_371_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_371_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_371_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_371_2(t[0], t[1], this_rewriter); }


  // [371] !=: (PlaceTokens # PlaceTokens -> List(PlaceTokens)) # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) -> Bool
  static inline const data_expression& rewr_371_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0fec0);
  }

  static inline data_expression rewr_371_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_371_0(this_rewriter); }

  static inline data_expression rewr_371_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_371_0(this_rewriter); }


  // [370] ==: (PlaceTokens # PlaceTokens -> List(PlaceTokens)) # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_370_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: PlaceTokens. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(22), rewr_265_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(15)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(25))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(15)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(25))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: PlaceTokens. @var_0(x1, x3) == @var_1(x1, x3)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb60090))), arg0, arg1);
  }

  static inline data_expression rewr_370_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_370_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_370_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_370_2(t[0], t[1], this_rewriter); }


  // [370] ==: (PlaceTokens # PlaceTokens -> List(PlaceTokens)) # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) -> Bool
  static inline const data_expression& rewr_370_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0efe0);
  }

  static inline data_expression rewr_370_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_370_0(this_rewriter); }

  static inline data_expression rewr_370_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_370_0(this_rewriter); }


  // [365] if: Bool # (PlaceTokens -> List(PlaceTokens)) # (PlaceTokens -> List(PlaceTokens)) -> PlaceTokens -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_365_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_0(@var_2)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5fca0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_365_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_365_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_365_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_365_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [365] if: Bool # (PlaceTokens -> List(PlaceTokens)) # (PlaceTokens -> List(PlaceTokens)) -> PlaceTokens -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_365_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5fca0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_365_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_365_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_365_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_365_3(t[0], t[1], t[2], this_rewriter); }


  // [365] if: Bool # (PlaceTokens -> List(PlaceTokens)) # (PlaceTokens -> List(PlaceTokens)) -> PlaceTokens -> List(PlaceTokens)
  static inline const data_expression& rewr_365_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0fe60);
  }

  static inline data_expression rewr_365_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_365_0(this_rewriter); }

  static inline data_expression rewr_365_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_365_0(this_rewriter); }


  // [364] !=: (PlaceTokens -> List(PlaceTokens)) # (PlaceTokens -> List(PlaceTokens)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_364_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_363_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5fc70))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_364_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_364_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_364_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_364_2(t[0], t[1], this_rewriter); }


  // [364] !=: (PlaceTokens -> List(PlaceTokens)) # (PlaceTokens -> List(PlaceTokens)) -> Bool
  static inline const data_expression& rewr_364_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0fe90);
  }

  static inline data_expression rewr_364_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_364_0(this_rewriter); }

  static inline data_expression rewr_364_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_364_0(this_rewriter); }


  // [363] ==: (PlaceTokens -> List(PlaceTokens)) # (PlaceTokens -> List(PlaceTokens)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_363_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: PlaceTokens. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(23), rewr_265_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(15))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(15))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: PlaceTokens. @var_0(x1) == @var_1(x1)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5fc40))), arg0, arg1);
  }

  static inline data_expression rewr_363_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_363_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_363_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_363_2(t[0], t[1], this_rewriter); }


  // [363] ==: (PlaceTokens -> List(PlaceTokens)) # (PlaceTokens -> List(PlaceTokens)) -> Bool
  static inline const data_expression& rewr_363_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee8c10);
  }

  static inline data_expression rewr_363_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_363_0(this_rewriter); }

  static inline data_expression rewr_363_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_363_0(this_rewriter); }


  // [353] if: Bool # (Place # List(Nat) -> PlaceTokens) # (Place # List(Nat) -> PlaceTokens) -> Place # List(Nat) -> PlaceTokens
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_353_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5f520))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_353_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_353_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_353_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_353_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [353] if: Bool # (Place # List(Nat) -> PlaceTokens) # (Place # List(Nat) -> PlaceTokens) -> Place # List(Nat) -> PlaceTokens
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_353_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5f520))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_353_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_353_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_353_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_353_3(t[0], t[1], t[2], this_rewriter); }


  // [353] if: Bool # (Place # List(Nat) -> PlaceTokens) # (Place # List(Nat) -> PlaceTokens) -> Place # List(Nat) -> PlaceTokens
  static inline const data_expression& rewr_353_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0f870);
  }

  static inline data_expression rewr_353_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_353_0(this_rewriter); }

  static inline data_expression rewr_353_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_353_0(this_rewriter); }


  // [352] !=: (Place # List(Nat) -> PlaceTokens) # (Place # List(Nat) -> PlaceTokens) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_352_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_351_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5f4f0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_352_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_352_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_352_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_352_2(t[0], t[1], this_rewriter); }


  // [352] !=: (Place # List(Nat) -> PlaceTokens) # (Place # List(Nat) -> PlaceTokens) -> Bool
  static inline const data_expression& rewr_352_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf10a00);
  }

  static inline data_expression rewr_352_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_352_0(this_rewriter); }

  static inline data_expression rewr_352_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_352_0(this_rewriter); }


  // [351] ==: (Place # List(Nat) -> PlaceTokens) # (Place # List(Nat) -> PlaceTokens) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_351_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Place, x3: List(Nat). @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(24), rewr_266_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(26)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(14))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(26)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(14))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Place, x3: List(Nat). @var_0(x1, x3) == @var_1(x1, x3)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5f4c0))), arg0, arg1);
  }

  static inline data_expression rewr_351_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_351_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_351_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_351_2(t[0], t[1], this_rewriter); }


  // [351] ==: (Place # List(Nat) -> PlaceTokens) # (Place # List(Nat) -> PlaceTokens) -> Bool
  static inline const data_expression& rewr_351_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0f430);
  }

  static inline data_expression rewr_351_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_351_0(this_rewriter); }

  static inline data_expression rewr_351_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_351_0(this_rewriter); }


  // [346] if: Bool # (Nat -> List(Nat)) # (Nat -> List(Nat)) -> Nat -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_346_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_0(@var_2)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5f100))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_346_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_346_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_346_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_346_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [346] if: Bool # (Nat -> List(Nat)) # (Nat -> List(Nat)) -> Nat -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_346_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5f100))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_346_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_346_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_346_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_346_3(t[0], t[1], t[2], this_rewriter); }


  // [346] if: Bool # (Nat -> List(Nat)) # (Nat -> List(Nat)) -> Nat -> List(Nat)
  static inline const data_expression& rewr_346_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0f010);
  }

  static inline data_expression rewr_346_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_346_0(this_rewriter); }

  static inline data_expression rewr_346_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_346_0(this_rewriter); }


  // [345] !=: (Nat -> List(Nat)) # (Nat -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_345_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_344_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5f0d0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_345_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_345_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_345_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_345_2(t[0], t[1], this_rewriter); }


  // [345] !=: (Nat -> List(Nat)) # (Nat -> List(Nat)) -> Bool
  static inline const data_expression& rewr_345_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf10ac0);
  }

  static inline data_expression rewr_345_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_345_0(this_rewriter); }

  static inline data_expression rewr_345_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_345_0(this_rewriter); }


  // [344] ==: (Nat -> List(Nat)) # (Nat -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_344_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Nat. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(25), rewr_299_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(13))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(13))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Nat. @var_0(x1) == @var_1(x1)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5f0a0))), arg0, arg1);
  }

  static inline data_expression rewr_344_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_344_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_344_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_344_2(t[0], t[1], this_rewriter); }


  // [344] ==: (Nat -> List(Nat)) # (Nat -> List(Nat)) -> Bool
  static inline const data_expression& rewr_344_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0ff50);
  }

  static inline data_expression rewr_344_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_344_0(this_rewriter); }

  static inline data_expression rewr_344_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_344_0(this_rewriter); }


  // [335] if: Bool # (Pos -> Nat) # (Pos -> Nat) -> Pos -> Nat
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_335_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_0(@var_2)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5eaa0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_335_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_335_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_335_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_335_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [335] if: Bool # (Pos -> Nat) # (Pos -> Nat) -> Pos -> Nat
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_335_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5eaa0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_335_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_335_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_335_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_335_3(t[0], t[1], t[2], this_rewriter); }


  // [335] if: Bool # (Pos -> Nat) # (Pos -> Nat) -> Pos -> Nat
  static inline const data_expression& rewr_335_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0ffe0);
  }

  static inline data_expression rewr_335_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_335_0(this_rewriter); }

  static inline data_expression rewr_335_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_335_0(this_rewriter); }


  // [334] !=: (Pos -> Nat) # (Pos -> Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_334_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_333_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5ea70))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_334_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_334_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_334_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_334_2(t[0], t[1], this_rewriter); }


  // [334] !=: (Pos -> Nat) # (Pos -> Nat) -> Bool
  static inline const data_expression& rewr_334_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee8430);
  }

  static inline data_expression rewr_334_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_334_0(this_rewriter); }

  static inline data_expression rewr_334_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_334_0(this_rewriter); }


  // [333] ==: (Pos -> Nat) # (Pos -> Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_333_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Pos. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(26), rewr_35_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(8))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(8))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Pos. @var_0(x1) == @var_1(x1)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5ea40))), arg0, arg1);
  }

  static inline data_expression rewr_333_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_333_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_333_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_333_2(t[0], t[1], this_rewriter); }


  // [333] ==: (Pos -> Nat) # (Pos -> Nat) -> Bool
  static inline const data_expression& rewr_333_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee7de0);
  }

  static inline data_expression rewr_333_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_333_0(this_rewriter); }

  static inline data_expression rewr_333_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_333_0(this_rewriter); }


  // [323] if: Bool # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) -> (Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4, class DATA_EXPR5, class DATA_EXPR6>
  static inline data_expression rewr_323_7(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, const DATA_EXPR5& arg_not_nf5, const DATA_EXPR6& arg_not_nf6, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@N(@@S(@var_5, @@R(@var_1(@var_2, @var_3, @var_4)(@var_5)))))))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@N(@@S(@var_5, @@R(@var_0(@var_2, @var_3, @var_4)(@var_5)))))))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
        const DATA_EXPR6& var_5 = arg_not_nf6; // S1b
        return rewrite_with_arguments_in_normal_form(application(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter), local_rewrite(var_4, this_rewriter)), local_rewrite(var_5, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3, @var_4)(@var_5)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
          const DATA_EXPR6& var_5 = arg_not_nf6; // S1b
          return rewrite_with_arguments_in_normal_form(application(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter), local_rewrite(var_4, this_rewriter)), local_rewrite(var_5, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3, @var_4)(@var_5)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@N(@@S(@var_5, @@R(@var_1(@var_2, @var_3, @var_4)(@var_5)))))))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
        const DATA_EXPR6& var_5 = arg_not_nf6; // S1b
        return rewrite_with_arguments_in_normal_form(application(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter), local_rewrite(var_4, this_rewriter)), local_rewrite(var_5, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3, @var_4)(@var_5)
      }
      else
      {
      }
    }
    return application(application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5e320))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter), local_rewrite(arg_not_nf5,this_rewriter)), local_rewrite(arg_not_nf6,this_rewriter));
  }

  static inline data_expression rewr_323_7_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_323_7(term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[2], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_323_7_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_323_7(down_cast<application>(down_cast<application>(t.head()).head())[0], down_cast<application>(down_cast<application>(t.head()).head())[1], down_cast<application>(down_cast<application>(t.head()).head())[2], down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [323] if: Bool # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) -> (Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4, class DATA_EXPR5>
  static inline data_expression rewr_323_6(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, const DATA_EXPR5& arg_not_nf5, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_1(@var_2, @var_3, @var_4)))))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_0(@var_2, @var_3, @var_4)))))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter), local_rewrite(var_4, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3, @var_4)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter), local_rewrite(var_4, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3, @var_4)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_1(@var_2, @var_3, @var_4)))))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter), local_rewrite(var_4, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3, @var_4)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5e320))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter), local_rewrite(arg_not_nf5,this_rewriter));
  }

  static inline data_expression rewr_323_6_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_323_6(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_323_6_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_323_6(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], t[2], this_rewriter); }


  // [323] if: Bool # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) -> (Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_323_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5e320))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_323_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_323_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_323_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_323_3(t[0], t[1], t[2], this_rewriter); }


  // [323] if: Bool # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) -> (Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)
  static inline const data_expression& rewr_323_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf10d10);
  }

  static inline data_expression rewr_323_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_323_0(this_rewriter); }

  static inline data_expression rewr_323_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_323_0(this_rewriter); }


  // [322] !=: ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_322_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_321_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5e2f0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_322_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_322_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_322_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_322_2(t[0], t[1], this_rewriter); }


  // [322] !=: ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_322_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf10f10);
  }

  static inline data_expression rewr_322_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_322_0(this_rewriter); }

  static inline data_expression rewr_322_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_322_0(this_rewriter); }


  // [321] ==: ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_321_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Place -> List(Nat), x2: Place, x5: List(Nat). @var_0(x1, x2, x5) == @var_1(x1, x2, x5)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(27), rewr_89_2(delayed_application3<data_expression,data_expression,data_expression,data_expression>(local_rewrite(var_0, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(27)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(28)), this_rewriter), delayed_application3<data_expression,data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(27)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(28)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Place -> List(Nat), x2: Place, x5: List(Nat). @var_0(x1, x2, x5) == @var_1(x1, x2, x5)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5e2c0))), arg0, arg1);
  }

  static inline data_expression rewr_321_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_321_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_321_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_321_2(t[0], t[1], this_rewriter); }


  // [321] ==: ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_321_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0ffb0);
  }

  static inline data_expression rewr_321_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_321_0(this_rewriter); }

  static inline data_expression rewr_321_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_321_0(this_rewriter); }


  // [316] !=: (Place -> List(Nat)) # (Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_316_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_89_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5ded0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_316_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_316_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_316_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_316_2(t[0], t[1], this_rewriter); }


  // [316] !=: (Place -> List(Nat)) # (Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_316_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf10f70);
  }

  static inline data_expression rewr_316_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_316_0(this_rewriter); }

  static inline data_expression rewr_316_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_316_0(this_rewriter); }


  // [313] @if_always_else: Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_313_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // Implement function @if_always_else by calling a user defined rewrite function.
    return rewrite_aux(application(if_always_else_manual_implementation(local_rewrite(arg_not_nf0,this_rewriter),local_rewrite(arg_not_nf1,this_rewriter),local_rewrite(arg_not_nf2,this_rewriter)), local_rewrite(arg_not_nf3,this_rewriter)),true,this_rewriter);  }

  static inline data_expression rewr_313_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_313_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_313_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_313_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [313] @if_always_else: Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_313_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // Implement function @if_always_else by calling a user defined rewrite function.
    return if_always_else_manual_implementation(local_rewrite(arg_not_nf0,this_rewriter),local_rewrite(arg_not_nf1,this_rewriter),local_rewrite(arg_not_nf2,this_rewriter));  }

  static inline data_expression rewr_313_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_313_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_313_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_313_3(t[0], t[1], t[2], this_rewriter); }


  // [313] @if_always_else: Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)
  static inline const data_expression& rewr_313_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf10da0);
  }

  static inline data_expression rewr_313_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_313_0(this_rewriter); }

  static inline data_expression rewr_313_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_313_0(this_rewriter); }


  // [312] @is_not_an_update: (Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0>
  static inline data_expression rewr_312_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // Implement function @is_not_an_update by calling a user defined rewrite function.
    return is_not_a_function_update_manual_implementation(local_rewrite(arg_not_nf0,this_rewriter));  }

  static inline data_expression rewr_312_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_312_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_312_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_312_1(t[0], this_rewriter); }


  // [312] @is_not_an_update: (Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_312_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf10e60);
  }

  static inline data_expression rewr_312_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_312_0(this_rewriter); }

  static inline data_expression rewr_312_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_312_0(this_rewriter); }


  // [89] ==: (Place -> List(Nat)) # (Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_89_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Place. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(28), rewr_299_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(26))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(26))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Place. @var_0(x1) == @var_1(x1)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb57f90))), arg0, arg1);
  }

  static inline data_expression rewr_89_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_89_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_89_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_89_2(t[0], t[1], this_rewriter); }


  // [89] ==: (Place -> List(Nat)) # (Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_89_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf10b60);
  }

  static inline data_expression rewr_89_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_89_0(this_rewriter); }

  static inline data_expression rewr_89_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_89_0(this_rewriter); }


  // [77] if: Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_77_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_0(@var_2)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb57180))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_77_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_77_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_77_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_77_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [77] if: Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_77_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb57180))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_77_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_77_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_77_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_77_3(t[0], t[1], t[2], this_rewriter); }


  // [77] if: Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)
  static inline const data_expression& rewr_77_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0e3f0);
  }

  static inline data_expression rewr_77_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_77_0(this_rewriter); }

  static inline data_expression rewr_77_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_77_0(this_rewriter); }


  // [76] @func_update_stable: (Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_76_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(3)
    const data_expression& arg3 = local_rewrite(arg_not_nf3,this_rewriter);
    // Considering argument 3
    // @@S(@var_0, @@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@C(@var_1 != @var_3, @@R(@var_0(@var_3)), @@M(@var_1, @@R(@var_2), @@X)))))))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const data_expression& var_1 = arg1; // S1a
      const DATA_EXPR2& var_2 = arg_not_nf2; // S1b
      const data_expression& var_3 = arg3; // S1a
      if (rewr_315_2(var_1, var_3,  this_rewriter) == sort_bool::true_()) // C
      {
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), var_3), this_rewriter); // R1 @var_0(@var_3)
      }
      else
      {
        if (var_1 == arg3) // M
        {
          return local_rewrite(var_2, this_rewriter); // R1 @var_2
        }
        else
        {
        }
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb57060))), local_rewrite(arg_not_nf0,this_rewriter), arg1, local_rewrite(arg_not_nf2,this_rewriter)), arg3);
  }

  static inline data_expression rewr_76_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_76_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_76_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_76_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [76] @func_update_stable: (Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_76_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb57060))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter), local_rewrite(arg_not_nf2,this_rewriter));
  }

  static inline data_expression rewr_76_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_76_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_76_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_76_3(t[0], t[1], t[2], this_rewriter); }


  // [76] @func_update_stable: (Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)
  static inline const data_expression& rewr_76_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf10e30);
  }

  static inline data_expression rewr_76_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_76_0(this_rewriter); }

  static inline data_expression rewr_76_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_76_0(this_rewriter); }


  // [13] @func_update: (Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_13_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(@func_update_stable, @@S(@var_0, @@N(@@S(@var_1, @@N(@@S(@var_2, @@D(@@N(@@S(@var_3, @@N(@@S(@var_4, @@N(@@S(@var_5, @@C(@var_1 < @var_3, @@R(@var_0[@var_3 -> @var_4][@var_1 -> @var_2](@var_5)), @@X))))))))))))), @@X)
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb57060) // F1
      {
        const data_expression& var_0 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_1 = down_cast<data_expression>(arg0[2]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[3]); // S2
        const data_expression& var_3 = arg1; // S1a
        const DATA_EXPR2& var_4 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_5 = arg_not_nf3; // S1b
        if (rewr_314_2(var_1, var_3,  this_rewriter) == sort_bool::true_()) // C
        {
          return rewr_76_4(delayed_rewr_13_3<data_expression, data_expression, DATA_EXPR2>(var_0, var_3, var_4,  this_rewriter), var_1, var_2, local_rewrite(var_5, this_rewriter),  this_rewriter); // R1 @var_0[@var_3 -> @var_4][@var_1 -> @var_2](@var_5)
        }
        else
        {
        }
      }
      else
      {
      }
    }
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@S(@var_0, @@F(@func_update_stable, @@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@D(@@N(@@S(@var_4, @@M(@var_2, @@N(@@S(@var_5, @@N(@@S(@var_6, @@R(@if_always_else(@var_1(@var_2) == @var_5, @var_1, @var_1[@var_2 -> @var_5])(@var_6)))))), @@N(@@S(@var_5, @@N(@@S(@var_6, @@C(@var_4 < @var_2, @@R(@if_always_else(@var_1(@var_4) == @var_5, @var_1[@var_2 -> @var_3], @var_1[@var_2 -> @var_3][@var_4 -> @var_5])(@var_6)), @@C(@is_not_an_update(@var_0), @@R(@if_always_else(@var_0(@var_4) == @var_5, @var_0, @var_0[@var_4 -> @var_5])(@var_6)), @@X))))))))))))))), @@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@C(@is_not_an_update(@var_0), @@R(@if_always_else(@var_0(@var_1) == @var_2, @var_0, @var_0[@var_1 -> @var_2])(@var_3)), @@X)))))))))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb57060) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        const data_expression& var_3 = down_cast<data_expression>(arg0[3]); // S2
        const data_expression& var_4 = arg1; // S1a
        if (var_2 == arg1) // M
        {
          const data_expression& var_5 = arg2; // S1a
          const DATA_EXPR3& var_6 = arg_not_nf3; // S1b
          return rewr_313_4(rewr_299_2(rewrite_with_arguments_in_normal_form(application(var_1, var_2), this_rewriter), var_5,  this_rewriter), var_1, rewr_76_3(var_1, var_2, var_5,  this_rewriter), local_rewrite(var_6, this_rewriter),  this_rewriter); // R1 @if_always_else(@var_1(@var_2) == @var_5, @var_1, @var_1[@var_2 -> @var_5])(@var_6)
        }
        else
        {
          const data_expression& var_5 = arg2; // S1a
          const DATA_EXPR3& var_6 = arg_not_nf3; // S1b
          if (rewr_314_2(var_4, var_2,  this_rewriter) == sort_bool::true_()) // C
          {
            return rewr_313_4(rewr_299_2(rewrite_with_arguments_in_normal_form(application(var_1, var_4), this_rewriter), var_5,  this_rewriter), rewr_76_3(var_1, var_2, var_3,  this_rewriter), rewr_76_3(delayed_rewr_76_3<data_expression, data_expression, data_expression>(var_1, var_2, var_3,  this_rewriter), var_4, var_5,  this_rewriter), local_rewrite(var_6, this_rewriter),  this_rewriter); // R1 @if_always_else(@var_1(@var_4) == @var_5, @var_1[@var_2 -> @var_3], @var_1[@var_2 -> @var_3][@var_4 -> @var_5])(@var_6)
          }
          else
          {
            if (rewr_312_1(var_0,  this_rewriter) == sort_bool::true_()) // C
            {
              return rewr_313_4(rewr_299_2(rewrite_with_arguments_in_normal_form(application(var_0, var_4), this_rewriter), var_5,  this_rewriter), var_0, rewr_76_3(var_0, var_4, var_5,  this_rewriter), local_rewrite(var_6, this_rewriter),  this_rewriter); // R1 @if_always_else(@var_0(@var_4) == @var_5, @var_0, @var_0[@var_4 -> @var_5])(@var_6)
            }
            else
            {
            }
          }
        }
      }
      else
      {
        const data_expression& var_1 = arg1; // S1a
        const data_expression& var_2 = arg2; // S1a
        const DATA_EXPR3& var_3 = arg_not_nf3; // S1b
        if (rewr_312_1(var_0,  this_rewriter) == sort_bool::true_()) // C
        {
          return rewr_313_4(rewr_299_2(rewrite_with_arguments_in_normal_form(application(var_0, var_1), this_rewriter), var_2,  this_rewriter), var_0, rewr_76_3(var_0, var_1, var_2,  this_rewriter), local_rewrite(var_3, this_rewriter),  this_rewriter); // R1 @if_always_else(@var_0(@var_1) == @var_2, @var_0, @var_0[@var_1 -> @var_2])(@var_3)
        }
        else
        {
        }
      }
    }
    // @@A(3)
    const data_expression& arg3 = local_rewrite(arg_not_nf3,this_rewriter);
    // Considering argument 3
    // @@S(@var_0, @@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@C(@var_1 != @var_3, @@R(@var_0(@var_3)), @@M(@var_1, @@R(@var_2), @@X)))))))))
    {
      const data_expression& var_0 = arg0; // S1a
      const data_expression& var_1 = arg1; // S1a
      const data_expression& var_2 = arg2; // S1a
      const data_expression& var_3 = arg3; // S1a
      if (rewr_315_2(var_1, var_3,  this_rewriter) == sort_bool::true_()) // C
      {
        return rewrite_with_arguments_in_normal_form(application(var_0, var_3), this_rewriter); // R1 @var_0(@var_3)
      }
      else
      {
        if (var_1 == arg3) // M
        {
          return var_2; // R1 @var_2
        }
        else
        {
        }
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb55740))), arg0, arg1, arg2), arg3);
  }

  static inline data_expression rewr_13_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_13_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_13_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_13_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [76] @func_update_stable: (Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  class delayed_rewr_76_3
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      const DATA_EXPR2& m_t2;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_76_3(const DATA_EXPR0& t0, const DATA_EXPR1& t1, const DATA_EXPR2& t2, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), m_t2(t2), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_76_3(m_t0, m_t1, m_t2, this_rewriter);
      }
  };
  
  // [13] @func_update: (Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  class delayed_rewr_13_3
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      const DATA_EXPR2& m_t2;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_13_3(const DATA_EXPR0& t0, const DATA_EXPR1& t1, const DATA_EXPR2& t2, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), m_t2(t2), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_13_3(m_t0, m_t1, m_t2, this_rewriter);
      }
  };
  
  // [13] @func_update: (Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_13_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@F(@func_update_stable, @@S(@var_0, @@N(@@S(@var_1, @@N(@@S(@var_2, @@D(@@N(@@S(@var_3, @@N(@@S(@var_4, @@C(@var_1 < @var_3, @@R(@var_0[@var_3 -> @var_4][@var_1 -> @var_2]), @@X))))))))))), @@X)
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb57060) // F1
      {
        const data_expression& var_0 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_1 = down_cast<data_expression>(arg0[2]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[3]); // S2
        const data_expression& var_3 = arg1; // S1a
        const DATA_EXPR2& var_4 = arg_not_nf2; // S1b
        if (rewr_314_2(var_1, var_3,  this_rewriter) == sort_bool::true_()) // C
        {
          return rewr_76_3(delayed_rewr_13_3<data_expression, data_expression, DATA_EXPR2>(var_0, var_3, var_4,  this_rewriter), var_1, var_2,  this_rewriter); // R1 @var_0[@var_3 -> @var_4][@var_1 -> @var_2]
        }
        else
        {
        }
      }
      else
      {
      }
    }
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@S(@var_0, @@F(@func_update_stable, @@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@D(@@N(@@S(@var_4, @@M(@var_2, @@N(@@S(@var_5, @@R(@if_always_else(@var_1(@var_2) == @var_5, @var_1, @var_1[@var_2 -> @var_5])))), @@N(@@S(@var_5, @@C(@is_not_an_update(@var_0), @@R(@if_always_else(@var_0(@var_4) == @var_5, @var_0, @var_0[@var_4 -> @var_5])), @@C(@var_4 < @var_2, @@R(@if_always_else(@var_1(@var_4) == @var_5, @var_1[@var_2 -> @var_3], @var_1[@var_2 -> @var_3][@var_4 -> @var_5])), @@X))))))))))))), @@N(@@S(@var_1, @@N(@@S(@var_2, @@C(@is_not_an_update(@var_0), @@R(@if_always_else(@var_0(@var_1) == @var_2, @var_0, @var_0[@var_1 -> @var_2])), @@X)))))))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb57060) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        const data_expression& var_3 = down_cast<data_expression>(arg0[3]); // S2
        const data_expression& var_4 = arg1; // S1a
        if (var_2 == arg1) // M
        {
          const data_expression& var_5 = arg2; // S1a
          return rewr_313_3(rewr_299_2(rewrite_with_arguments_in_normal_form(application(var_1, var_2), this_rewriter), var_5,  this_rewriter), var_1, rewr_76_3(var_1, var_2, var_5,  this_rewriter),  this_rewriter); // R1 @if_always_else(@var_1(@var_2) == @var_5, @var_1, @var_1[@var_2 -> @var_5])
        }
        else
        {
          const data_expression& var_5 = arg2; // S1a
          if (rewr_312_1(var_0,  this_rewriter) == sort_bool::true_()) // C
          {
            return rewr_313_3(rewr_299_2(rewrite_with_arguments_in_normal_form(application(var_0, var_4), this_rewriter), var_5,  this_rewriter), var_0, rewr_76_3(var_0, var_4, var_5,  this_rewriter),  this_rewriter); // R1 @if_always_else(@var_0(@var_4) == @var_5, @var_0, @var_0[@var_4 -> @var_5])
          }
          else
          {
            if (rewr_314_2(var_4, var_2,  this_rewriter) == sort_bool::true_()) // C
            {
              return rewr_313_3(rewr_299_2(rewrite_with_arguments_in_normal_form(application(var_1, var_4), this_rewriter), var_5,  this_rewriter), rewr_76_3(var_1, var_2, var_3,  this_rewriter), rewr_76_3(delayed_rewr_76_3<data_expression, data_expression, data_expression>(var_1, var_2, var_3,  this_rewriter), var_4, var_5,  this_rewriter),  this_rewriter); // R1 @if_always_else(@var_1(@var_4) == @var_5, @var_1[@var_2 -> @var_3], @var_1[@var_2 -> @var_3][@var_4 -> @var_5])
            }
            else
            {
            }
          }
        }
      }
      else
      {
        const data_expression& var_1 = arg1; // S1a
        const data_expression& var_2 = arg2; // S1a
        if (rewr_312_1(var_0,  this_rewriter) == sort_bool::true_()) // C
        {
          return rewr_313_3(rewr_299_2(rewrite_with_arguments_in_normal_form(application(var_0, var_1), this_rewriter), var_2,  this_rewriter), var_0, rewr_76_3(var_0, var_1, var_2,  this_rewriter),  this_rewriter); // R1 @if_always_else(@var_0(@var_1) == @var_2, @var_0, @var_0[@var_1 -> @var_2])
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb55740))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_13_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_13_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_13_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_13_3(t[0], t[1], t[2], this_rewriter); }


  // [13] @func_update: (Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)
  static inline const data_expression& rewr_13_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf103f0);
  }

  static inline data_expression rewr_13_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_13_0(this_rewriter); }

  static inline data_expression rewr_13_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_13_0(this_rewriter); }


  // [307] if: Bool # (Nat # Nat -> List(Nat)) # (Nat # Nat -> List(Nat)) -> Nat # Nat -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_307_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
          const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
          return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_0(@var_2, @var_3)
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_1, local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5d7b0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_307_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_307_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_307_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_307_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [307] if: Bool # (Nat # Nat -> List(Nat)) # (Nat # Nat -> List(Nat)) -> Nat # Nat -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_307_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5d7b0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_307_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_307_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_307_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_307_3(t[0], t[1], t[2], this_rewriter); }


  // [307] if: Bool # (Nat # Nat -> List(Nat)) # (Nat # Nat -> List(Nat)) -> Nat # Nat -> List(Nat)
  static inline const data_expression& rewr_307_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf105a0);
  }

  static inline data_expression rewr_307_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_307_0(this_rewriter); }

  static inline data_expression rewr_307_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_307_0(this_rewriter); }


  // [306] !=: (Nat # Nat -> List(Nat)) # (Nat # Nat -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_306_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_305_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5d780))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_306_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_306_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_306_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_306_2(t[0], t[1], this_rewriter); }


  // [306] !=: (Nat # Nat -> List(Nat)) # (Nat # Nat -> List(Nat)) -> Bool
  static inline const data_expression& rewr_306_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf10570);
  }

  static inline data_expression rewr_306_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_306_0(this_rewriter); }

  static inline data_expression rewr_306_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_306_0(this_rewriter); }


  // [305] ==: (Nat # Nat -> List(Nat)) # (Nat # Nat -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_305_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: Nat. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(19), rewr_299_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(13)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(22))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(13)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(22))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: Nat. @var_0(x1, x3) == @var_1(x1, x3)
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(true), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5d750))), arg0, arg1);
  }

  static inline data_expression rewr_305_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_305_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_305_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_305_2(t[0], t[1], this_rewriter); }


  // [305] ==: (Nat # Nat -> List(Nat)) # (Nat # Nat -> List(Nat)) -> Bool
  static inline const data_expression& rewr_305_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf10300);
  }

  static inline data_expression rewr_305_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_305_0(this_rewriter); }

  static inline data_expression rewr_305_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_305_0(this_rewriter); }


  // [302] if: Bool # List(Nat) # List(Nat) -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_302_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5d4b0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_302_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_302_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_302_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_302_3(t[0], t[1], t[2], this_rewriter); }


  // [302] if: Bool # List(Nat) # List(Nat) -> List(Nat)
  static inline const data_expression& rewr_302_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf0cee0);
  }

  static inline data_expression rewr_302_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_302_0(this_rewriter); }

  static inline data_expression rewr_302_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_302_0(this_rewriter); }


  // [301] !=: List(Nat) # List(Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_301_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_299_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5d480))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_301_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_301_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_301_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_301_2(t[0], t[1], this_rewriter); }


  // [301] !=: List(Nat) # List(Nat) -> Bool
  static inline const data_expression& rewr_301_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddc93100);
  }

  static inline data_expression rewr_301_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_301_0(this_rewriter); }

  static inline data_expression rewr_301_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_301_0(this_rewriter); }


  // [299] ==: List(Nat) # List(Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_299_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@F(|>, @@S(@var_1, @@N(@@S(@var_2, @@D(@@N(@@M(@var_0, @@R(true), @@F([], @@R(false), @@F(|>, @@S(@var_3, @@N(@@S(@var_4, @@R(@var_1 == @var_3 && @var_2 == @var_4)))), @@X)))))))), @@F([], @@D(@@N(@@M(@var_0, @@R(true), @@F(|>, @@N(@@R(false)), @@X)))), @@N(@@M(@var_0, @@R(true), @@X)))))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb56970) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
        }
        else
        {
          if (uint_address(arg1) == 0x5641ddb556b0) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb56970) // F1
            {
              const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
              const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
              return rewr_45_2(rewr_35_2(var_1, var_3,  this_rewriter), delayed_rewr_299_2<data_expression, data_expression>(var_2, var_4,  this_rewriter),  this_rewriter); // R1 @var_1 == @var_3 && @var_2 == @var_4
            }
            else
            {
            }
          }
        }
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb556b0) // F1
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb56970) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
            }
            else
            {
            }
          }
        }
        else
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5cca0))), arg0, arg1);
  }

  static inline data_expression rewr_299_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_299_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_299_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_299_2(t[0], t[1], this_rewriter); }


  // [299] ==: List(Nat) # List(Nat) -> Bool
  static inline const data_expression& rewr_299_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf104b0);
  }

  static inline data_expression rewr_299_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_299_0(this_rewriter); }

  static inline data_expression rewr_299_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_299_0(this_rewriter); }


  // [56] ++: List(Nat) # List(Nat) -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_56_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(|>, @@S(@var_0, @@N(@@S(@var_1, @@D(@@N(@@S(@var_2, @@R(@var_0 |> @var_1 ++ @var_2))))))), @@F([], @@D(@@N(@@S(@var_0, @@R(@var_0)))), @@X))
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb56970) // F1
      {
        const data_expression& var_0 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_1 = down_cast<data_expression>(arg0[2]); // S2
        const DATA_EXPR1& var_2 = arg_not_nf1; // S1b
        return rewr_60_2(var_0, rewr_56_2(var_1, var_2,  this_rewriter),  this_rewriter); // R1 @var_0 |> @var_1 ++ @var_2
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb556b0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@F([], @@R(@var_0), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address(arg1) == 0x5641ddb556b0) // F1
      {
        return var_0; // R1 @var_0
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb56700))), arg0, arg1);
  }

  static inline data_expression rewr_56_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_56_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_56_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_56_2(t[0], t[1], this_rewriter); }


  // [56] ++: List(Nat) # List(Nat) -> List(Nat)
  static inline const data_expression& rewr_56_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddc93130);
  }

  static inline data_expression rewr_56_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_56_0(this_rewriter); }

  static inline data_expression rewr_56_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_56_0(this_rewriter); }


  // [41] <=: List(Nat) # List(Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_41_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@F(|>, @@S(@var_1, @@N(@@S(@var_2, @@D(@@N(@@M(@var_0, @@R(true), @@F([], @@R(false), @@F(|>, @@S(@var_3, @@N(@@S(@var_4, @@R(@var_1 == @var_3 && @var_2 <= @var_4 || @var_1 < @var_3)))), @@X)))))))), @@F([], @@D(@@N(@@M(@var_0, @@R(true), @@F(|>, @@N(@@R(true)), @@X)))), @@N(@@M(@var_0, @@R(true), @@X)))))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb56970) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
        }
        else
        {
          if (uint_address(arg1) == 0x5641ddb556b0) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb56970) // F1
            {
              const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
              const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
              return rewr_82_2(rewr_45_2(rewr_35_2(var_1, var_3,  this_rewriter), delayed_rewr_41_2<data_expression, data_expression>(var_2, var_4,  this_rewriter),  this_rewriter), delayed_rewr_88_2<data_expression, data_expression>(var_1, var_3,  this_rewriter),  this_rewriter); // R1 @var_1 == @var_3 && @var_2 <= @var_4 || @var_1 < @var_3
            }
            else
            {
            }
          }
        }
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb556b0) // F1
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb56970) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
            }
            else
            {
            }
          }
        }
        else
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb56040))), arg0, arg1);
  }

  static inline data_expression rewr_41_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_41_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_41_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_41_2(t[0], t[1], this_rewriter); }


  // [88] <: Nat # Nat -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_88_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_88_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_88_2(m_t0, m_t1, this_rewriter);
      }
  };
  
  // [41] <=: List(Nat) # List(Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_41_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_41_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_41_2(m_t0, m_t1, this_rewriter);
      }
  };
  
  // [41] <=: List(Nat) # List(Nat) -> Bool
  static inline const data_expression& rewr_41_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf10dd0);
  }

  static inline data_expression rewr_41_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_41_0(this_rewriter); }

  static inline data_expression rewr_41_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_41_0(this_rewriter); }


  // [34] #: List(Nat) -> Nat
  template < class DATA_EXPR0>
  static inline data_expression rewr_34_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(|>, @@N(@@S(@var_1, @@R(succ(#@var_1)))), @@F([], @@R(0), @@X))
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb56970) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[2]); // S2
        return rewr_17_1(rewr_101_1(rewr_34_1(var_1,  this_rewriter),  this_rewriter),  this_rewriter); // R1 succ(#@var_1)
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb556b0) // F1
        {
          return *reinterpret_cast<const data_expression*>(0x5641ddf10d70); // R1 0
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb55e30))), arg0);
  }

  static inline data_expression rewr_34_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_34_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_34_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_34_1(t[0], this_rewriter); }


  // [34] #: List(Nat) -> Nat
  static inline const data_expression& rewr_34_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddc932b0);
  }

  static inline data_expression rewr_34_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_34_0(this_rewriter); }

  static inline data_expression rewr_34_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_34_0(this_rewriter); }


  // [289] if: Bool # List(Trans) # List(Trans) -> List(Trans)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_289_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5c7c0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_289_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_289_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_289_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_289_3(t[0], t[1], t[2], this_rewriter); }


  // [289] if: Bool # List(Trans) # List(Trans) -> List(Trans)
  static inline const data_expression& rewr_289_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf11030);
  }

  static inline data_expression rewr_289_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_289_0(this_rewriter); }

  static inline data_expression rewr_289_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_289_0(this_rewriter); }


  // [288] !=: List(Trans) # List(Trans) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_288_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_284_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5c790))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_288_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_288_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_288_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_288_2(t[0], t[1], this_rewriter); }


  // [288] !=: List(Trans) # List(Trans) -> Bool
  static inline const data_expression& rewr_288_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf10480);
  }

  static inline data_expression rewr_288_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_288_0(this_rewriter); }

  static inline data_expression rewr_288_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_288_0(this_rewriter); }


  // [284] ==: List(Trans) # List(Trans) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_284_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@F(|>, @@S(@var_1, @@N(@@S(@var_2, @@D(@@N(@@M(@var_0, @@R(true), @@F([], @@R(false), @@F(|>, @@S(@var_3, @@N(@@S(@var_4, @@R(@var_1 == @var_3 && @var_2 == @var_4)))), @@X)))))))), @@F([], @@D(@@N(@@M(@var_0, @@R(true), @@F(|>, @@N(@@R(false)), @@X)))), @@N(@@M(@var_0, @@R(true), @@X)))))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb5bcb0) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
        }
        else
        {
          if (uint_address(arg1) == 0x5641ddb5bc80) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb5bcb0) // F1
            {
              const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
              const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
              return rewr_45_2(rewr_81_2(var_1, var_3,  this_rewriter), delayed_rewr_284_2<data_expression, data_expression>(var_2, var_4,  this_rewriter),  this_rewriter); // R1 @var_1 == @var_3 && @var_2 == @var_4
            }
            else
            {
            }
          }
        }
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb5bc80) // F1
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb5bcb0) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
            }
            else
            {
            }
          }
        }
        else
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5bf50))), arg0, arg1);
  }

  static inline data_expression rewr_284_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_284_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_284_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_284_2(t[0], t[1], this_rewriter); }


  // [284] ==: List(Trans) # List(Trans) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_284_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_284_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_284_2(m_t0, m_t1, this_rewriter);
      }
  };
  
  // [284] ==: List(Trans) # List(Trans) -> Bool
  static inline const data_expression& rewr_284_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf10390);
  }

  static inline data_expression rewr_284_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_284_0(this_rewriter); }

  static inline data_expression rewr_284_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_284_0(this_rewriter); }


  // [271] if: Bool # List(PlaceTokens) # List(PlaceTokens) -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_271_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5641ddb571e0) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb557a0) // F1
        {
          const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
          return local_rewrite(var_0, this_rewriter); // R1 @var_0
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@A(2)
    const data_expression& arg2 = local_rewrite(arg_not_nf2,this_rewriter);
    // Considering argument 2
    // @@N(@@S(@var_1, @@N(@@M(@var_1, @@R(@var_1), @@X))))
    {
      const data_expression& var_1 = arg1; // S1a
      if (var_1 == arg2) // M
      {
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5b9b0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_271_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_271_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_271_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_271_3(t[0], t[1], t[2], this_rewriter); }


  // [271] if: Bool # List(PlaceTokens) # List(PlaceTokens) -> List(PlaceTokens)
  static inline const data_expression& rewr_271_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddc931c0);
  }

  static inline data_expression rewr_271_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_271_0(this_rewriter); }

  static inline data_expression rewr_271_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_271_0(this_rewriter); }


  // [270] !=: List(PlaceTokens) # List(PlaceTokens) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_270_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_265_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5b980))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_270_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_270_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_270_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_270_2(t[0], t[1], this_rewriter); }


  // [270] !=: List(PlaceTokens) # List(PlaceTokens) -> Bool
  static inline const data_expression& rewr_270_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddc93190);
  }

  static inline data_expression rewr_270_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_270_0(this_rewriter); }

  static inline data_expression rewr_270_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_270_0(this_rewriter); }


  // [265] ==: List(PlaceTokens) # List(PlaceTokens) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_265_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@F(|>, @@S(@var_1, @@N(@@S(@var_2, @@D(@@N(@@M(@var_0, @@R(true), @@F([], @@R(false), @@F(|>, @@S(@var_3, @@N(@@S(@var_4, @@R(@var_1 == @var_3 && @var_2 == @var_4)))), @@X)))))))), @@F([], @@D(@@N(@@M(@var_0, @@R(true), @@F(|>, @@N(@@R(false)), @@X)))), @@N(@@M(@var_0, @@R(true), @@X)))))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5641ddb56610) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
        }
        else
        {
          if (uint_address(arg1) == 0x5641ddb564f0) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb56610) // F1
            {
              const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
              const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
              return rewr_45_2(rewr_266_2(var_1, var_3,  this_rewriter), delayed_rewr_265_2<data_expression, data_expression>(var_2, var_4,  this_rewriter),  this_rewriter); // R1 @var_1 == @var_3 && @var_2 == @var_4
            }
            else
            {
            }
          }
        }
      }
      else
      {
        if (uint_address(arg0) == 0x5641ddb564f0) // F1
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb56610) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
            }
            else
            {
            }
          }
        }
        else
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5b110))), arg0, arg1);
  }

  static inline data_expression rewr_265_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_265_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_265_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_265_2(t[0], t[1], this_rewriter); }


  // [265] ==: List(PlaceTokens) # List(PlaceTokens) -> Bool
  static inline const data_expression& rewr_265_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf10e00);
  }

  static inline data_expression rewr_265_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_265_0(this_rewriter); }

  static inline data_expression rewr_265_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_265_0(this_rewriter); }


  // [43] in: PlaceTokens # List(PlaceTokens) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_43_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@N(@@F([], @@R(false), @@X))
    {
      if (uint_address(arg1) == 0x5641ddb564f0) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x5641ddcc1390); // R1 false
      }
      else
      {
      }
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@S(@var_0, @@N(@@F(|>, @@S(@var_1, @@N(@@S(@var_2, @@R(@var_0 == @var_1 || @var_0 in @var_2)))), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5641ddb56610) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg1[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg1[2]); // S2
        return rewr_82_2(rewr_266_2(var_0, var_1,  this_rewriter), delayed_rewr_43_2<data_expression, data_expression>(var_0, var_2,  this_rewriter),  this_rewriter); // R1 @var_0 == @var_1 || @var_0 in @var_2
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb56100))), arg0, arg1);
  }

  static inline data_expression rewr_43_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_43_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_43_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_43_2(t[0], t[1], this_rewriter); }


  // [43] in: PlaceTokens # List(PlaceTokens) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_43_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_43_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_43_2(m_t0, m_t1, this_rewriter);
      }
  };
  
  // [43] in: PlaceTokens # List(PlaceTokens) -> Bool
  static inline const data_expression& rewr_43_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf114d0);
  }

  static inline data_expression rewr_43_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_43_0(this_rewriter); }

  static inline data_expression rewr_43_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_43_0(this_rewriter); }


  // [812] marking_trans: (Place -> List(Nat)) # Trans_name -> MarkingTrans
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_812_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddbfa3b0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_812_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_812_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_812_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_812_2(t[0], t[1], this_rewriter); }


  // [812] marking_trans: (Place -> List(Nat)) # Trans_name -> MarkingTrans
  static inline const data_expression& rewr_812_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddc93250);
  }

  static inline data_expression rewr_812_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_812_0(this_rewriter); }

  static inline data_expression rewr_812_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_812_0(this_rewriter); }


  // [20] place_tokens: Place # List(Nat) -> PlaceTokens
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_20_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb55a40))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_20_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_20_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_20_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_20_2(t[0], t[1], this_rewriter); }


  // [20] place_tokens: Place # List(Nat) -> PlaceTokens
  static inline const data_expression& rewr_20_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddc93280);
  }

  static inline data_expression rewr_20_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_20_0(this_rewriter); }

  static inline data_expression rewr_20_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_20_0(this_rewriter); }


  // [28] trans: Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_28_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb55c80))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter), local_rewrite(arg_not_nf2,this_rewriter), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_28_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_28_5(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), term_not_in_normal_form(t[3], this_rewriter), term_not_in_normal_form(t[4], this_rewriter), this_rewriter); }

  static inline data_expression rewr_28_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_28_5(t[0], t[1], t[2], t[3], t[4], this_rewriter); }


  // [28] trans: Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans
  static inline const data_expression& rewr_28_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf10ce0);
  }

  static inline data_expression rewr_28_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_28_0(this_rewriter); }

  static inline data_expression rewr_28_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_28_0(this_rewriter); }


  // [27] t3: Trans_name
  static inline const data_expression& rewr_27_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf10fd0);
  }

  static inline data_expression rewr_27_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_27_0(this_rewriter); }

  static inline data_expression rewr_27_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_27_0(this_rewriter); }


  // [31] t2: Trans_name
  static inline const data_expression& rewr_31_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf105d0);
  }

  static inline data_expression rewr_31_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_31_0(this_rewriter); }

  static inline data_expression rewr_31_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_31_0(this_rewriter); }


  // [36] t1: Trans_name
  static inline const data_expression& rewr_36_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf11000);
  }

  static inline data_expression rewr_36_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_36_0(this_rewriter); }

  static inline data_expression rewr_36_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_36_0(this_rewriter); }


  // [37] t0: Trans_name
  static inline const data_expression& rewr_37_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf10ee0);
  }

  static inline data_expression rewr_37_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_37_0(this_rewriter); }

  static inline data_expression rewr_37_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_37_0(this_rewriter); }


  // [19] p5: Place
  static inline const data_expression& rewr_19_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf10420);
  }

  static inline data_expression rewr_19_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_19_0(this_rewriter); }

  static inline data_expression rewr_19_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_19_0(this_rewriter); }


  // [23] p4: Place
  static inline const data_expression& rewr_23_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf11500);
  }

  static inline data_expression rewr_23_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_23_0(this_rewriter); }

  static inline data_expression rewr_23_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_23_0(this_rewriter); }


  // [25] p3: Place
  static inline const data_expression& rewr_25_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf10600);
  }

  static inline data_expression rewr_25_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_25_0(this_rewriter); }

  static inline data_expression rewr_25_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_25_0(this_rewriter); }


  // [30] p2: Place
  static inline const data_expression& rewr_30_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf10f40);
  }

  static inline data_expression rewr_30_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_30_0(this_rewriter); }

  static inline data_expression rewr_30_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_30_0(this_rewriter); }


  // [33] p1: Place
  static inline const data_expression& rewr_33_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddc93220);
  }

  static inline data_expression rewr_33_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_33_0(this_rewriter); }

  static inline data_expression rewr_33_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_33_0(this_rewriter); }


  // [11] p0: Place
  static inline const data_expression& rewr_11_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee7660);
  }

  static inline data_expression rewr_11_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_11_0(this_rewriter); }

  static inline data_expression rewr_11_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_11_0(this_rewriter); }


  // [80] @cDub: Bool # Pos -> Pos
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_80_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb57210))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_80_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_80_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_80_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_80_2(t[0], t[1], this_rewriter); }


  // [80] @cDub: Bool # Pos -> Pos
  static inline const data_expression& rewr_80_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddc93160);
  }

  static inline data_expression rewr_80_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_80_0(this_rewriter); }

  static inline data_expression rewr_80_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_80_0(this_rewriter); }


  // [78] 1: Pos
  static inline const data_expression& rewr_78_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddcc29e0);
  }

  static inline data_expression rewr_78_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_78_0(this_rewriter); }

  static inline data_expression rewr_78_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_78_0(this_rewriter); }


  // [119] @cPair: Nat # Nat -> @NatPair
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_119_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb59400))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_119_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_119_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_119_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_119_2(t[0], t[1], this_rewriter); }


  // [119] @cPair: Nat # Nat -> @NatPair
  static inline const data_expression& rewr_119_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf114a0);
  }

  static inline data_expression rewr_119_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_119_0(this_rewriter); }

  static inline data_expression rewr_119_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_119_0(this_rewriter); }


  // [75] 0: Nat
  static inline const data_expression& rewr_75_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf10d70);
  }

  static inline data_expression rewr_75_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_75_0(this_rewriter); }

  static inline data_expression rewr_75_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_75_0(this_rewriter); }


  // [17] @cNat: Pos -> Nat
  template < class DATA_EXPR0>
  static inline data_expression rewr_17_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb559b0))), local_rewrite(arg_not_nf0,this_rewriter));
  }

  static inline data_expression rewr_17_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_17_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_17_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_17_1(t[0], this_rewriter); }


  // [17] @cNat: Pos -> Nat
  static inline const data_expression& rewr_17_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddc931f0);
  }

  static inline data_expression rewr_17_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_17_0(this_rewriter); }

  static inline data_expression rewr_17_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_17_0(this_rewriter); }


  // [79] false: Bool
  static inline const data_expression& rewr_79_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddcc1390);
  }

  static inline data_expression rewr_79_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_79_0(this_rewriter); }

  static inline data_expression rewr_79_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_79_0(this_rewriter); }


  // [15] true: Bool
  static inline const data_expression& rewr_15_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddcc2a10);
  }

  static inline data_expression rewr_15_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_15_0(this_rewriter); }

  static inline data_expression rewr_15_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_15_0(this_rewriter); }


  // [60] |>: Nat # List(Nat) -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_60_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb56970))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_60_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_60_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_60_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_60_2(t[0], t[1], this_rewriter); }


  // [60] |>: Nat # List(Nat) -> List(Nat)
  static inline const data_expression& rewr_60_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddf107b0);
  }

  static inline data_expression rewr_60_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_60_0(this_rewriter); }

  static inline data_expression rewr_60_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_60_0(this_rewriter); }


  // [12] []: List(Nat)
  static inline const data_expression& rewr_12_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddee3eb0);
  }

  static inline data_expression rewr_12_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_12_0(this_rewriter); }

  static inline data_expression rewr_12_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_12_0(this_rewriter); }


  // [275] |>: Trans # List(Trans) -> List(Trans)
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_275_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb5bcb0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_275_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_275_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_275_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_275_2(t[0], t[1], this_rewriter); }


  // [275] |>: Trans # List(Trans) -> List(Trans)
  static inline const data_expression& rewr_275_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddc92b00);
  }

  static inline data_expression rewr_275_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_275_0(this_rewriter); }

  static inline data_expression rewr_275_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_275_0(this_rewriter); }


  // [274] []: List(Trans)
  static inline const data_expression& rewr_274_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddc92300);
  }

  static inline data_expression rewr_274_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_274_0(this_rewriter); }

  static inline data_expression rewr_274_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_274_0(this_rewriter); }


  // [54] |>: PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_54_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5641ddb56610))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_54_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_54_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_54_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_54_2(t[0], t[1], this_rewriter); }


  // [54] |>: PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)
  static inline const data_expression& rewr_54_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddc923f0);
  }

  static inline data_expression rewr_54_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_54_0(this_rewriter); }

  static inline data_expression rewr_54_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_54_0(this_rewriter); }


  // [51] []: List(PlaceTokens)
  static inline const data_expression& rewr_51_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5641ddc92420);
  }

  static inline data_expression rewr_51_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_51_0(this_rewriter); }

  static inline data_expression rewr_51_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_51_0(this_rewriter); }


};
} // namespace
void set_the_precompiled_rewrite_functions_in_a_lookup_table(RewriterCompilingJitty* this_rewriter)
{
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 13 + 3] = rewr_functions::rewr_13_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 13 + 3] = rewr_functions::rewr_13_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 13 + 4] = rewr_functions::rewr_13_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 13 + 4] = rewr_functions::rewr_13_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 17 + 1] = rewr_functions::rewr_17_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 17 + 1] = rewr_functions::rewr_17_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 20 + 2] = rewr_functions::rewr_20_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 20 + 2] = rewr_functions::rewr_20_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 28 + 5] = rewr_functions::rewr_28_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 28 + 5] = rewr_functions::rewr_28_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 34 + 1] = rewr_functions::rewr_34_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 34 + 1] = rewr_functions::rewr_34_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 35 + 2] = rewr_functions::rewr_35_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 35 + 2] = rewr_functions::rewr_35_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 40 + 1] = rewr_functions::rewr_40_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 40 + 1] = rewr_functions::rewr_40_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 41 + 2] = rewr_functions::rewr_41_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 41 + 2] = rewr_functions::rewr_41_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 42 + 1] = rewr_functions::rewr_42_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 42 + 1] = rewr_functions::rewr_42_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 43 + 2] = rewr_functions::rewr_43_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 43 + 2] = rewr_functions::rewr_43_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 44 + 2] = rewr_functions::rewr_44_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 44 + 2] = rewr_functions::rewr_44_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 45 + 2] = rewr_functions::rewr_45_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 45 + 2] = rewr_functions::rewr_45_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 52 + 2] = rewr_functions::rewr_52_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 52 + 2] = rewr_functions::rewr_52_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 52 + 3] = rewr_functions::rewr_52_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 52 + 3] = rewr_functions::rewr_52_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 53 + 2] = rewr_functions::rewr_53_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 53 + 2] = rewr_functions::rewr_53_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 54 + 2] = rewr_functions::rewr_54_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 54 + 2] = rewr_functions::rewr_54_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 55 + 2] = rewr_functions::rewr_55_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 55 + 2] = rewr_functions::rewr_55_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 55 + 3] = rewr_functions::rewr_55_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 55 + 3] = rewr_functions::rewr_55_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 56 + 2] = rewr_functions::rewr_56_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 56 + 2] = rewr_functions::rewr_56_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 57 + 1] = rewr_functions::rewr_57_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 57 + 1] = rewr_functions::rewr_57_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 58 + 2] = rewr_functions::rewr_58_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 58 + 2] = rewr_functions::rewr_58_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 58 + 3] = rewr_functions::rewr_58_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 58 + 3] = rewr_functions::rewr_58_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 59 + 2] = rewr_functions::rewr_59_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 59 + 2] = rewr_functions::rewr_59_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 60 + 2] = rewr_functions::rewr_60_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 60 + 2] = rewr_functions::rewr_60_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 61 + 2] = rewr_functions::rewr_61_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 61 + 2] = rewr_functions::rewr_61_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 76 + 3] = rewr_functions::rewr_76_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 76 + 3] = rewr_functions::rewr_76_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 76 + 4] = rewr_functions::rewr_76_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 76 + 4] = rewr_functions::rewr_76_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 77 + 3] = rewr_functions::rewr_77_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 77 + 3] = rewr_functions::rewr_77_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 77 + 4] = rewr_functions::rewr_77_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 77 + 4] = rewr_functions::rewr_77_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 80 + 2] = rewr_functions::rewr_80_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 80 + 2] = rewr_functions::rewr_80_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 81 + 2] = rewr_functions::rewr_81_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 81 + 2] = rewr_functions::rewr_81_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 82 + 2] = rewr_functions::rewr_82_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 82 + 2] = rewr_functions::rewr_82_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 83 + 2] = rewr_functions::rewr_83_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 83 + 2] = rewr_functions::rewr_83_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 84 + 3] = rewr_functions::rewr_84_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 84 + 3] = rewr_functions::rewr_84_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 85 + 1] = rewr_functions::rewr_85_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 85 + 1] = rewr_functions::rewr_85_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 86 + 1] = rewr_functions::rewr_86_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 86 + 1] = rewr_functions::rewr_86_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 87 + 2] = rewr_functions::rewr_87_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 87 + 2] = rewr_functions::rewr_87_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 88 + 2] = rewr_functions::rewr_88_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 88 + 2] = rewr_functions::rewr_88_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 89 + 2] = rewr_functions::rewr_89_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 89 + 2] = rewr_functions::rewr_89_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 101 + 1] = rewr_functions::rewr_101_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 101 + 1] = rewr_functions::rewr_101_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 103 + 1] = rewr_functions::rewr_103_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 103 + 1] = rewr_functions::rewr_103_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 104 + 2] = rewr_functions::rewr_104_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 104 + 2] = rewr_functions::rewr_104_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 114 + 1] = rewr_functions::rewr_114_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 114 + 1] = rewr_functions::rewr_114_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 119 + 2] = rewr_functions::rewr_119_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 119 + 2] = rewr_functions::rewr_119_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 265 + 2] = rewr_functions::rewr_265_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 265 + 2] = rewr_functions::rewr_265_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 266 + 2] = rewr_functions::rewr_266_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 266 + 2] = rewr_functions::rewr_266_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 270 + 2] = rewr_functions::rewr_270_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 270 + 2] = rewr_functions::rewr_270_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 271 + 3] = rewr_functions::rewr_271_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 271 + 3] = rewr_functions::rewr_271_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 275 + 2] = rewr_functions::rewr_275_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 275 + 2] = rewr_functions::rewr_275_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 284 + 2] = rewr_functions::rewr_284_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 284 + 2] = rewr_functions::rewr_284_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 288 + 2] = rewr_functions::rewr_288_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 288 + 2] = rewr_functions::rewr_288_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 289 + 3] = rewr_functions::rewr_289_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 289 + 3] = rewr_functions::rewr_289_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 299 + 2] = rewr_functions::rewr_299_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 299 + 2] = rewr_functions::rewr_299_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 301 + 2] = rewr_functions::rewr_301_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 301 + 2] = rewr_functions::rewr_301_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 302 + 3] = rewr_functions::rewr_302_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 302 + 3] = rewr_functions::rewr_302_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 305 + 2] = rewr_functions::rewr_305_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 305 + 2] = rewr_functions::rewr_305_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 306 + 2] = rewr_functions::rewr_306_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 306 + 2] = rewr_functions::rewr_306_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 307 + 3] = rewr_functions::rewr_307_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 307 + 3] = rewr_functions::rewr_307_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 307 + 5] = rewr_functions::rewr_307_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 307 + 5] = rewr_functions::rewr_307_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 312 + 1] = rewr_functions::rewr_312_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 312 + 1] = rewr_functions::rewr_312_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 313 + 3] = rewr_functions::rewr_313_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 313 + 3] = rewr_functions::rewr_313_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 313 + 4] = rewr_functions::rewr_313_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 313 + 4] = rewr_functions::rewr_313_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 314 + 2] = rewr_functions::rewr_314_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 314 + 2] = rewr_functions::rewr_314_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 315 + 2] = rewr_functions::rewr_315_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 315 + 2] = rewr_functions::rewr_315_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 316 + 2] = rewr_functions::rewr_316_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 316 + 2] = rewr_functions::rewr_316_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 321 + 2] = rewr_functions::rewr_321_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 321 + 2] = rewr_functions::rewr_321_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 322 + 2] = rewr_functions::rewr_322_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 322 + 2] = rewr_functions::rewr_322_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 323 + 3] = rewr_functions::rewr_323_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 323 + 3] = rewr_functions::rewr_323_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 323 + 6] = rewr_functions::rewr_323_6_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 323 + 6] = rewr_functions::rewr_323_6_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 323 + 7] = rewr_functions::rewr_323_7_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 323 + 7] = rewr_functions::rewr_323_7_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 332 + 2] = rewr_functions::rewr_332_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 332 + 2] = rewr_functions::rewr_332_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 333 + 2] = rewr_functions::rewr_333_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 333 + 2] = rewr_functions::rewr_333_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 334 + 2] = rewr_functions::rewr_334_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 334 + 2] = rewr_functions::rewr_334_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 335 + 3] = rewr_functions::rewr_335_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 335 + 3] = rewr_functions::rewr_335_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 335 + 4] = rewr_functions::rewr_335_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 335 + 4] = rewr_functions::rewr_335_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 344 + 2] = rewr_functions::rewr_344_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 344 + 2] = rewr_functions::rewr_344_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 345 + 2] = rewr_functions::rewr_345_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 345 + 2] = rewr_functions::rewr_345_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 346 + 3] = rewr_functions::rewr_346_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 346 + 3] = rewr_functions::rewr_346_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 346 + 4] = rewr_functions::rewr_346_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 346 + 4] = rewr_functions::rewr_346_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 351 + 2] = rewr_functions::rewr_351_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 351 + 2] = rewr_functions::rewr_351_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 352 + 2] = rewr_functions::rewr_352_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 352 + 2] = rewr_functions::rewr_352_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 353 + 3] = rewr_functions::rewr_353_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 353 + 3] = rewr_functions::rewr_353_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 353 + 5] = rewr_functions::rewr_353_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 353 + 5] = rewr_functions::rewr_353_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 362 + 2] = rewr_functions::rewr_362_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 362 + 2] = rewr_functions::rewr_362_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 363 + 2] = rewr_functions::rewr_363_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 363 + 2] = rewr_functions::rewr_363_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 364 + 2] = rewr_functions::rewr_364_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 364 + 2] = rewr_functions::rewr_364_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 365 + 3] = rewr_functions::rewr_365_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 365 + 3] = rewr_functions::rewr_365_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 365 + 4] = rewr_functions::rewr_365_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 365 + 4] = rewr_functions::rewr_365_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 370 + 2] = rewr_functions::rewr_370_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 370 + 2] = rewr_functions::rewr_370_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 371 + 2] = rewr_functions::rewr_371_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 371 + 2] = rewr_functions::rewr_371_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 372 + 3] = rewr_functions::rewr_372_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 372 + 3] = rewr_functions::rewr_372_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 372 + 5] = rewr_functions::rewr_372_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 372 + 5] = rewr_functions::rewr_372_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 377 + 2] = rewr_functions::rewr_377_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 377 + 2] = rewr_functions::rewr_377_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 378 + 2] = rewr_functions::rewr_378_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 378 + 2] = rewr_functions::rewr_378_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 379 + 3] = rewr_functions::rewr_379_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 379 + 3] = rewr_functions::rewr_379_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 379 + 8] = rewr_functions::rewr_379_8_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 379 + 8] = rewr_functions::rewr_379_8_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 388 + 2] = rewr_functions::rewr_388_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 388 + 2] = rewr_functions::rewr_388_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 389 + 2] = rewr_functions::rewr_389_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 389 + 2] = rewr_functions::rewr_389_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 390 + 3] = rewr_functions::rewr_390_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 390 + 3] = rewr_functions::rewr_390_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 390 + 4] = rewr_functions::rewr_390_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 390 + 4] = rewr_functions::rewr_390_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 395 + 2] = rewr_functions::rewr_395_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 395 + 2] = rewr_functions::rewr_395_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 396 + 2] = rewr_functions::rewr_396_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 396 + 2] = rewr_functions::rewr_396_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 397 + 3] = rewr_functions::rewr_397_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 397 + 3] = rewr_functions::rewr_397_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 397 + 5] = rewr_functions::rewr_397_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 397 + 5] = rewr_functions::rewr_397_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 402 + 2] = rewr_functions::rewr_402_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 402 + 2] = rewr_functions::rewr_402_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 403 + 2] = rewr_functions::rewr_403_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 403 + 2] = rewr_functions::rewr_403_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 404 + 2] = rewr_functions::rewr_404_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 404 + 2] = rewr_functions::rewr_404_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 405 + 3] = rewr_functions::rewr_405_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 405 + 3] = rewr_functions::rewr_405_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 405 + 7] = rewr_functions::rewr_405_7_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 405 + 7] = rewr_functions::rewr_405_7_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 414 + 2] = rewr_functions::rewr_414_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 414 + 2] = rewr_functions::rewr_414_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 415 + 2] = rewr_functions::rewr_415_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 415 + 2] = rewr_functions::rewr_415_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 416 + 3] = rewr_functions::rewr_416_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 416 + 3] = rewr_functions::rewr_416_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 416 + 4] = rewr_functions::rewr_416_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 416 + 4] = rewr_functions::rewr_416_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 425 + 2] = rewr_functions::rewr_425_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 425 + 2] = rewr_functions::rewr_425_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 426 + 2] = rewr_functions::rewr_426_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 426 + 2] = rewr_functions::rewr_426_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 427 + 2] = rewr_functions::rewr_427_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 427 + 2] = rewr_functions::rewr_427_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 428 + 3] = rewr_functions::rewr_428_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 428 + 3] = rewr_functions::rewr_428_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 428 + 4] = rewr_functions::rewr_428_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 428 + 4] = rewr_functions::rewr_428_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 433 + 2] = rewr_functions::rewr_433_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 433 + 2] = rewr_functions::rewr_433_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 434 + 2] = rewr_functions::rewr_434_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 434 + 2] = rewr_functions::rewr_434_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 435 + 3] = rewr_functions::rewr_435_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 435 + 3] = rewr_functions::rewr_435_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 435 + 5] = rewr_functions::rewr_435_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 435 + 5] = rewr_functions::rewr_435_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 444 + 2] = rewr_functions::rewr_444_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 444 + 2] = rewr_functions::rewr_444_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 445 + 2] = rewr_functions::rewr_445_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 445 + 2] = rewr_functions::rewr_445_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 446 + 3] = rewr_functions::rewr_446_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 446 + 3] = rewr_functions::rewr_446_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 446 + 4] = rewr_functions::rewr_446_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 446 + 4] = rewr_functions::rewr_446_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 451 + 2] = rewr_functions::rewr_451_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 451 + 2] = rewr_functions::rewr_451_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 452 + 2] = rewr_functions::rewr_452_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 452 + 2] = rewr_functions::rewr_452_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 453 + 3] = rewr_functions::rewr_453_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 453 + 3] = rewr_functions::rewr_453_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 453 + 5] = rewr_functions::rewr_453_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 453 + 5] = rewr_functions::rewr_453_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 458 + 2] = rewr_functions::rewr_458_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 458 + 2] = rewr_functions::rewr_458_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 459 + 2] = rewr_functions::rewr_459_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 459 + 2] = rewr_functions::rewr_459_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 460 + 3] = rewr_functions::rewr_460_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 460 + 3] = rewr_functions::rewr_460_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 460 + 5] = rewr_functions::rewr_460_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 460 + 5] = rewr_functions::rewr_460_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 465 + 2] = rewr_functions::rewr_465_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 465 + 2] = rewr_functions::rewr_465_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 466 + 2] = rewr_functions::rewr_466_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 466 + 2] = rewr_functions::rewr_466_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 467 + 3] = rewr_functions::rewr_467_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 467 + 3] = rewr_functions::rewr_467_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 467 + 5] = rewr_functions::rewr_467_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 467 + 5] = rewr_functions::rewr_467_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 476 + 2] = rewr_functions::rewr_476_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 476 + 2] = rewr_functions::rewr_476_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 477 + 2] = rewr_functions::rewr_477_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 477 + 2] = rewr_functions::rewr_477_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 478 + 3] = rewr_functions::rewr_478_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 478 + 3] = rewr_functions::rewr_478_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 478 + 4] = rewr_functions::rewr_478_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 478 + 4] = rewr_functions::rewr_478_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 483 + 2] = rewr_functions::rewr_483_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 483 + 2] = rewr_functions::rewr_483_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 484 + 2] = rewr_functions::rewr_484_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 484 + 2] = rewr_functions::rewr_484_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 485 + 3] = rewr_functions::rewr_485_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 485 + 3] = rewr_functions::rewr_485_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 485 + 5] = rewr_functions::rewr_485_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 485 + 5] = rewr_functions::rewr_485_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 490 + 2] = rewr_functions::rewr_490_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 490 + 2] = rewr_functions::rewr_490_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 491 + 2] = rewr_functions::rewr_491_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 491 + 2] = rewr_functions::rewr_491_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 492 + 3] = rewr_functions::rewr_492_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 492 + 3] = rewr_functions::rewr_492_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 492 + 5] = rewr_functions::rewr_492_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 492 + 5] = rewr_functions::rewr_492_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 492 + 6] = rewr_functions::rewr_492_6_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 492 + 6] = rewr_functions::rewr_492_6_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 497 + 2] = rewr_functions::rewr_497_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 497 + 2] = rewr_functions::rewr_497_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 498 + 2] = rewr_functions::rewr_498_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 498 + 2] = rewr_functions::rewr_498_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 499 + 3] = rewr_functions::rewr_499_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 499 + 3] = rewr_functions::rewr_499_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 499 + 5] = rewr_functions::rewr_499_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 499 + 5] = rewr_functions::rewr_499_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 504 + 2] = rewr_functions::rewr_504_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 504 + 2] = rewr_functions::rewr_504_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 505 + 2] = rewr_functions::rewr_505_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 505 + 2] = rewr_functions::rewr_505_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 506 + 3] = rewr_functions::rewr_506_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 506 + 3] = rewr_functions::rewr_506_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 506 + 5] = rewr_functions::rewr_506_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 506 + 5] = rewr_functions::rewr_506_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 511 + 2] = rewr_functions::rewr_511_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 511 + 2] = rewr_functions::rewr_511_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 512 + 2] = rewr_functions::rewr_512_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 512 + 2] = rewr_functions::rewr_512_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 513 + 3] = rewr_functions::rewr_513_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 513 + 3] = rewr_functions::rewr_513_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 513 + 5] = rewr_functions::rewr_513_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 513 + 5] = rewr_functions::rewr_513_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 513 + 6] = rewr_functions::rewr_513_6_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 513 + 6] = rewr_functions::rewr_513_6_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 518 + 2] = rewr_functions::rewr_518_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 518 + 2] = rewr_functions::rewr_518_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 519 + 2] = rewr_functions::rewr_519_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 519 + 2] = rewr_functions::rewr_519_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 520 + 3] = rewr_functions::rewr_520_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 520 + 3] = rewr_functions::rewr_520_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 520 + 5] = rewr_functions::rewr_520_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 520 + 5] = rewr_functions::rewr_520_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 525 + 2] = rewr_functions::rewr_525_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 525 + 2] = rewr_functions::rewr_525_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 526 + 2] = rewr_functions::rewr_526_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 526 + 2] = rewr_functions::rewr_526_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 527 + 3] = rewr_functions::rewr_527_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 527 + 3] = rewr_functions::rewr_527_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 527 + 6] = rewr_functions::rewr_527_6_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 527 + 6] = rewr_functions::rewr_527_6_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 527 + 7] = rewr_functions::rewr_527_7_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 527 + 7] = rewr_functions::rewr_527_7_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 532 + 2] = rewr_functions::rewr_532_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 532 + 2] = rewr_functions::rewr_532_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 533 + 2] = rewr_functions::rewr_533_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 533 + 2] = rewr_functions::rewr_533_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 534 + 3] = rewr_functions::rewr_534_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 534 + 3] = rewr_functions::rewr_534_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 534 + 5] = rewr_functions::rewr_534_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 534 + 5] = rewr_functions::rewr_534_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 539 + 2] = rewr_functions::rewr_539_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 539 + 2] = rewr_functions::rewr_539_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 540 + 2] = rewr_functions::rewr_540_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 540 + 2] = rewr_functions::rewr_540_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 541 + 3] = rewr_functions::rewr_541_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 541 + 3] = rewr_functions::rewr_541_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 541 + 5] = rewr_functions::rewr_541_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 541 + 5] = rewr_functions::rewr_541_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 546 + 2] = rewr_functions::rewr_546_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 546 + 2] = rewr_functions::rewr_546_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 547 + 2] = rewr_functions::rewr_547_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 547 + 2] = rewr_functions::rewr_547_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 548 + 3] = rewr_functions::rewr_548_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 548 + 3] = rewr_functions::rewr_548_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 548 + 5] = rewr_functions::rewr_548_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 548 + 5] = rewr_functions::rewr_548_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 553 + 2] = rewr_functions::rewr_553_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 553 + 2] = rewr_functions::rewr_553_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 554 + 2] = rewr_functions::rewr_554_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 554 + 2] = rewr_functions::rewr_554_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 555 + 3] = rewr_functions::rewr_555_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 555 + 3] = rewr_functions::rewr_555_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 555 + 6] = rewr_functions::rewr_555_6_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 555 + 6] = rewr_functions::rewr_555_6_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 565 + 2] = rewr_functions::rewr_565_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 565 + 2] = rewr_functions::rewr_565_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 566 + 2] = rewr_functions::rewr_566_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 566 + 2] = rewr_functions::rewr_566_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 567 + 2] = rewr_functions::rewr_567_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 567 + 2] = rewr_functions::rewr_567_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 568 + 3] = rewr_functions::rewr_568_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 568 + 3] = rewr_functions::rewr_568_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 568 + 4] = rewr_functions::rewr_568_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 568 + 4] = rewr_functions::rewr_568_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 577 + 2] = rewr_functions::rewr_577_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 577 + 2] = rewr_functions::rewr_577_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 578 + 2] = rewr_functions::rewr_578_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 578 + 2] = rewr_functions::rewr_578_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 579 + 3] = rewr_functions::rewr_579_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 579 + 3] = rewr_functions::rewr_579_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 579 + 4] = rewr_functions::rewr_579_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 579 + 4] = rewr_functions::rewr_579_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 584 + 2] = rewr_functions::rewr_584_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 584 + 2] = rewr_functions::rewr_584_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 585 + 2] = rewr_functions::rewr_585_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 585 + 2] = rewr_functions::rewr_585_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 586 + 3] = rewr_functions::rewr_586_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 586 + 3] = rewr_functions::rewr_586_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 586 + 5] = rewr_functions::rewr_586_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 586 + 5] = rewr_functions::rewr_586_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 591 + 2] = rewr_functions::rewr_591_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 591 + 2] = rewr_functions::rewr_591_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 592 + 2] = rewr_functions::rewr_592_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 592 + 2] = rewr_functions::rewr_592_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 593 + 3] = rewr_functions::rewr_593_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 593 + 3] = rewr_functions::rewr_593_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 593 + 5] = rewr_functions::rewr_593_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 593 + 5] = rewr_functions::rewr_593_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 676 + 2] = rewr_functions::rewr_676_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 676 + 2] = rewr_functions::rewr_676_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 677 + 2] = rewr_functions::rewr_677_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 677 + 2] = rewr_functions::rewr_677_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 678 + 3] = rewr_functions::rewr_678_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 678 + 3] = rewr_functions::rewr_678_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 678 + 5] = rewr_functions::rewr_678_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 678 + 5] = rewr_functions::rewr_678_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 683 + 2] = rewr_functions::rewr_683_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 683 + 2] = rewr_functions::rewr_683_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 692 + 2] = rewr_functions::rewr_692_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 692 + 2] = rewr_functions::rewr_692_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 693 + 3] = rewr_functions::rewr_693_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 693 + 3] = rewr_functions::rewr_693_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 697 + 3] = rewr_functions::rewr_697_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 697 + 3] = rewr_functions::rewr_697_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 699 + 2] = rewr_functions::rewr_699_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 699 + 2] = rewr_functions::rewr_699_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 704 + 2] = rewr_functions::rewr_704_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 704 + 2] = rewr_functions::rewr_704_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 705 + 2] = rewr_functions::rewr_705_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 705 + 2] = rewr_functions::rewr_705_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 706 + 3] = rewr_functions::rewr_706_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 706 + 3] = rewr_functions::rewr_706_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 710 + 2] = rewr_functions::rewr_710_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 710 + 2] = rewr_functions::rewr_710_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 711 + 3] = rewr_functions::rewr_711_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 711 + 3] = rewr_functions::rewr_711_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 716 + 3] = rewr_functions::rewr_716_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 716 + 3] = rewr_functions::rewr_716_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 720 + 3] = rewr_functions::rewr_720_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 720 + 3] = rewr_functions::rewr_720_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 724 + 2] = rewr_functions::rewr_724_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 724 + 2] = rewr_functions::rewr_724_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 725 + 3] = rewr_functions::rewr_725_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 725 + 3] = rewr_functions::rewr_725_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 730 + 2] = rewr_functions::rewr_730_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 730 + 2] = rewr_functions::rewr_730_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 731 + 3] = rewr_functions::rewr_731_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 731 + 3] = rewr_functions::rewr_731_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 745 + 1] = rewr_functions::rewr_745_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 745 + 1] = rewr_functions::rewr_745_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 746 + 2] = rewr_functions::rewr_746_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 746 + 2] = rewr_functions::rewr_746_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 747 + 2] = rewr_functions::rewr_747_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 747 + 2] = rewr_functions::rewr_747_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 760 + 1] = rewr_functions::rewr_760_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 760 + 1] = rewr_functions::rewr_760_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 761 + 2] = rewr_functions::rewr_761_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 761 + 2] = rewr_functions::rewr_761_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 775 + 1] = rewr_functions::rewr_775_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 775 + 1] = rewr_functions::rewr_775_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 776 + 2] = rewr_functions::rewr_776_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 776 + 2] = rewr_functions::rewr_776_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 795 + 1] = rewr_functions::rewr_795_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 795 + 1] = rewr_functions::rewr_795_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 796 + 2] = rewr_functions::rewr_796_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 796 + 2] = rewr_functions::rewr_796_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 812 + 2] = rewr_functions::rewr_812_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 812 + 2] = rewr_functions::rewr_812_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 813 + 1] = rewr_functions::rewr_813_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 813 + 1] = rewr_functions::rewr_813_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 813 + 2] = rewr_functions::rewr_813_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 813 + 2] = rewr_functions::rewr_813_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 815 + 1] = rewr_functions::rewr_815_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 815 + 1] = rewr_functions::rewr_815_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 816 + 2] = rewr_functions::rewr_816_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 816 + 2] = rewr_functions::rewr_816_2_term_arg_in_normal_form;
}

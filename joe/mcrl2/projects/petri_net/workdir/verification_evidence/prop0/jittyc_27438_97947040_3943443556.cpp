#define INDEX_BOUND__ 844// These values are not used anymore.
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
      if (uint_address(arg0) == 0x55b7a8ac06b0) // F1
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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac1970) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac1580))), arg0, arg1);
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
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf4ea0);
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
      if (uint_address(arg1) == 0x55b7a8ac06b0) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x55b7a8bc6020); // R1 []
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
      if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac1970) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac18e0))), arg0, arg1);
  }

  static inline data_expression rewr_59_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_59_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_59_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_59_2(t[0], t[1], this_rewriter); }


  // [59] remove_token: Nat # List(Nat) -> List(Nat)
  static inline const data_expression& rewr_59_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf4bf0);
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac1850))), local_rewrite(arg_not_nf0,this_rewriter), arg1), local_rewrite(arg_not_nf2,this_rewriter));
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac1850))), local_rewrite(arg_not_nf0,this_rewriter), arg1);
  }

  static inline data_expression rewr_58_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_58_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_58_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_58_2(t[0], t[1], this_rewriter); }


  // [58] fire_trans_fn: (Place -> List(Nat)) # Trans -> Place -> List(Nat)
  static inline const data_expression& rewr_58_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf4d30);
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
      if (uint_address(arg1) == 0x55b7a8ac14f0) // F1
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
      if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac1610) // F1
      {
        if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x55b7a8ac0a40) // F2b place_tokens
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac16a0))), arg0, arg1), local_rewrite(arg_not_nf2,this_rewriter));
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
      if (uint_address(arg1) == 0x55b7a8ac14f0) // F1
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
      if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac1610) // F1
      {
        if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x55b7a8ac0a40) // F2b place_tokens
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac16a0))), arg0, arg1);
  }

  static inline data_expression rewr_55_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_55_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_55_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_55_2(t[0], t[1], this_rewriter); }


  // [55] add_tokens: (Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)
  static inline const data_expression& rewr_55_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf3ab0);
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
      if (uint_address(arg1) == 0x55b7a8ac14f0) // F1
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
      if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac1610) // F1
      {
        if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x55b7a8ac0a40) // F2b place_tokens
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac1520))), arg0, arg1), local_rewrite(arg_not_nf2,this_rewriter));
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
      if (uint_address(arg1) == 0x55b7a8ac14f0) // F1
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
      if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac1610) // F1
      {
        if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x55b7a8ac0a40) // F2b place_tokens
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac1520))), arg0, arg1);
  }

  static inline data_expression rewr_52_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_52_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_52_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_52_2(t[0], t[1], this_rewriter); }


  // [52] remove_tokens: (Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)
  static inline const data_expression& rewr_52_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c1ff90);
  }

  static inline data_expression rewr_52_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_52_0(this_rewriter); }

  static inline data_expression rewr_52_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_52_0(this_rewriter); }


  // [830] @equal_arguments: MarkingTrans # MarkingTrans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_830_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8b66730) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
        }
        else
        {
          if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8b66730) // F1
          {
            const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
            const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
            return rewr_45_2(rewr_316_2(var_1, var_3,  this_rewriter), delayed_rewr_87_2<data_expression, data_expression>(var_2, var_4,  this_rewriter),  this_rewriter); // R1 @var_1 == @var_3 && @var_2 == @var_4
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
          return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b667f0))), arg0, arg1);
  }

  static inline data_expression rewr_830_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_830_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_830_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_830_2(t[0], t[1], this_rewriter); }


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
  
  // [830] @equal_arguments: MarkingTrans # MarkingTrans -> Bool
  static inline const data_expression& rewr_830_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c1f570);
  }

  static inline data_expression rewr_830_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_830_0(this_rewriter); }

  static inline data_expression rewr_830_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_830_0(this_rewriter); }


  // [829] @to_pos: MarkingTrans -> Pos
  template < class DATA_EXPR0>
  static inline data_expression rewr_829_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(marking_trans, @@N(@@R(1)), @@X)
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8b66730) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x55b7a8c1ffc0); // R1 1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b667c0))), arg0);
  }

  static inline data_expression rewr_829_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_829_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_829_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_829_1(t[0], this_rewriter); }


  // [829] @to_pos: MarkingTrans -> Pos
  static inline const data_expression& rewr_829_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d00);
  }

  static inline data_expression rewr_829_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_829_0(this_rewriter); }

  static inline data_expression rewr_829_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_829_0(this_rewriter); }


  // [827] marking': MarkingTrans -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_827_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(marking_trans, @@S(@var_0, @@N(@@D(@@N(@@S(@var_2, @@R(@var_0(@var_2))))))), @@X)
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8b66730) // F1
      {
        const data_expression& var_0 = down_cast<data_expression>(arg0[1]); // S2
        const DATA_EXPR1& var_2 = arg_not_nf1; // S1b
        return rewrite_with_arguments_in_normal_form(application(var_0, local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_0(@var_2)
      }
      else
      {
      }
    }
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b66760))), arg0), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_827_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_827_2(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_827_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_827_2(down_cast<application>(t.head())[0], t[0], this_rewriter); }


  // [827] marking': MarkingTrans -> Place -> List(Nat)
  template < class DATA_EXPR0>
  static inline data_expression rewr_827_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(marking_trans, @@S(@var_0, @@N(@@R(@var_0))), @@X)
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8b66730) // F1
      {
        const data_expression& var_0 = down_cast<data_expression>(arg0[1]); // S2
        return var_0; // R1 @var_0
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b66760))), arg0);
  }

  static inline data_expression rewr_827_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_827_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_827_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_827_1(t[0], this_rewriter); }


  // [827] marking': MarkingTrans -> Place -> List(Nat)
  static inline const data_expression& rewr_827_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8aab310);
  }

  static inline data_expression rewr_827_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_827_0(this_rewriter); }

  static inline data_expression rewr_827_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_827_0(this_rewriter); }


  // [810] @equal_arguments: PlaceTokens # PlaceTokens -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_810_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac0a40) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
        }
        else
        {
          if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac0a40) // F1
          {
            const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
            const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
            return rewr_45_2(rewr_91_2(var_1, var_3,  this_rewriter), delayed_rewr_90_2<data_expression, data_expression>(var_2, var_4,  this_rewriter),  this_rewriter); // R1 @var_1 == @var_3 && @var_2 == @var_4
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
          return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b657d0))), arg0, arg1);
  }

  static inline data_expression rewr_810_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_810_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_810_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_810_2(t[0], t[1], this_rewriter); }


  // [90] ==: List(Nat) # List(Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_90_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_90_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_90_2(m_t0, m_t1, this_rewriter);
      }
  };
  
  // [810] @equal_arguments: PlaceTokens # PlaceTokens -> Bool
  static inline const data_expression& rewr_810_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf4c50);
  }

  static inline data_expression rewr_810_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_810_0(this_rewriter); }

  static inline data_expression rewr_810_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_810_0(this_rewriter); }


  // [809] @to_pos: PlaceTokens -> Pos
  template < class DATA_EXPR0>
  static inline data_expression rewr_809_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(place_tokens, @@N(@@R(1)), @@X)
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac0a40) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x55b7a8c1ffc0); // R1 1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b657a0))), arg0);
  }

  static inline data_expression rewr_809_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_809_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_809_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_809_1(t[0], this_rewriter); }


  // [809] @to_pos: PlaceTokens -> Pos
  static inline const data_expression& rewr_809_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c1fe90);
  }

  static inline data_expression rewr_809_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_809_0(this_rewriter); }

  static inline data_expression rewr_809_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_809_0(this_rewriter); }


  // [790] @equal_arguments: Trans # Trans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_790_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac0c80) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        const data_expression& var_3 = down_cast<data_expression>(arg0[3]); // S2
        const data_expression& var_4 = down_cast<data_expression>(arg0[4]); // S2
        const data_expression& var_5 = down_cast<data_expression>(arg0[5]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
        }
        else
        {
          if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac0c80) // F1
          {
            const data_expression& var_6 = down_cast<data_expression>(arg1[1]); // S2
            const data_expression& var_7 = down_cast<data_expression>(arg1[2]); // S2
            const data_expression& var_8 = down_cast<data_expression>(arg1[3]); // S2
            const data_expression& var_9 = down_cast<data_expression>(arg1[4]); // S2
            const data_expression& var_10 = down_cast<data_expression>(arg1[5]); // S2
            return rewr_45_2(rewr_87_2(var_1, var_6,  this_rewriter), delayed_rewr_45_2<delayed_rewr_403_2<data_expression, data_expression>, delayed_rewr_45_2<delayed_rewr_35_2<data_expression, data_expression>, delayed_rewr_45_2<delayed_rewr_268_2<data_expression, data_expression>, delayed_rewr_268_2<data_expression, data_expression>>>>(delayed_rewr_403_2<data_expression, data_expression>(var_2, var_7,  this_rewriter), delayed_rewr_45_2<delayed_rewr_35_2<data_expression, data_expression>, delayed_rewr_45_2<delayed_rewr_268_2<data_expression, data_expression>, delayed_rewr_268_2<data_expression, data_expression>>>(delayed_rewr_35_2<data_expression, data_expression>(var_3, var_8,  this_rewriter), delayed_rewr_45_2<delayed_rewr_268_2<data_expression, data_expression>, delayed_rewr_268_2<data_expression, data_expression>>(delayed_rewr_268_2<data_expression, data_expression>(var_4, var_9,  this_rewriter), delayed_rewr_268_2<data_expression, data_expression>(var_5, var_10,  this_rewriter),  this_rewriter),  this_rewriter),  this_rewriter),  this_rewriter); // R1 @var_1 == @var_6 && @var_2 == @var_7 && @var_3 == @var_8 && @var_4 == @var_9 && @var_5 == @var_10
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
          return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b64a20))), arg0, arg1);
  }

  static inline data_expression rewr_790_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_790_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_790_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_790_2(t[0], t[1], this_rewriter); }


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
  
  // [268] ==: List(PlaceTokens) # List(PlaceTokens) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_268_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_268_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_268_2(m_t0, m_t1, this_rewriter);
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
  
  // [403] ==: Bool # Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_403_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_403_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_403_2(m_t0, m_t1, this_rewriter);
      }
  };
  
  // [790] @equal_arguments: Trans # Trans -> Bool
  static inline const data_expression& rewr_790_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b0cad0);
  }

  static inline data_expression rewr_790_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_790_0(this_rewriter); }

  static inline data_expression rewr_790_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_790_0(this_rewriter); }


  // [789] @to_pos: Trans -> Pos
  template < class DATA_EXPR0>
  static inline data_expression rewr_789_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(trans, @@N(@@N(@@N(@@N(@@R(1))))), @@X)
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac0c80) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x55b7a8c1ffc0); // R1 1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b649f0))), arg0);
  }

  static inline data_expression rewr_789_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_789_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_789_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_789_1(t[0], this_rewriter); }


  // [789] @to_pos: Trans -> Pos
  static inline const data_expression& rewr_789_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c1f4b0);
  }

  static inline data_expression rewr_789_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_789_0(this_rewriter); }

  static inline data_expression rewr_789_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_789_0(this_rewriter); }


  // [57] to: Trans -> List(PlaceTokens)
  template < class DATA_EXPR0>
  static inline data_expression rewr_57_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(trans, @@N(@@N(@@N(@@N(@@S(@var_4, @@R(@var_4)))))), @@X)
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac0c80) // F1
      {
        const data_expression& var_4 = down_cast<data_expression>(arg0[5]); // S2
        return var_4; // R1 @var_4
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac17c0))), arg0);
  }

  static inline data_expression rewr_57_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_57_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_57_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_57_1(t[0], this_rewriter); }


  // [57] to: Trans -> List(PlaceTokens)
  static inline const data_expression& rewr_57_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8aad400);
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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac0c80) // F1
      {
        const data_expression& var_3 = down_cast<data_expression>(arg0[4]); // S2
        return var_3; // R1 @var_3
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac10a0))), arg0);
  }

  static inline data_expression rewr_42_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_42_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_42_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_42_1(t[0], this_rewriter); }


  // [42] from: Trans -> List(PlaceTokens)
  static inline const data_expression& rewr_42_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf4f30);
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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac0c80) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[2]); // S2
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac0fe0))), arg0);
  }

  static inline data_expression rewr_40_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_40_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_40_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_40_1(t[0], this_rewriter); }


  // [40] guard: Trans -> Bool
  static inline const data_expression& rewr_40_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf2ca0);
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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac0c80) // F1
      {
        const data_expression& var_0 = down_cast<data_expression>(arg0[1]); // S2
        return var_0; // R1 @var_0
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac2db0))), arg0);
  }

  static inline data_expression rewr_86_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_86_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_86_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_86_1(t[0], this_rewriter); }


  // [86] trans_name: Trans -> Trans_name
  static inline const data_expression& rewr_86_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf22f0);
  }

  static inline data_expression rewr_86_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_86_0(this_rewriter); }

  static inline data_expression rewr_86_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_86_0(this_rewriter); }


  // [775] @equal_arguments: Trans_name # Trans_name -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_775_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

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
      if (uint_address(arg0) == 0x55b7a8ac0c50) // F1
      {
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
        }
        else
        {
          if (uint_address(arg1) == 0x55b7a8ac0c50) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
          }
          else
          {
          }
        }
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac0f50) // F1
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
          }
          else
          {
            if (uint_address(arg1) == 0x55b7a8ac0f50) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
            }
            else
            {
            }
          }
        }
        else
        {
          if (uint_address(arg0) == 0x55b7a8ac0d40) // F1
          {
            if (var_0 == arg1) // M
            {
              return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
            }
            else
            {
              if (uint_address(arg1) == 0x55b7a8ac0d40) // F1
              {
                return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
              }
              else
              {
              }
            }
          }
          else
          {
            if (uint_address(arg0) == 0x55b7a8ac0ec0) // F1
            {
              if (var_0 == arg1) // M
              {
                return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
              }
              else
              {
                if (uint_address(arg1) == 0x55b7a8ac0ec0) // F1
                {
                  return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
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
                return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
              }
              else
              {
              }
            }
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b63730))), arg0, arg1);
  }

  static inline data_expression rewr_775_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_775_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_775_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_775_2(t[0], t[1], this_rewriter); }


  // [775] @equal_arguments: Trans_name # Trans_name -> Bool
  static inline const data_expression& rewr_775_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf4ce0);
  }

  static inline data_expression rewr_775_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_775_0(this_rewriter); }

  static inline data_expression rewr_775_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_775_0(this_rewriter); }


  // [774] @to_pos: Trans_name -> Pos
  template < class DATA_EXPR0>
  static inline data_expression rewr_774_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(t3, @@R(4), @@F(t0, @@R(1), @@F(t2, @@R(3), @@F(t1, @@R(2), @@X))))
    {
      if (uint_address(arg0) == 0x55b7a8ac0c50) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x55b7a8c1f1d0); // R1 4
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac0f50) // F1
        {
          return *reinterpret_cast<const data_expression*>(0x55b7a8c1ffc0); // R1 1
        }
        else
        {
          if (uint_address(arg0) == 0x55b7a8ac0d40) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8b0ca40); // R1 3
          }
          else
          {
            if (uint_address(arg0) == 0x55b7a8ac0ec0) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55b7a8bba3a0); // R1 2
            }
            else
            {
            }
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b63700))), arg0);
  }

  static inline data_expression rewr_774_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_774_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_774_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_774_1(t[0], this_rewriter); }


  // [774] @to_pos: Trans_name -> Pos
  static inline const data_expression& rewr_774_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b0ca10);
  }

  static inline data_expression rewr_774_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_774_0(this_rewriter); }

  static inline data_expression rewr_774_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_774_0(this_rewriter); }


  // [761] @less_arguments: Place # Place -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_761_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@F(p5, @@D(@@N(@@F(p5, @@R(false), @@X))), @@F(p0, @@D(@@N(@@F(p0, @@R(false), @@X))), @@F(p4, @@D(@@N(@@F(p4, @@R(false), @@X))), @@F(p1, @@D(@@N(@@F(p1, @@R(false), @@X))), @@F(p3, @@D(@@N(@@F(p3, @@R(false), @@X))), @@F(p2, @@D(@@N(@@F(p2, @@R(false), @@X))), @@X))))))
    {
      if (uint_address(arg0) == 0x55b7a8ac0a10) // F1
      {
        if (uint_address(arg1) == 0x55b7a8ac0a10) // F1
        {
          return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
        }
        else
        {
        }
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac0680) // F1
        {
          if (uint_address(arg1) == 0x55b7a8ac0680) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
          }
          else
          {
          }
        }
        else
        {
          if (uint_address(arg0) == 0x55b7a8ac0b00) // F1
          {
            if (uint_address(arg1) == 0x55b7a8ac0b00) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
            }
            else
            {
            }
          }
          else
          {
            if (uint_address(arg0) == 0x55b7a8ac0da0) // F1
            {
              if (uint_address(arg1) == 0x55b7a8ac0da0) // F1
              {
                return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
              }
              else
              {
              }
            }
            else
            {
              if (uint_address(arg0) == 0x55b7a8ac0b90) // F1
              {
                if (uint_address(arg1) == 0x55b7a8ac0b90) // F1
                {
                  return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
                }
                else
                {
                }
              }
              else
              {
                if (uint_address(arg0) == 0x55b7a8ac0ce0) // F1
                {
                  if (uint_address(arg1) == 0x55b7a8ac0ce0) // F1
                  {
                    return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b628f0))), arg0, arg1);
  }

  static inline data_expression rewr_761_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_761_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_761_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_761_2(t[0], t[1], this_rewriter); }


  // [761] @less_arguments: Place # Place -> Bool
  static inline const data_expression& rewr_761_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c1f700);
  }

  static inline data_expression rewr_761_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_761_0(this_rewriter); }

  static inline data_expression rewr_761_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_761_0(this_rewriter); }


  // [760] @equal_arguments: Place # Place -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_760_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

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
      if (uint_address(arg0) == 0x55b7a8ac0a10) // F1
      {
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
        }
        else
        {
          if (uint_address(arg1) == 0x55b7a8ac0a10) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
          }
          else
          {
          }
        }
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac0680) // F1
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
          }
          else
          {
            if (uint_address(arg1) == 0x55b7a8ac0680) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
            }
            else
            {
            }
          }
        }
        else
        {
          if (uint_address(arg0) == 0x55b7a8ac0b00) // F1
          {
            if (var_0 == arg1) // M
            {
              return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
            }
            else
            {
              if (uint_address(arg1) == 0x55b7a8ac0b00) // F1
              {
                return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
              }
              else
              {
              }
            }
          }
          else
          {
            if (uint_address(arg0) == 0x55b7a8ac0da0) // F1
            {
              if (var_0 == arg1) // M
              {
                return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
              }
              else
              {
                if (uint_address(arg1) == 0x55b7a8ac0da0) // F1
                {
                  return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
                }
                else
                {
                }
              }
            }
            else
            {
              if (uint_address(arg0) == 0x55b7a8ac0b90) // F1
              {
                if (var_0 == arg1) // M
                {
                  return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
                }
                else
                {
                  if (uint_address(arg1) == 0x55b7a8ac0b90) // F1
                  {
                    return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
                  }
                  else
                  {
                  }
                }
              }
              else
              {
                if (uint_address(arg0) == 0x55b7a8ac0ce0) // F1
                {
                  if (var_0 == arg1) // M
                  {
                    return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
                  }
                  else
                  {
                    if (uint_address(arg1) == 0x55b7a8ac0ce0) // F1
                    {
                      return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
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
                    return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b628c0))), arg0, arg1);
  }

  static inline data_expression rewr_760_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_760_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_760_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_760_2(t[0], t[1], this_rewriter); }


  // [760] @equal_arguments: Place # Place -> Bool
  static inline const data_expression& rewr_760_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8aad310);
  }

  static inline data_expression rewr_760_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_760_0(this_rewriter); }

  static inline data_expression rewr_760_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_760_0(this_rewriter); }


  // [759] @to_pos: Place -> Pos
  template < class DATA_EXPR0>
  static inline data_expression rewr_759_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(p5, @@R(6), @@F(p0, @@R(1), @@F(p4, @@R(5), @@F(p1, @@R(2), @@F(p3, @@R(4), @@F(p2, @@R(3), @@X))))))
    {
      if (uint_address(arg0) == 0x55b7a8ac0a10) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x55b7a8aab2e0); // R1 6
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac0680) // F1
        {
          return *reinterpret_cast<const data_expression*>(0x55b7a8c1ffc0); // R1 1
        }
        else
        {
          if (uint_address(arg0) == 0x55b7a8ac0b00) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8c23ce0); // R1 5
          }
          else
          {
            if (uint_address(arg0) == 0x55b7a8ac0da0) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55b7a8bba3a0); // R1 2
            }
            else
            {
              if (uint_address(arg0) == 0x55b7a8ac0b90) // F1
              {
                return *reinterpret_cast<const data_expression*>(0x55b7a8c1f1d0); // R1 4
              }
              else
              {
                if (uint_address(arg0) == 0x55b7a8ac0ce0) // F1
                {
                  return *reinterpret_cast<const data_expression*>(0x55b7a8b0ca40); // R1 3
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b62890))), arg0);
  }

  static inline data_expression rewr_759_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_759_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_759_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_759_1(t[0], this_rewriter); }


  // [759] @to_pos: Place -> Pos
  static inline const data_expression& rewr_759_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b0ca70);
  }

  static inline data_expression rewr_759_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_759_0(this_rewriter); }

  static inline data_expression rewr_759_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_759_0(this_rewriter); }


  // [745] if: Bool # @NatPair # @NatPair -> @NatPair
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_745_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b61c30))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_745_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_745_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_745_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_745_3(t[0], t[1], t[2], this_rewriter); }


  // [745] if: Bool # @NatPair # @NatPair -> @NatPair
  static inline const data_expression& rewr_745_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c1fef0);
  }

  static inline data_expression rewr_745_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_745_0(this_rewriter); }

  static inline data_expression rewr_745_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_745_0(this_rewriter); }


  // [744] !=: @NatPair # @NatPair -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_744_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_714_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b61c00))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_744_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_744_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_744_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_744_2(t[0], t[1], this_rewriter); }


  // [744] !=: @NatPair # @NatPair -> Bool
  static inline const data_expression& rewr_744_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c22110);
  }

  static inline data_expression rewr_744_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_744_0(this_rewriter); }

  static inline data_expression rewr_744_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_744_0(this_rewriter); }


  // [714] ==: @NatPair # @NatPair -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_714_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac4550) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
        }
        else
        {
          if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac4550) // F1
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
          return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b5fe90))), arg0, arg1);
  }

  static inline data_expression rewr_714_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_714_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_714_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_714_2(t[0], t[1], this_rewriter); }


  // [714] ==: @NatPair # @NatPair -> Bool
  static inline const data_expression& rewr_714_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c1f2f0);
  }

  static inline data_expression rewr_714_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_714_0(this_rewriter); }

  static inline data_expression rewr_714_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_714_0(this_rewriter); }


  // [739] if: Bool # MarkingTrans # MarkingTrans -> MarkingTrans
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_739_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b61900))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_739_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_739_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_739_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_739_3(t[0], t[1], t[2], this_rewriter); }


  // [739] if: Bool # MarkingTrans # MarkingTrans -> MarkingTrans
  static inline const data_expression& rewr_739_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c1faf0);
  }

  static inline data_expression rewr_739_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_739_0(this_rewriter); }

  static inline data_expression rewr_739_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_739_0(this_rewriter); }


  // [738] !=: MarkingTrans # MarkingTrans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_738_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_698_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b618d0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_738_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_738_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_738_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_738_2(t[0], t[1], this_rewriter); }


  // [738] !=: MarkingTrans # MarkingTrans -> Bool
  static inline const data_expression& rewr_738_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8aab240);
  }

  static inline data_expression rewr_738_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_738_0(this_rewriter); }

  static inline data_expression rewr_738_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_738_0(this_rewriter); }


  // [698] ==: MarkingTrans # MarkingTrans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_698_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

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
      if (rewr_333_2(delayed_rewr_829_1<data_expression>(var_0,  this_rewriter), delayed_rewr_829_1<data_expression>(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
      {
        return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
      }
      else
      {
        if (rewr_83_2(rewr_829_1(var_0,  this_rewriter), rewr_829_1(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
        {
          return rewr_830_2(var_0, var_1,  this_rewriter); // R1 @equal_arguments(@var_0, @var_1)
        }
        else
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b34f20))), arg0, arg1);
  }

  static inline data_expression rewr_698_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_698_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_698_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_698_2(t[0], t[1], this_rewriter); }


  // [829] @to_pos: MarkingTrans -> Pos
  template < class DATA_EXPR0>
  class delayed_rewr_829_1
  {
    protected:
      const DATA_EXPR0& m_t0;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_829_1(const DATA_EXPR0& t0, RewriterCompilingJitty* tr)
        : m_t0(t0), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_829_1(m_t0, this_rewriter);
      }
  };
  
  // [698] ==: MarkingTrans # MarkingTrans -> Bool
  static inline const data_expression& rewr_698_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8aab210);
  }

  static inline data_expression rewr_698_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_698_0(this_rewriter); }

  static inline data_expression rewr_698_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_698_0(this_rewriter); }


  // [734] if: Bool # Trans # Trans -> Trans
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_734_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b616c0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_734_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_734_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_734_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_734_3(t[0], t[1], t[2], this_rewriter); }


  // [734] if: Bool # Trans # Trans -> Trans
  static inline const data_expression& rewr_734_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf35f0);
  }

  static inline data_expression rewr_734_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_734_0(this_rewriter); }

  static inline data_expression rewr_734_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_734_0(this_rewriter); }


  // [426] !=: Trans # Trans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_426_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_81_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2ab10))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_426_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_426_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_426_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_426_2(t[0], t[1], this_rewriter); }


  // [426] !=: Trans # Trans -> Bool
  static inline const data_expression& rewr_426_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c21e70);
  }

  static inline data_expression rewr_426_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_426_0(this_rewriter); }

  static inline data_expression rewr_426_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_426_0(this_rewriter); }


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
      if (rewr_333_2(delayed_rewr_789_1<data_expression>(var_0,  this_rewriter), delayed_rewr_789_1<data_expression>(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
      {
        return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
      }
      else
      {
        if (rewr_83_2(rewr_789_1(var_0,  this_rewriter), rewr_789_1(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
        {
          return rewr_790_2(var_0, var_1,  this_rewriter); // R1 @equal_arguments(@var_0, @var_1)
        }
        else
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac2600))), arg0, arg1);
  }

  static inline data_expression rewr_81_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_81_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_81_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_81_2(t[0], t[1], this_rewriter); }


  // [789] @to_pos: Trans -> Pos
  template < class DATA_EXPR0>
  class delayed_rewr_789_1
  {
    protected:
      const DATA_EXPR0& m_t0;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_789_1(const DATA_EXPR0& t0, RewriterCompilingJitty* tr)
        : m_t0(t0), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_789_1(m_t0, this_rewriter);
      }
  };
  
  // [81] ==: Trans # Trans -> Bool
  static inline const data_expression& rewr_81_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c1f200);
  }

  static inline data_expression rewr_81_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_81_0(this_rewriter); }

  static inline data_expression rewr_81_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_81_0(this_rewriter); }


  // [730] if: Bool # PlaceTokens # PlaceTokens -> PlaceTokens
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_730_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b614b0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_730_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_730_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_730_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_730_3(t[0], t[1], t[2], this_rewriter); }


  // [730] if: Bool # PlaceTokens # PlaceTokens -> PlaceTokens
  static inline const data_expression& rewr_730_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c24630);
  }

  static inline data_expression rewr_730_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_730_0(this_rewriter); }

  static inline data_expression rewr_730_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_730_0(this_rewriter); }


  // [363] !=: PlaceTokens # PlaceTokens -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_363_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_269_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8acacd0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_363_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_363_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_363_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_363_2(t[0], t[1], this_rewriter); }


  // [363] !=: PlaceTokens # PlaceTokens -> Bool
  static inline const data_expression& rewr_363_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c1fb20);
  }

  static inline data_expression rewr_363_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_363_0(this_rewriter); }

  static inline data_expression rewr_363_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_363_0(this_rewriter); }


  // [269] ==: PlaceTokens # PlaceTokens -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_269_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

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
      if (rewr_333_2(delayed_rewr_809_1<data_expression>(var_0,  this_rewriter), delayed_rewr_809_1<data_expression>(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
      {
        return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
      }
      else
      {
        if (rewr_83_2(rewr_809_1(var_0,  this_rewriter), rewr_809_1(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
        {
          return rewr_810_2(var_0, var_1,  this_rewriter); // R1 @equal_arguments(@var_0, @var_1)
        }
        else
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac6320))), arg0, arg1);
  }

  static inline data_expression rewr_269_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_269_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_269_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_269_2(t[0], t[1], this_rewriter); }


  // [809] @to_pos: PlaceTokens -> Pos
  template < class DATA_EXPR0>
  class delayed_rewr_809_1
  {
    protected:
      const DATA_EXPR0& m_t0;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_809_1(const DATA_EXPR0& t0, RewriterCompilingJitty* tr)
        : m_t0(t0), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_809_1(m_t0, this_rewriter);
      }
  };
  
  // [269] ==: PlaceTokens # PlaceTokens -> Bool
  static inline const data_expression& rewr_269_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c24690);
  }

  static inline data_expression rewr_269_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_269_0(this_rewriter); }

  static inline data_expression rewr_269_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_269_0(this_rewriter); }


  // [725] if: Bool # Trans_name # Trans_name -> Trans_name
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_725_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b611b0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_725_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_725_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_725_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_725_3(t[0], t[1], t[2], this_rewriter); }


  // [725] if: Bool # Trans_name # Trans_name -> Trans_name
  static inline const data_expression& rewr_725_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c24600);
  }

  static inline data_expression rewr_725_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_725_0(this_rewriter); }

  static inline data_expression rewr_725_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_725_0(this_rewriter); }


  // [724] !=: Trans_name # Trans_name -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_724_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_87_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b61180))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_724_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_724_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_724_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_724_2(t[0], t[1], this_rewriter); }


  // [724] !=: Trans_name # Trans_name -> Bool
  static inline const data_expression& rewr_724_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c245a0);
  }

  static inline data_expression rewr_724_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_724_0(this_rewriter); }

  static inline data_expression rewr_724_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_724_0(this_rewriter); }


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
      if (rewr_333_2(delayed_rewr_774_1<data_expression>(var_0,  this_rewriter), delayed_rewr_774_1<data_expression>(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
      {
        return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
      }
      else
      {
        if (rewr_83_2(rewr_774_1(var_0,  this_rewriter), rewr_774_1(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
        {
          return rewr_775_2(var_0, var_1,  this_rewriter); // R1 @equal_arguments(@var_0, @var_1)
        }
        else
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac2de0))), arg0, arg1);
  }

  static inline data_expression rewr_87_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_87_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_87_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_87_2(t[0], t[1], this_rewriter); }


  // [774] @to_pos: Trans_name -> Pos
  template < class DATA_EXPR0>
  class delayed_rewr_774_1
  {
    protected:
      const DATA_EXPR0& m_t0;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_774_1(const DATA_EXPR0& t0, RewriterCompilingJitty* tr)
        : m_t0(t0), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_774_1(m_t0, this_rewriter);
      }
  };
  
  // [87] ==: Trans_name # Trans_name -> Bool
  static inline const data_expression& rewr_87_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c245d0);
  }

  static inline data_expression rewr_87_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_87_0(this_rewriter); }

  static inline data_expression rewr_87_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_87_0(this_rewriter); }


  // [720] if: Bool # Place # Place -> Place
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_720_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b60f70))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_720_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_720_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_720_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_720_3(t[0], t[1], t[2], this_rewriter); }


  // [720] if: Bool # Place # Place -> Place
  static inline const data_expression& rewr_720_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8aad270);
  }

  static inline data_expression rewr_720_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_720_0(this_rewriter); }

  static inline data_expression rewr_720_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_720_0(this_rewriter); }


  // [315] !=: Place # Place -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_315_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_91_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac8f30))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_315_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_315_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_315_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_315_2(t[0], t[1], this_rewriter); }


  // [315] !=: Place # Place -> Bool
  static inline const data_expression& rewr_315_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c244b0);
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
      if (rewr_719_2(delayed_rewr_759_1<data_expression>(var_0,  this_rewriter), delayed_rewr_759_1<data_expression>(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
      {
        return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
      }
      else
      {
        if (rewr_83_2(rewr_759_1(var_0,  this_rewriter), rewr_759_1(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
        {
          return rewr_761_2(var_0, var_1,  this_rewriter); // R1 @less_arguments(@var_0, @var_1)
        }
        else
        {
          if (rewr_106_2(delayed_rewr_759_1<data_expression>(var_0,  this_rewriter), rewr_759_1(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
          }
          else
          {
            if (var_0 == arg1) // M
            {
              return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
            }
            else
            {
            }
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac8ea0))), arg0, arg1);
  }

  static inline data_expression rewr_314_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_314_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_314_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_314_2(t[0], t[1], this_rewriter); }


  // [759] @to_pos: Place -> Pos
  template < class DATA_EXPR0>
  class delayed_rewr_759_1
  {
    protected:
      const DATA_EXPR0& m_t0;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_759_1(const DATA_EXPR0& t0, RewriterCompilingJitty* tr)
        : m_t0(t0), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_759_1(m_t0, this_rewriter);
      }
  };
  
  // [314] <: Place # Place -> Bool
  static inline const data_expression& rewr_314_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8aad3a0);
  }

  static inline data_expression rewr_314_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_314_0(this_rewriter); }

  static inline data_expression rewr_314_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_314_0(this_rewriter); }


  // [91] ==: Place # Place -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_91_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

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
      if (rewr_333_2(delayed_rewr_759_1<data_expression>(var_0,  this_rewriter), delayed_rewr_759_1<data_expression>(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
      {
        return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
      }
      else
      {
        if (rewr_83_2(rewr_759_1(var_0,  this_rewriter), rewr_759_1(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
        {
          return rewr_760_2(var_0, var_1,  this_rewriter); // R1 @equal_arguments(@var_0, @var_1)
        }
        else
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac3020))), arg0, arg1);
  }

  static inline data_expression rewr_91_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_91_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_91_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_91_2(t[0], t[1], this_rewriter); }


  // [91] ==: Place # Place -> Bool
  static inline const data_expression& rewr_91_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c1f6d0);
  }

  static inline data_expression rewr_91_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_91_0(this_rewriter); }

  static inline data_expression rewr_91_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_91_0(this_rewriter); }


  // [719] >: Pos # Pos -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_719_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(@var_1 < @var_0))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_106_2(var_1, local_rewrite(var_0, this_rewriter),  this_rewriter); // R1 @var_1 < @var_0
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b60df0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_719_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_719_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_719_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_719_2(t[0], t[1], this_rewriter); }


  // [719] >: Pos # Pos -> Bool
  static inline const data_expression& rewr_719_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c24a80);
  }

  static inline data_expression rewr_719_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_719_0(this_rewriter); }

  static inline data_expression rewr_719_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_719_0(this_rewriter); }


  // [712] if: Bool # Pos # Pos -> Pos
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_712_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b5eed0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_712_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_712_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_712_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_712_3(t[0], t[1], t[2], this_rewriter); }


  // [712] if: Bool # Pos # Pos -> Pos
  static inline const data_expression& rewr_712_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c248d0);
  }

  static inline data_expression rewr_712_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_712_0(this_rewriter); }

  static inline data_expression rewr_712_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_712_0(this_rewriter); }


  // [707] <=: Pos # Pos -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_707_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(1, @@D(@@N(@@S(@var_0, @@R(true)))), @@X)
    {
      if (uint_address(arg0) == 0x55b7a8ac2150) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac4160) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
        }
        else
        {
          if (uint_address(arg1) == 0x55b7a8ac2150) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac21b0) // F1
            {
              const data_expression& var_2 = down_cast<data_expression>(arg1[1]); // S2
              const data_expression& var_3 = down_cast<data_expression>(arg1[2]); // S2
              return rewr_106_2(var_1, rewr_80_2(var_2, var_3,  this_rewriter),  this_rewriter); // R1 @var_1 < 2 * @var_3 + if(@var_2, 1, 0)
            }
            else
            {
            }
          }
        }
      }
      else
      {
        if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac21b0) // F1
        {
          const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
          const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac4160) // F1
            {
              const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
              return rewr_707_2(rewr_117_1(rewr_80_2(var_1, var_2,  this_rewriter),  this_rewriter), var_3,  this_rewriter); // R1 @pospred(2 * @var_2 + if(@var_1, 1, 0)) <= @var_3
            }
            else
            {
              if (uint_address(arg1) == 0x55b7a8ac2150) // F1
              {
                return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
              }
              else
              {
                if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac21b0) // F1
                {
                  const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
                  const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
                  return rewr_84_3(rewr_44_2(var_1, var_3,  this_rewriter), delayed_rewr_707_2<data_expression, data_expression>(var_2, var_4,  this_rewriter), delayed_rewr_106_2<data_expression, data_expression>(var_2, var_4,  this_rewriter),  this_rewriter); // R1 if(@var_1 => @var_3, @var_2 <= @var_4, @var_2 < @var_4)
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
            return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b5e0f0))), arg0, arg1);
  }

  static inline data_expression rewr_707_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_707_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_707_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_707_2(t[0], t[1], this_rewriter); }


  // [106] <: Pos # Pos -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_106_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_106_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_106_2(m_t0, m_t1, this_rewriter);
      }
  };
  
  // [707] <=: Pos # Pos -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_707_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_707_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_707_2(m_t0, m_t1, this_rewriter);
      }
  };
  
  // [707] <=: Pos # Pos -> Bool
  static inline const data_expression& rewr_707_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b0cbf0);
  }

  static inline data_expression rewr_707_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_707_0(this_rewriter); }

  static inline data_expression rewr_707_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_707_0(this_rewriter); }


  // [333] !=: Pos # Pos -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_333_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_83_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac9ad0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_333_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_333_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_333_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_333_2(t[0], t[1], this_rewriter); }


  // [333] !=: Pos # Pos -> Bool
  static inline const data_expression& rewr_333_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c24660);
  }

  static inline data_expression rewr_333_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_333_0(this_rewriter); }

  static inline data_expression rewr_333_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_333_0(this_rewriter); }


  // [117] @pospred: Pos -> Pos
  template < class DATA_EXPR0>
  static inline data_expression rewr_117_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(@cDub, @@F(true, @@D(@@N(@@S(@var_0, @@R(2 * @var_0)))), @@F(false, @@D(@@N(@@F(@cDub, @@S(@var_0, @@N(@@S(@var_1, @@R(2 * @pospred(2 * @var_1 + if(@var_0, 1, 0)) + 1)))), @@F(1, @@R(1), @@D(@@X))))), @@D(@@X))), @@F(1, @@R(1), @@X))
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac21b0) // F1
      {
        if (uint_address(arg0[1]) == 0x55b7a8ac07a0) // F2a true
        {
          const data_expression& t1 = down_cast<data_expression>(arg0[1]);
          const data_expression& var_0 = down_cast<data_expression>(arg0[2]); // S2
          return rewr_80_2(*reinterpret_cast<const data_expression*>(0x55b7a8aab2b0), var_0,  this_rewriter); // R1 2 * @var_0
        }
        else
        {
          if (uint_address(arg0[1]) == 0x55b7a8ac2180) // F2a false
          {
            const data_expression& t1 = down_cast<data_expression>(arg0[1]);
            if (is_application_no_check(down_cast<data_expression>(arg0[2])) && uint_address(down_cast<data_expression>(arg0[2])[0]) == 0x55b7a8ac21b0) // F2b @cDub
            {
              const data_expression& t2 = down_cast<data_expression>(arg0[2]);
              const data_expression& var_0 = down_cast<data_expression>(t2[1]); // S2
              const data_expression& var_1 = down_cast<data_expression>(t2[2]); // S2
              return rewr_80_2(*reinterpret_cast<const data_expression*>(0x55b7a8bf2d60), rewr_117_1(rewr_80_2(var_0, var_1,  this_rewriter),  this_rewriter),  this_rewriter); // R1 2 * @pospred(2 * @var_1 + if(@var_0, 1, 0)) + 1
            }
            else
            {
              if (uint_address(arg0[2]) == 0x55b7a8ac2150) // F2a @c1
              {
                const data_expression& t2 = down_cast<data_expression>(arg0[2]);
                return *reinterpret_cast<const data_expression*>(0x55b7a8c1ffc0); // R1 1
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
        if (uint_address(arg0) == 0x55b7a8ac2150) // F1
        {
          return *reinterpret_cast<const data_expression*>(0x55b7a8c1ffc0); // R1 1
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac4460))), arg0);
  }

  static inline data_expression rewr_117_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_117_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_117_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_117_1(t[0], this_rewriter); }


  // [117] @pospred: Pos -> Pos
  static inline const data_expression& rewr_117_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c1f6a0);
  }

  static inline data_expression rewr_117_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_117_0(this_rewriter); }

  static inline data_expression rewr_117_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_117_0(this_rewriter); }


  // [106] <: Pos # Pos -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_106_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@N(@@F(1, @@R(false), @@X))
    {
      if (uint_address(arg1) == 0x55b7a8ac2150) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
      }
      else
      {
      }
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@S(@var_0, @@F(1, @@D(@@N(@@M(@var_0, @@R(false), @@F(succ, @@R(true), @@F(@cDub, @@N(@@R(true)), @@X))))), @@F(succ, @@S(@var_1, @@D(@@N(@@M(@var_0, @@R(false), @@M(@var_1, @@R(false), @@F(succ, @@M(@var_0, @@R(true), @@D(@@X)), @@F(@cDub, @@S(@var_2, @@N(@@S(@var_3, @@R(@var_1 < @pospred(2 * @var_3 + if(@var_2, 1, 0)))))), @@X))))))), @@F(@cDub, @@S(@var_1, @@N(@@S(@var_2, @@D(@@N(@@M(@var_0, @@R(false), @@F(succ, @@S(@var_3, @@R(2 * @var_2 + if(@var_1, 1, 0) <= @var_3)), @@F(@cDub, @@S(@var_3, @@N(@@S(@var_4, @@R(if(@var_3 => @var_1, @var_2 < @var_4, @var_2 <= @var_4))))), @@X)))))))), @@N(@@M(@var_0, @@R(false), @@F(succ, @@M(@var_0, @@R(true), @@D(@@X)), @@X)))))))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address(arg0) == 0x55b7a8ac2150) // F1
      {
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
        }
        else
        {
          if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac4160) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac21b0) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
            }
            else
            {
            }
          }
        }
      }
      else
      {
        if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac4160) // F1
        {
          const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
          }
          else
          {
            if (var_1 == arg1) // M
            {
              return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
            }
            else
            {
              if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac4160) // F1
              {
                if (var_0 == arg1[1]) // M
                {
                  return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
                }
                else
                {
                }
              }
              else
              {
                if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac21b0) // F1
                {
                  const data_expression& var_2 = down_cast<data_expression>(arg1[1]); // S2
                  const data_expression& var_3 = down_cast<data_expression>(arg1[2]); // S2
                  return rewr_106_2(var_1, rewr_117_1(rewr_80_2(var_2, var_3,  this_rewriter),  this_rewriter),  this_rewriter); // R1 @var_1 < @pospred(2 * @var_3 + if(@var_2, 1, 0))
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
          if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac21b0) // F1
          {
            const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
            const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
            if (var_0 == arg1) // M
            {
              return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
            }
            else
            {
              if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac4160) // F1
              {
                const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
                return rewr_707_2(rewr_80_2(var_1, var_2,  this_rewriter), var_3,  this_rewriter); // R1 2 * @var_2 + if(@var_1, 1, 0) <= @var_3
              }
              else
              {
                if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac21b0) // F1
                {
                  const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
                  const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
                  return rewr_84_3(rewr_44_2(var_3, var_1,  this_rewriter), delayed_rewr_106_2<data_expression, data_expression>(var_2, var_4,  this_rewriter), delayed_rewr_707_2<data_expression, data_expression>(var_2, var_4,  this_rewriter),  this_rewriter); // R1 if(@var_3 => @var_1, @var_2 < @var_4, @var_2 <= @var_4)
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
              return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
            }
            else
            {
              if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac4160) // F1
              {
                if (var_0 == arg1[1]) // M
                {
                  return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac4190))), arg0, arg1);
  }

  static inline data_expression rewr_106_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_106_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_106_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_106_2(t[0], t[1], this_rewriter); }


  // [106] <: Pos # Pos -> Bool
  static inline const data_expression& rewr_106_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c24900);
  }

  static inline data_expression rewr_106_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_106_0(this_rewriter); }

  static inline data_expression rewr_106_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_106_0(this_rewriter); }


  // [105] succ: Pos -> Pos
  template < class DATA_EXPR0>
  static inline data_expression rewr_105_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(@cDub, @@F(true, @@D(@@N(@@S(@var_0, @@R(2 * succ(@var_0))))), @@F(false, @@D(@@N(@@S(@var_0, @@R(2 * @var_0 + 1)))), @@D(@@X))), @@F(succ, @@S(@var_0, @@R(@var_0)), @@F(1, @@R(2), @@X)))
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac21b0) // F1
      {
        if (uint_address(arg0[1]) == 0x55b7a8ac07a0) // F2a true
        {
          const data_expression& t1 = down_cast<data_expression>(arg0[1]);
          const data_expression& var_0 = down_cast<data_expression>(arg0[2]); // S2
          return rewr_80_2(*reinterpret_cast<const data_expression*>(0x55b7a8aab2b0), rewr_105_1(var_0,  this_rewriter),  this_rewriter); // R1 2 * succ(@var_0)
        }
        else
        {
          if (uint_address(arg0[1]) == 0x55b7a8ac2180) // F2a false
          {
            const data_expression& t1 = down_cast<data_expression>(arg0[1]);
            const data_expression& var_0 = down_cast<data_expression>(arg0[2]); // S2
            return rewr_80_2(*reinterpret_cast<const data_expression*>(0x55b7a8bf2d60), var_0,  this_rewriter); // R1 2 * @var_0 + 1
          }
          else
          {
          }
        }
      }
      else
      {
        if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac4160) // F1
        {
          const data_expression& var_0 = down_cast<data_expression>(arg0[1]); // S2
          return var_0; // R1 @var_0
        }
        else
        {
          if (uint_address(arg0) == 0x55b7a8ac2150) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8bba3a0); // R1 2
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac4160))), arg0);
  }

  static inline data_expression rewr_105_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_105_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_105_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_105_1(t[0], this_rewriter); }


  // [105] succ: Pos -> Pos
  static inline const data_expression& rewr_105_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b0cb70);
  }

  static inline data_expression rewr_105_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_105_0(this_rewriter); }

  static inline data_expression rewr_105_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_105_0(this_rewriter); }


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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac21b0) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        if (uint_address(arg0[1]) == 0x55b7a8ac07a0) // F2a true
        {
          const data_expression& t1 = down_cast<data_expression>(arg0[1]);
          const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
          }
          else
          {
            if (uint_address(arg1) == 0x55b7a8ac2150) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
            }
            else
            {
              if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac21b0) // F1
              {
                if (var_1 == arg1[1]) // M
                {
                  if (uint_address(arg1[1]) == 0x55b7a8ac2180) // F2a false
                  {
                    const data_expression& t3 = down_cast<data_expression>(arg1[1]);
                    return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
                  }
                  else
                  {
                    const data_expression& var_3 = down_cast<data_expression>(arg1[2]); // S2
                    return rewr_83_2(var_2, var_3,  this_rewriter); // R1 @var_2 == @var_3
                  }
                }
                else
                {
                  if (uint_address(arg1[1]) == 0x55b7a8ac2180) // F2a false
                  {
                    const data_expression& t3 = down_cast<data_expression>(arg1[1]);
                    return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
                  }
                  else
                  {
                  }
                }
              }
              else
              {
                if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac4160) // F1
                {
                  const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
                  return rewr_83_2(rewr_117_1(rewr_80_2(var_1, var_2,  this_rewriter),  this_rewriter), var_3,  this_rewriter); // R1 @pospred(2 * @var_2 + if(@var_1, 1, 0)) == @var_3
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
          if (uint_address(arg0[1]) == 0x55b7a8ac2180) // F2a false
          {
            const data_expression& t1 = down_cast<data_expression>(arg0[1]);
            const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
            if (var_0 == arg1) // M
            {
              return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
            }
            else
            {
              if (uint_address(arg1) == 0x55b7a8ac2150) // F1
              {
                return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
              }
              else
              {
                if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac21b0) // F1
                {
                  if (var_1 == arg1[1]) // M
                  {
                    if (uint_address(arg1[1]) == 0x55b7a8ac07a0) // F2a true
                    {
                      const data_expression& t3 = down_cast<data_expression>(arg1[1]);
                      return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
                    }
                    else
                    {
                      const data_expression& var_3 = down_cast<data_expression>(arg1[2]); // S2
                      return rewr_83_2(var_2, var_3,  this_rewriter); // R1 @var_2 == @var_3
                    }
                  }
                  else
                  {
                    if (uint_address(arg1[1]) == 0x55b7a8ac07a0) // F2a true
                    {
                      const data_expression& t3 = down_cast<data_expression>(arg1[1]);
                      return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
                    }
                    else
                    {
                    }
                  }
                }
                else
                {
                  if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac4160) // F1
                  {
                    const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
                    return rewr_83_2(rewr_117_1(rewr_80_2(var_1, var_2,  this_rewriter),  this_rewriter), var_3,  this_rewriter); // R1 @pospred(2 * @var_2 + if(@var_1, 1, 0)) == @var_3
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
              return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
            }
            else
            {
              if (uint_address(arg1) == 0x55b7a8ac2150) // F1
              {
                return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
              }
              else
              {
                if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac4160) // F1
                {
                  const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
                  return rewr_83_2(rewr_117_1(rewr_80_2(var_1, var_2,  this_rewriter),  this_rewriter), var_3,  this_rewriter); // R1 @pospred(2 * @var_2 + if(@var_1, 1, 0)) == @var_3
                }
                else
                {
                  if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac21b0) // F1
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
        if (uint_address(arg0) == 0x55b7a8ac2150) // F1
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac4160) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
            }
            else
            {
              if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac21b0) // F1
              {
                return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
              }
              else
              {
              }
            }
          }
        }
        else
        {
          if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac4160) // F1
          {
            const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
            if (var_0 == arg1) // M
            {
              return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
            }
            else
            {
              if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac21b0) // F1
              {
                const data_expression& var_2 = down_cast<data_expression>(arg1[1]); // S2
                const data_expression& var_3 = down_cast<data_expression>(arg1[2]); // S2
                return rewr_83_2(var_1, rewr_117_1(rewr_80_2(var_2, var_3,  this_rewriter),  this_rewriter),  this_rewriter); // R1 @var_1 == @pospred(2 * @var_3 + if(@var_2, 1, 0))
              }
              else
              {
                if (uint_address(arg1) == 0x55b7a8ac2150) // F1
                {
                  return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
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
              return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
            }
            else
            {
            }
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac29c0))), arg0, arg1);
  }

  static inline data_expression rewr_83_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_83_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_83_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_83_2(t[0], t[1], this_rewriter); }


  // [83] ==: Pos # Pos -> Bool
  static inline const data_expression& rewr_83_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8aad3d0);
  }

  static inline data_expression rewr_83_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_83_0(this_rewriter); }

  static inline data_expression rewr_83_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_83_0(this_rewriter); }


  // [708] if: Bool # Nat # Nat -> Nat
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_708_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b5e2a0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_708_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_708_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_708_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_708_3(t[0], t[1], t[2], this_rewriter); }


  // [708] if: Bool # Nat # Nat -> Nat
  static inline const data_expression& rewr_708_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c24930);
  }

  static inline data_expression rewr_708_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_708_0(this_rewriter); }

  static inline data_expression rewr_708_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_708_0(this_rewriter); }


  // [107] <: Nat # Nat -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_107_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@N(@@F(0, @@R(false), @@X))
    {
      if (uint_address(arg1) == 0x55b7a8ac1f70) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
      }
      else
      {
      }
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@S(@var_0, @@F(@cNat, @@S(@var_1, @@F(succ, @@S(@var_2, @@D(@@D(@@N(@@M(@var_0, @@R(false), @@M(@var_2, @@R(false), @@F(@cNat, @@S(@var_3, @@R(@var_1 < @var_3)), @@X))))))), @@D(@@N(@@M(@var_0, @@R(false), @@F(@cNat, @@S(@var_2, @@R(@var_1 < @var_2)), @@X)))))), @@F(0, @@D(@@N(@@M(@var_0, @@R(false), @@F(@cNat, @@R(true), @@X)))), @@N(@@M(@var_0, @@R(false), @@F(@cNat, @@F(succ, @@M(@var_0, @@R(true), @@D(@@D(@@X))), @@D(@@X)), @@X))))))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac09b0) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        if (is_application_no_check(down_cast<data_expression>(arg0[1])) && uint_address(down_cast<data_expression>(arg0[1])[0]) == 0x55b7a8ac4100) // F2b succ
        {
          const data_expression& t1 = down_cast<data_expression>(arg0[1]);
          const data_expression& var_2 = down_cast<data_expression>(t1[1]); // S2
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
          }
          else
          {
            if (var_2 == arg1) // M
            {
              return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
            }
            else
            {
              if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac09b0) // F1
              {
                const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
                return rewr_106_2(var_1, var_3,  this_rewriter); // R1 @var_1 < @var_3
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
            return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac09b0) // F1
            {
              const data_expression& var_2 = down_cast<data_expression>(arg1[1]); // S2
              return rewr_106_2(var_1, var_2,  this_rewriter); // R1 @var_1 < @var_2
            }
            else
            {
            }
          }
        }
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac1f70) // F1
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac09b0) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
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
            return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac09b0) // F1
            {
              if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x55b7a8ac4100) // F2b succ
              {
                const data_expression& t1 = down_cast<data_expression>(arg1[1]);
                if (var_0 == t1[1]) // M
                {
                  return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
                }
                else
                {
                }
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac4220))), arg0, arg1);
  }

  static inline data_expression rewr_107_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_107_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_107_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_107_2(t[0], t[1], this_rewriter); }


  // [107] <: Nat # Nat -> Bool
  static inline const data_expression& rewr_107_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf2350);
  }

  static inline data_expression rewr_107_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_107_0(this_rewriter); }

  static inline data_expression rewr_107_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_107_0(this_rewriter); }


  // [103] succ: Nat -> Pos
  template < class DATA_EXPR0>
  static inline data_expression rewr_103_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(@cNat, @@S(@var_0, @@R(succ(@var_0))), @@F(0, @@R(1), @@X))
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac09b0) // F1
      {
        const data_expression& var_0 = down_cast<data_expression>(arg0[1]); // S2
        return rewr_105_1(var_0,  this_rewriter); // R1 succ(@var_0)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac1f70) // F1
        {
          return *reinterpret_cast<const data_expression*>(0x55b7a8c1ffc0); // R1 1
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac4100))), arg0);
  }

  static inline data_expression rewr_103_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_103_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_103_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_103_1(t[0], this_rewriter); }


  // [103] succ: Nat -> Pos
  static inline const data_expression& rewr_103_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf28b0);
  }

  static inline data_expression rewr_103_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_103_0(this_rewriter); }

  static inline data_expression rewr_103_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_103_0(this_rewriter); }


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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac1a60))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_61_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_61_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_61_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_61_2(t[0], t[1], this_rewriter); }


  // [61] !=: Nat # Nat -> Bool
  static inline const data_expression& rewr_61_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c24a50);
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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac09b0) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
        }
        else
        {
          if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac09b0) // F1
          {
            const data_expression& var_2 = down_cast<data_expression>(arg1[1]); // S2
            return rewr_83_2(var_1, var_2,  this_rewriter); // R1 @var_1 == @var_2
          }
          else
          {
            if (uint_address(arg1) == 0x55b7a8ac1f70) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
            }
            else
            {
            }
          }
        }
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac1f70) // F1
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac09b0) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
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
            return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac0e60))), arg0, arg1);
  }

  static inline data_expression rewr_35_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_35_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_35_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_35_2(t[0], t[1], this_rewriter); }


  // [35] ==: Nat # Nat -> Bool
  static inline const data_expression& rewr_35_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c23bb0);
  }

  static inline data_expression rewr_35_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_35_0(this_rewriter); }

  static inline data_expression rewr_35_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_35_0(this_rewriter); }


  // [709] if: Bool # Int # Int -> Int
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_709_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b5e3c0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_709_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_709_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_709_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_709_3(t[0], t[1], t[2], this_rewriter); }


  // [709] if: Bool # Int # Int -> Int
  static inline const data_expression& rewr_709_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c21c30);
  }

  static inline data_expression rewr_709_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_709_0(this_rewriter); }

  static inline data_expression rewr_709_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_709_0(this_rewriter); }


  // [705] !=: Int # Int -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_705_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_617_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b5d6d0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_705_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_705_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_705_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_705_2(t[0], t[1], this_rewriter); }


  // [705] !=: Int # Int -> Bool
  static inline const data_expression& rewr_705_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c24140);
  }

  static inline data_expression rewr_705_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_705_0(this_rewriter); }

  static inline data_expression rewr_705_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_705_0(this_rewriter); }


  // [617] ==: Int # Int -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_617_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@F(@cNeg, @@S(@var_1, @@D(@@N(@@M(@var_0, @@R(true), @@F(@cNeg, @@S(@var_2, @@R(@var_1 == @var_2)), @@F(@cInt, @@R(false), @@X)))))), @@F(@cInt, @@S(@var_1, @@D(@@N(@@M(@var_0, @@R(true), @@F(@cInt, @@S(@var_2, @@R(@var_1 == @var_2)), @@F(@cNeg, @@R(false), @@X)))))), @@N(@@M(@var_0, @@R(true), @@X)))))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac3740) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
        }
        else
        {
          if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac3740) // F1
          {
            const data_expression& var_2 = down_cast<data_expression>(arg1[1]); // S2
            return rewr_83_2(var_1, var_2,  this_rewriter); // R1 @var_1 == @var_2
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac36b0) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
            }
            else
            {
            }
          }
        }
      }
      else
      {
        if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac36b0) // F1
        {
          const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac36b0) // F1
            {
              const data_expression& var_2 = down_cast<data_expression>(arg1[1]); // S2
              return rewr_35_2(var_1, var_2,  this_rewriter); // R1 @var_1 == @var_2
            }
            else
            {
              if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac3740) // F1
              {
                return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
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
            return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b32100))), arg0, arg1);
  }

  static inline data_expression rewr_617_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_617_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_617_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_617_2(t[0], t[1], this_rewriter); }


  // [617] ==: Int # Int -> Bool
  static inline const data_expression& rewr_617_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c24540);
  }

  static inline data_expression rewr_617_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_617_0(this_rewriter); }

  static inline data_expression rewr_617_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_617_0(this_rewriter); }


  // [704] if: Bool # Real # Real -> Real
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_704_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b5d2b0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_704_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_704_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_704_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_704_3(t[0], t[1], t[2], this_rewriter); }


  // [704] if: Bool # Real # Real -> Real
  static inline const data_expression& rewr_704_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c241d0);
  }

  static inline data_expression rewr_704_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_704_0(this_rewriter); }

  static inline data_expression rewr_704_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_704_0(this_rewriter); }


  // [661] !=: Real # Real -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_661_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_102_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b33ba0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_661_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_661_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_661_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_661_2(t[0], t[1], this_rewriter); }


  // [661] !=: Real # Real -> Bool
  static inline const data_expression& rewr_661_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c24570);
  }

  static inline data_expression rewr_661_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_661_0(this_rewriter); }

  static inline data_expression rewr_661_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_661_0(this_rewriter); }


  // [102] ==: Real # Real -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_102_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac3ce0))), arg0, arg1);
  }

  static inline data_expression rewr_102_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_102_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_102_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_102_2(t[0], t[1], this_rewriter); }


  // [102] ==: Real # Real -> Bool
  static inline const data_expression& rewr_102_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c1f7b0);
  }

  static inline data_expression rewr_102_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_102_0(this_rewriter); }

  static inline data_expression rewr_102_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_102_0(this_rewriter); }


  // [101] >: Real # Real -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_101_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(@var_1 < @var_0))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_96_2(local_rewrite(var_1, this_rewriter), local_rewrite(var_0, this_rewriter),  this_rewriter); // R1 @var_1 < @var_0
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac3c50))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_101_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_101_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_101_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_101_2(t[0], t[1], this_rewriter); }


  // [101] >: Real # Real -> Bool
  static inline const data_expression& rewr_101_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c21d70);
  }

  static inline data_expression rewr_101_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_101_0(this_rewriter); }

  static inline data_expression rewr_101_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_101_0(this_rewriter); }


  // [96] <: Real # Real -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_96_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@N(@@M(@var_0, @@R(false), @@X)))
    {
      const data_expression& var_0 = arg0; // S1a
      if (var_0 == arg1) // M
      {
        return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac3800))), arg0, arg1);
  }

  static inline data_expression rewr_96_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_96_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_96_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_96_2(t[0], t[1], this_rewriter); }


  // [96] <: Real # Real -> Bool
  static inline const data_expression& rewr_96_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c240e0);
  }

  static inline data_expression rewr_96_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_96_0(this_rewriter); }

  static inline data_expression rewr_96_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_96_0(this_rewriter); }


  // [566] !=: Bool # Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_566_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_403_2(local_rewrite(var_0, this_rewriter), var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b30300))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_566_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_566_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_566_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_566_2(t[0], t[1], this_rewriter); }


  // [566] !=: Bool # Bool -> Bool
  static inline const data_expression& rewr_566_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c241a0);
  }

  static inline data_expression rewr_566_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_566_0(this_rewriter); }

  static inline data_expression rewr_566_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_566_0(this_rewriter); }


  // [403] ==: Bool # Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_403_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@S(@var_0, @@R(!@var_0)))), @@F(true, @@D(@@N(@@S(@var_0, @@R(@var_0)))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
        return rewr_85_1(local_rewrite(var_0, this_rewriter),  this_rewriter); // R1 !@var_0
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
        if (uint_address(arg1) == 0x55b7a8ac07a0) // F1
        {
          return var_0; // R1 @var_0
        }
        else
        {
          if (uint_address(arg1) == 0x55b7a8ac2180) // F1
          {
            return rewr_85_1(var_0,  this_rewriter); // R1 !@var_0
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b29d30))), arg0, arg1);
  }

  static inline data_expression rewr_403_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_403_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_403_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_403_2(t[0], t[1], this_rewriter); }


  // [403] ==: Bool # Bool -> Bool
  static inline const data_expression& rewr_403_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf3660);
  }

  static inline data_expression rewr_403_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_403_0(this_rewriter); }

  static inline data_expression rewr_403_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_403_0(this_rewriter); }


  // [85] !: Bool -> Bool
  template < class DATA_EXPR0>
  static inline data_expression rewr_85_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(!, @@S(@var_0, @@R(@var_0)), @@F(&&, @@S(@var_0, @@N(@@S(@var_1, @@R(!@var_0 || !@var_1)))), @@F(false, @@R(true), @@F(||, @@S(@var_0, @@N(@@S(@var_1, @@R(!@var_0 && !@var_1)))), @@F(true, @@R(false), @@F(==, @@S(@var_0, @@N(@@S(@var_1, @@R(@var_1 > @var_0 || @var_1 < @var_0)))), @@X))))))
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac2d50) // F1
      {
        const data_expression& var_0 = down_cast<data_expression>(arg0[1]); // S2
        return var_0; // R1 @var_0
      }
      else
      {
        if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac11c0) // F1
        {
          const data_expression& var_0 = down_cast<data_expression>(arg0[1]); // S2
          const data_expression& var_1 = down_cast<data_expression>(arg0[2]); // S2
          return rewr_82_2(rewr_85_1(var_0,  this_rewriter), delayed_rewr_85_1<data_expression>(var_1,  this_rewriter),  this_rewriter); // R1 !@var_0 || !@var_1
        }
        else
        {
          if (uint_address(arg0) == 0x55b7a8ac2180) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
          }
          else
          {
            if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac2720) // F1
            {
              const data_expression& var_0 = down_cast<data_expression>(arg0[1]); // S2
              const data_expression& var_1 = down_cast<data_expression>(arg0[2]); // S2
              return rewr_45_2(rewr_85_1(var_0,  this_rewriter), delayed_rewr_85_1<data_expression>(var_1,  this_rewriter),  this_rewriter); // R1 !@var_0 && !@var_1
            }
            else
            {
              if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
              {
                return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
              }
              else
              {
                if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac3ce0) // F1
                {
                  const data_expression& var_0 = down_cast<data_expression>(arg0[1]); // S2
                  const data_expression& var_1 = down_cast<data_expression>(arg0[2]); // S2
                  return rewr_82_2(rewr_101_2(var_1, var_0,  this_rewriter), delayed_rewr_96_2<data_expression, data_expression>(var_1, var_0,  this_rewriter),  this_rewriter); // R1 @var_1 > @var_0 || @var_1 < @var_0
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac2d50))), arg0);
  }

  static inline data_expression rewr_85_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_85_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_85_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_85_1(t[0], this_rewriter); }


  // [96] <: Real # Real -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_96_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_96_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_96_2(m_t0, m_t1, this_rewriter);
      }
  };
  
  // [85] !: Bool -> Bool
  template < class DATA_EXPR0>
  class delayed_rewr_85_1
  {
    protected:
      const DATA_EXPR0& m_t0;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_85_1(const DATA_EXPR0& t0, RewriterCompilingJitty* tr)
        : m_t0(t0), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_85_1(m_t0, this_rewriter);
      }
  };
  
  // [85] !: Bool -> Bool
  static inline const data_expression& rewr_85_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c21c90);
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
    // @@S(@var_0, @@F(false, @@D(@@N(@@N(@@S(@var_2, @@R(@var_2))))), @@F(true, @@D(@@N(@@S(@var_1, @@N(@@R(@var_1))))), @@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_0 && @var_1 || !@var_0 && @var_2))))))))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_2 = arg_not_nf2; // S1b
        return local_rewrite(var_2, this_rewriter); // R1 @var_2
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
        {
          const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
          return local_rewrite(var_1, this_rewriter); // R1 @var_1
        }
        else
        {
          const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
          const DATA_EXPR2& var_2 = arg_not_nf2; // S1b
          return rewr_82_2(rewr_45_2(var_0, var_1,  this_rewriter), delayed_rewr_45_2<delayed_rewr_85_1<data_expression>, DATA_EXPR2>(delayed_rewr_85_1<data_expression>(var_0,  this_rewriter), var_2,  this_rewriter),  this_rewriter); // R1 @var_0 && @var_1 || !@var_0 && @var_2
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac2d20))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_84_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_84_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_84_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_84_3(t[0], t[1], t[2], this_rewriter); }


  // [84] if: Bool # Bool # Bool -> Bool
  static inline const data_expression& rewr_84_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c24f70);
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
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
        return local_rewrite(var_0, this_rewriter); // R1 @var_0
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
        {
          return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
        }
        else
        {
        }
      }
    }
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@S(@var_0, @@F(!, @@S(@var_1, @@F(<, @@S(@var_2, @@N(@@S(@var_3, @@D(@@D(@@N(@@M(@var_0, @@R(@var_0), @@M(@var_1, @@R(true), @@F(!, @@M(@var_0, @@R(true), @@D(@@X)), @@F(<, @@M(@var_2, @@N(@@S(@var_4, @@C(@var_3 < @var_4, @@R(true), @@D(@@X)))), @@D(@@X)), @@F(&&, @@M(@var_1, @@F(!, @@M(@var_0, @@D(@@N(@@S(@var_4, @@R(@var_0 || @var_4)))), @@D(@@N(@@S(@var_4, @@R(!@var_1 || @var_4))))), @@N(@@S(@var_4, @@R(!@var_1 || @var_4)))), @@F(!, @@M(@var_0, @@D(@@N(@@S(@var_4, @@R(@var_0 || @var_4)))), @@D(@@D(@@X))), @@D(@@X))), @@F(false, @@R(@var_0), @@F(true, @@R(true), @@X))))))))))))), @@D(@@N(@@M(@var_0, @@R(@var_0), @@M(@var_1, @@R(true), @@F(!, @@M(@var_0, @@R(true), @@D(@@X)), @@F(&&, @@M(@var_1, @@F(!, @@M(@var_0, @@D(@@N(@@S(@var_2, @@R(@var_0 || @var_2)))), @@D(@@N(@@S(@var_2, @@R(!@var_1 || @var_2))))), @@N(@@S(@var_2, @@R(!@var_1 || @var_2)))), @@F(!, @@M(@var_0, @@D(@@N(@@S(@var_2, @@R(@var_0 || @var_2)))), @@D(@@D(@@X))), @@D(@@X))), @@F(true, @@R(true), @@F(false, @@R(@var_0), @@X)))))))))), @@F(<, @@S(@var_1, @@N(@@S(@var_2, @@D(@@N(@@M(@var_0, @@R(@var_0), @@F(!, @@M(@var_0, @@R(true), @@F(<, @@M(@var_1, @@N(@@S(@var_3, @@C(@var_3 < @var_2, @@R(true), @@D(@@D(@@X))))), @@D(@@D(@@X))), @@D(@@X))), @@F(false, @@R(@var_0), @@F(&&, @@F(!, @@M(@var_0, @@D(@@N(@@S(@var_3, @@R(@var_0 || @var_3)))), @@D(@@D(@@X))), @@D(@@X)), @@F(true, @@R(true), @@X)))))))))), @@F(&&, @@S(@var_1, @@N(@@S(@var_2, @@D(@@N(@@M(@var_0, @@R(@var_0), @@F(!, @@M(@var_0, @@R(true), @@M(@var_1, @@R(@var_2 || !@var_1), @@D(@@X))), @@F(false, @@R(@var_0), @@F(&&, @@F(!, @@M(@var_0, @@D(@@N(@@S(@var_3, @@R(@var_0 || @var_3)))), @@D(@@D(@@X))), @@D(@@X)), @@F(true, @@R(true), @@X)))))))))), @@N(@@M(@var_0, @@R(@var_0), @@F(!, @@M(@var_0, @@R(true), @@D(@@X)), @@F(false, @@R(@var_0), @@F(&&, @@F(!, @@M(@var_0, @@D(@@N(@@S(@var_1, @@R(@var_0 || @var_1)))), @@D(@@D(@@X))), @@D(@@X)), @@F(true, @@R(true), @@X))))))))))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac2d50) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        if (is_application_no_check(down_cast<data_expression>(arg0[1])) && uint_address(down_cast<data_expression>(arg0[1])[0]) == 0x55b7a8ac3800) // F2b <
        {
          const data_expression& t1 = down_cast<data_expression>(arg0[1]);
          const data_expression& var_2 = down_cast<data_expression>(t1[1]); // S2
          const data_expression& var_3 = down_cast<data_expression>(t1[2]); // S2
          if (var_0 == arg1) // M
          {
            return var_0; // R1 @var_0
          }
          else
          {
            if (var_1 == arg1) // M
            {
              return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
            }
            else
            {
              if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac2d50) // F1
              {
                if (var_0 == arg1[1]) // M
                {
                  return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
                }
                else
                {
                }
              }
              else
              {
                if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac3800) // F1
                {
                  if (var_2 == arg1[1]) // M
                  {
                    const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
                    if (rewr_96_2(var_3, var_4,  this_rewriter) == sort_bool::true_()) // C
                    {
                      return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
                    }
                    else
                    {
                    }
                  }
                  else
                  {
                  }
                }
                else
                {
                  if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac11c0) // F1
                  {
                    if (var_1 == arg1[1]) // M
                    {
                      if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x55b7a8ac2d50) // F2b !
                      {
                        const data_expression& t3 = down_cast<data_expression>(arg1[1]);
                        if (var_0 == t3[1]) // M
                        {
                          const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
                          return rewr_82_2(var_0, var_4,  this_rewriter); // R1 @var_0 || @var_4
                        }
                        else
                        {
                          const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
                          return rewr_82_2(rewr_85_1(var_1,  this_rewriter), var_4,  this_rewriter); // R1 !@var_1 || @var_4
                        }
                      }
                      else
                      {
                        const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
                        return rewr_82_2(rewr_85_1(var_1,  this_rewriter), var_4,  this_rewriter); // R1 !@var_1 || @var_4
                      }
                    }
                    else
                    {
                      if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x55b7a8ac2d50) // F2b !
                      {
                        const data_expression& t3 = down_cast<data_expression>(arg1[1]);
                        if (var_0 == t3[1]) // M
                        {
                          const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
                          return rewr_82_2(var_0, var_4,  this_rewriter); // R1 @var_0 || @var_4
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
                  else
                  {
                    if (uint_address(arg1) == 0x55b7a8ac2180) // F1
                    {
                      return var_0; // R1 @var_0
                    }
                    else
                    {
                      if (uint_address(arg1) == 0x55b7a8ac07a0) // F1
                      {
                        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
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
        else
        {
          if (var_0 == arg1) // M
          {
            return var_0; // R1 @var_0
          }
          else
          {
            if (var_1 == arg1) // M
            {
              return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
            }
            else
            {
              if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac2d50) // F1
              {
                if (var_0 == arg1[1]) // M
                {
                  return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
                }
                else
                {
                }
              }
              else
              {
                if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac11c0) // F1
                {
                  if (var_1 == arg1[1]) // M
                  {
                    if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x55b7a8ac2d50) // F2b !
                    {
                      const data_expression& t2 = down_cast<data_expression>(arg1[1]);
                      if (var_0 == t2[1]) // M
                      {
                        const data_expression& var_2 = down_cast<data_expression>(arg1[2]); // S2
                        return rewr_82_2(var_0, var_2,  this_rewriter); // R1 @var_0 || @var_2
                      }
                      else
                      {
                        const data_expression& var_2 = down_cast<data_expression>(arg1[2]); // S2
                        return rewr_82_2(rewr_85_1(var_1,  this_rewriter), var_2,  this_rewriter); // R1 !@var_1 || @var_2
                      }
                    }
                    else
                    {
                      const data_expression& var_2 = down_cast<data_expression>(arg1[2]); // S2
                      return rewr_82_2(rewr_85_1(var_1,  this_rewriter), var_2,  this_rewriter); // R1 !@var_1 || @var_2
                    }
                  }
                  else
                  {
                    if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x55b7a8ac2d50) // F2b !
                    {
                      const data_expression& t2 = down_cast<data_expression>(arg1[1]);
                      if (var_0 == t2[1]) // M
                      {
                        const data_expression& var_2 = down_cast<data_expression>(arg1[2]); // S2
                        return rewr_82_2(var_0, var_2,  this_rewriter); // R1 @var_0 || @var_2
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
                else
                {
                  if (uint_address(arg1) == 0x55b7a8ac07a0) // F1
                  {
                    return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
                  }
                  else
                  {
                    if (uint_address(arg1) == 0x55b7a8ac2180) // F1
                    {
                      return var_0; // R1 @var_0
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
      else
      {
        if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac3800) // F1
        {
          const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
          const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
          if (var_0 == arg1) // M
          {
            return var_0; // R1 @var_0
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac2d50) // F1
            {
              if (var_0 == arg1[1]) // M
              {
                return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
              }
              else
              {
                if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x55b7a8ac3800) // F2b <
                {
                  const data_expression& t2 = down_cast<data_expression>(arg1[1]);
                  if (var_1 == t2[1]) // M
                  {
                    const data_expression& var_3 = down_cast<data_expression>(t2[2]); // S2
                    if (rewr_96_2(var_3, var_2,  this_rewriter) == sort_bool::true_()) // C
                    {
                      return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
                    }
                    else
                    {
                    }
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
            else
            {
              if (uint_address(arg1) == 0x55b7a8ac2180) // F1
              {
                return var_0; // R1 @var_0
              }
              else
              {
                if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac11c0) // F1
                {
                  if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x55b7a8ac2d50) // F2b !
                  {
                    const data_expression& t2 = down_cast<data_expression>(arg1[1]);
                    if (var_0 == t2[1]) // M
                    {
                      const data_expression& var_3 = down_cast<data_expression>(arg1[2]); // S2
                      return rewr_82_2(var_0, var_3,  this_rewriter); // R1 @var_0 || @var_3
                    }
                    else
                    {
                    }
                  }
                  else
                  {
                  }
                }
                else
                {
                  if (uint_address(arg1) == 0x55b7a8ac07a0) // F1
                  {
                    return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
                  }
                  else
                  {
                  }
                }
              }
            }
          }
        }
        else
        {
          if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac11c0) // F1
          {
            const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
            const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
            if (var_0 == arg1) // M
            {
              return var_0; // R1 @var_0
            }
            else
            {
              if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac2d50) // F1
              {
                if (var_0 == arg1[1]) // M
                {
                  return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
                }
                else
                {
                  if (var_1 == arg1[1]) // M
                  {
                    return rewr_82_2(var_2, delayed_rewr_85_1<data_expression>(var_1,  this_rewriter),  this_rewriter); // R1 @var_2 || !@var_1
                  }
                  else
                  {
                  }
                }
              }
              else
              {
                if (uint_address(arg1) == 0x55b7a8ac2180) // F1
                {
                  return var_0; // R1 @var_0
                }
                else
                {
                  if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac11c0) // F1
                  {
                    if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x55b7a8ac2d50) // F2b !
                    {
                      const data_expression& t2 = down_cast<data_expression>(arg1[1]);
                      if (var_0 == t2[1]) // M
                      {
                        const data_expression& var_3 = down_cast<data_expression>(arg1[2]); // S2
                        return rewr_82_2(var_0, var_3,  this_rewriter); // R1 @var_0 || @var_3
                      }
                      else
                      {
                      }
                    }
                    else
                    {
                    }
                  }
                  else
                  {
                    if (uint_address(arg1) == 0x55b7a8ac07a0) // F1
                    {
                      return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
                    }
                    else
                    {
                    }
                  }
                }
              }
            }
          }
          else
          {
            if (var_0 == arg1) // M
            {
              return var_0; // R1 @var_0
            }
            else
            {
              if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac2d50) // F1
              {
                if (var_0 == arg1[1]) // M
                {
                  return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
                }
                else
                {
                }
              }
              else
              {
                if (uint_address(arg1) == 0x55b7a8ac2180) // F1
                {
                  return var_0; // R1 @var_0
                }
                else
                {
                  if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac11c0) // F1
                  {
                    if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x55b7a8ac2d50) // F2b !
                    {
                      const data_expression& t1 = down_cast<data_expression>(arg1[1]);
                      if (var_0 == t1[1]) // M
                      {
                        const data_expression& var_1 = down_cast<data_expression>(arg1[2]); // S2
                        return rewr_82_2(var_0, var_1,  this_rewriter); // R1 @var_0 || @var_1
                      }
                      else
                      {
                      }
                    }
                    else
                    {
                    }
                  }
                  else
                  {
                    if (uint_address(arg1) == 0x55b7a8ac07a0) // F1
                    {
                      return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
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
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac2720))), arg0, arg1);
  }

  static inline data_expression rewr_82_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_82_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_82_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_82_2(t[0], t[1], this_rewriter); }


  // [82] ||: Bool # Bool -> Bool
  static inline const data_expression& rewr_82_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c1f280);
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
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    // @@S(@var_0, @@F(==, @@S(@var_1, @@N(@@S(@var_2, @@D(@@N(@@M(@var_0, @@R(@var_0), @@F(!, @@M(@var_0, @@R(false), @@D(@@X)), @@F(==, @@S(@var_3, @@M(@var_1, @@N(@@S(@var_4, @@C(@var_2 != @var_4, @@R(false), @@M(@var_2, @@C(@var_1 != @var_3, @@R(false), @@D(@@X)), @@D(@@X))))), @@N(@@M(@var_2, @@C(@var_1 != @var_3, @@R(false), @@D(@@X)), @@D(@@X))))), @@F(&&, @@S(@var_3, @@M(@var_0, @@N(@@S(@var_4, @@R(@var_0 && @var_4))), @@N(@@M(@var_0, @@R(@var_0 && @var_3), @@D(@@X))))), @@F(false, @@R(false), @@F(||, @@F(!, @@M(@var_0, @@D(@@N(@@S(@var_3, @@R(@var_0 && @var_3)))), @@D(@@D(@@X))), @@D(@@X)), @@F(true, @@R(@var_0), @@X)))))))))))), @@F(!, @@S(@var_1, @@F(<, @@S(@var_2, @@N(@@S(@var_3, @@D(@@D(@@N(@@M(@var_0, @@R(@var_0), @@M(@var_1, @@R(false), @@F(!, @@M(@var_0, @@R(false), @@D(@@X)), @@F(<, @@M(@var_2, @@N(@@S(@var_4, @@C(@var_3 > @var_4, @@R(false), @@D(@@X)))), @@D(@@X)), @@F(&&, @@S(@var_4, @@M(@var_0, @@N(@@S(@var_5, @@R(@var_0 && @var_5))), @@N(@@M(@var_0, @@R(@var_0 && @var_4), @@D(@@X))))), @@F(||, @@M(@var_1, @@F(!, @@M(@var_0, @@D(@@N(@@S(@var_4, @@R(@var_0 && @var_4)))), @@D(@@N(@@S(@var_4, @@R(!@var_1 && @var_4))))), @@N(@@S(@var_4, @@R(!@var_1 && @var_4)))), @@F(!, @@M(@var_0, @@D(@@N(@@S(@var_4, @@R(@var_0 && @var_4)))), @@D(@@D(@@X))), @@D(@@X))), @@F(true, @@R(@var_0), @@F(false, @@R(false), @@X)))))))))))))), @@D(@@N(@@M(@var_0, @@R(@var_0), @@M(@var_1, @@R(false), @@F(!, @@M(@var_0, @@R(false), @@D(@@X)), @@F(||, @@M(@var_1, @@F(!, @@M(@var_0, @@D(@@N(@@S(@var_2, @@R(@var_0 && @var_2)))), @@D(@@N(@@S(@var_2, @@R(!@var_1 && @var_2))))), @@N(@@S(@var_2, @@R(!@var_1 && @var_2)))), @@F(!, @@M(@var_0, @@D(@@N(@@S(@var_2, @@R(@var_0 && @var_2)))), @@D(@@D(@@X))), @@D(@@X))), @@F(&&, @@S(@var_2, @@M(@var_0, @@N(@@S(@var_3, @@R(@var_0 && @var_3))), @@N(@@M(@var_0, @@R(@var_0 && @var_2), @@D(@@X))))), @@F(false, @@R(false), @@F(true, @@R(@var_0), @@X))))))))))), @@F(<, @@S(@var_1, @@N(@@S(@var_2, @@D(@@N(@@M(@var_0, @@R(@var_0), @@F(!, @@M(@var_0, @@R(false), @@F(<, @@M(@var_1, @@N(@@S(@var_3, @@C(@var_3 > @var_2, @@R(false), @@D(@@D(@@X))))), @@D(@@D(@@X))), @@D(@@X))), @@F(false, @@R(false), @@F(&&, @@S(@var_3, @@M(@var_0, @@N(@@S(@var_4, @@R(@var_0 && @var_4))), @@N(@@M(@var_0, @@R(@var_0 && @var_3), @@D(@@X))))), @@F(true, @@R(@var_0), @@F(||, @@F(!, @@M(@var_0, @@D(@@N(@@S(@var_3, @@R(@var_0 && @var_3)))), @@D(@@D(@@X))), @@D(@@X)), @@X))))))))))), @@N(@@M(@var_0, @@R(@var_0), @@F(!, @@M(@var_0, @@R(false), @@D(@@X)), @@F(false, @@R(false), @@F(&&, @@S(@var_1, @@M(@var_0, @@N(@@S(@var_2, @@R(@var_0 && @var_2))), @@N(@@M(@var_0, @@R(@var_0 && @var_1), @@D(@@X))))), @@F(true, @@R(@var_0), @@F(||, @@F(!, @@M(@var_0, @@D(@@N(@@S(@var_1, @@R(@var_0 && @var_1)))), @@D(@@D(@@X))), @@D(@@X)), @@X)))))))))))
    {
      const data_expression& var_0 = arg0; // S1a
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac0e60) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        if (var_0 == arg1) // M
        {
          return var_0; // R1 @var_0
        }
        else
        {
          if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac2d50) // F1
          {
            if (var_0 == arg1[1]) // M
            {
              return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
            }
            else
            {
            }
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac0e60) // F1
            {
              const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
              if (var_1 == arg1[1]) // M
              {
                const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
                if (rewr_61_2(var_2, var_4,  this_rewriter) == sort_bool::true_()) // C
                {
                  return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
                }
                else
                {
                  if (var_2 == arg1[2]) // M
                  {
                    if (rewr_61_2(var_1, var_3,  this_rewriter) == sort_bool::true_()) // C
                    {
                      return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
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
              else
              {
                if (var_2 == arg1[2]) // M
                {
                  if (rewr_61_2(var_1, var_3,  this_rewriter) == sort_bool::true_()) // C
                  {
                    return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
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
            else
            {
              if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac11c0) // F1
              {
                const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
                if (var_0 == arg1[1]) // M
                {
                  const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
                  return rewr_45_2(var_0, var_4,  this_rewriter); // R1 @var_0 && @var_4
                }
                else
                {
                  if (var_0 == arg1[2]) // M
                  {
                    return rewr_45_2(var_0, var_3,  this_rewriter); // R1 @var_0 && @var_3
                  }
                  else
                  {
                  }
                }
              }
              else
              {
                if (uint_address(arg1) == 0x55b7a8ac2180) // F1
                {
                  return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
                }
                else
                {
                  if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac2720) // F1
                  {
                    if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x55b7a8ac2d50) // F2b !
                    {
                      const data_expression& t2 = down_cast<data_expression>(arg1[1]);
                      if (var_0 == t2[1]) // M
                      {
                        const data_expression& var_3 = down_cast<data_expression>(arg1[2]); // S2
                        return rewr_45_2(var_0, var_3,  this_rewriter); // R1 @var_0 && @var_3
                      }
                      else
                      {
                      }
                    }
                    else
                    {
                    }
                  }
                  else
                  {
                    if (uint_address(arg1) == 0x55b7a8ac07a0) // F1
                    {
                      return var_0; // R1 @var_0
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
      else
      {
        if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac2d50) // F1
        {
          const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
          if (is_application_no_check(down_cast<data_expression>(arg0[1])) && uint_address(down_cast<data_expression>(arg0[1])[0]) == 0x55b7a8ac3800) // F2b <
          {
            const data_expression& t1 = down_cast<data_expression>(arg0[1]);
            const data_expression& var_2 = down_cast<data_expression>(t1[1]); // S2
            const data_expression& var_3 = down_cast<data_expression>(t1[2]); // S2
            if (var_0 == arg1) // M
            {
              return var_0; // R1 @var_0
            }
            else
            {
              if (var_1 == arg1) // M
              {
                return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
              }
              else
              {
                if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac2d50) // F1
                {
                  if (var_0 == arg1[1]) // M
                  {
                    return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
                  }
                  else
                  {
                  }
                }
                else
                {
                  if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac3800) // F1
                  {
                    if (var_2 == arg1[1]) // M
                    {
                      const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
                      if (rewr_101_2(var_3, var_4,  this_rewriter) == sort_bool::true_()) // C
                      {
                        return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
                      }
                      else
                      {
                      }
                    }
                    else
                    {
                    }
                  }
                  else
                  {
                    if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac11c0) // F1
                    {
                      const data_expression& var_4 = down_cast<data_expression>(arg1[1]); // S2
                      if (var_0 == arg1[1]) // M
                      {
                        const data_expression& var_5 = down_cast<data_expression>(arg1[2]); // S2
                        return rewr_45_2(var_0, var_5,  this_rewriter); // R1 @var_0 && @var_5
                      }
                      else
                      {
                        if (var_0 == arg1[2]) // M
                        {
                          return rewr_45_2(var_0, var_4,  this_rewriter); // R1 @var_0 && @var_4
                        }
                        else
                        {
                        }
                      }
                    }
                    else
                    {
                      if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac2720) // F1
                      {
                        if (var_1 == arg1[1]) // M
                        {
                          if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x55b7a8ac2d50) // F2b !
                          {
                            const data_expression& t3 = down_cast<data_expression>(arg1[1]);
                            if (var_0 == t3[1]) // M
                            {
                              const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
                              return rewr_45_2(var_0, var_4,  this_rewriter); // R1 @var_0 && @var_4
                            }
                            else
                            {
                              const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
                              return rewr_45_2(rewr_85_1(var_1,  this_rewriter), var_4,  this_rewriter); // R1 !@var_1 && @var_4
                            }
                          }
                          else
                          {
                            const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
                            return rewr_45_2(rewr_85_1(var_1,  this_rewriter), var_4,  this_rewriter); // R1 !@var_1 && @var_4
                          }
                        }
                        else
                        {
                          if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x55b7a8ac2d50) // F2b !
                          {
                            const data_expression& t3 = down_cast<data_expression>(arg1[1]);
                            if (var_0 == t3[1]) // M
                            {
                              const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
                              return rewr_45_2(var_0, var_4,  this_rewriter); // R1 @var_0 && @var_4
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
                      else
                      {
                        if (uint_address(arg1) == 0x55b7a8ac07a0) // F1
                        {
                          return var_0; // R1 @var_0
                        }
                        else
                        {
                          if (uint_address(arg1) == 0x55b7a8ac2180) // F1
                          {
                            return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
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
          }
          else
          {
            if (var_0 == arg1) // M
            {
              return var_0; // R1 @var_0
            }
            else
            {
              if (var_1 == arg1) // M
              {
                return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
              }
              else
              {
                if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac2d50) // F1
                {
                  if (var_0 == arg1[1]) // M
                  {
                    return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
                  }
                  else
                  {
                  }
                }
                else
                {
                  if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac2720) // F1
                  {
                    if (var_1 == arg1[1]) // M
                    {
                      if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x55b7a8ac2d50) // F2b !
                      {
                        const data_expression& t2 = down_cast<data_expression>(arg1[1]);
                        if (var_0 == t2[1]) // M
                        {
                          const data_expression& var_2 = down_cast<data_expression>(arg1[2]); // S2
                          return rewr_45_2(var_0, var_2,  this_rewriter); // R1 @var_0 && @var_2
                        }
                        else
                        {
                          const data_expression& var_2 = down_cast<data_expression>(arg1[2]); // S2
                          return rewr_45_2(rewr_85_1(var_1,  this_rewriter), var_2,  this_rewriter); // R1 !@var_1 && @var_2
                        }
                      }
                      else
                      {
                        const data_expression& var_2 = down_cast<data_expression>(arg1[2]); // S2
                        return rewr_45_2(rewr_85_1(var_1,  this_rewriter), var_2,  this_rewriter); // R1 !@var_1 && @var_2
                      }
                    }
                    else
                    {
                      if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x55b7a8ac2d50) // F2b !
                      {
                        const data_expression& t2 = down_cast<data_expression>(arg1[1]);
                        if (var_0 == t2[1]) // M
                        {
                          const data_expression& var_2 = down_cast<data_expression>(arg1[2]); // S2
                          return rewr_45_2(var_0, var_2,  this_rewriter); // R1 @var_0 && @var_2
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
                  else
                  {
                    if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac11c0) // F1
                    {
                      const data_expression& var_2 = down_cast<data_expression>(arg1[1]); // S2
                      if (var_0 == arg1[1]) // M
                      {
                        const data_expression& var_3 = down_cast<data_expression>(arg1[2]); // S2
                        return rewr_45_2(var_0, var_3,  this_rewriter); // R1 @var_0 && @var_3
                      }
                      else
                      {
                        if (var_0 == arg1[2]) // M
                        {
                          return rewr_45_2(var_0, var_2,  this_rewriter); // R1 @var_0 && @var_2
                        }
                        else
                        {
                        }
                      }
                    }
                    else
                    {
                      if (uint_address(arg1) == 0x55b7a8ac2180) // F1
                      {
                        return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
                      }
                      else
                      {
                        if (uint_address(arg1) == 0x55b7a8ac07a0) // F1
                        {
                          return var_0; // R1 @var_0
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
        }
        else
        {
          if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac3800) // F1
          {
            const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
            const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
            if (var_0 == arg1) // M
            {
              return var_0; // R1 @var_0
            }
            else
            {
              if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac2d50) // F1
              {
                if (var_0 == arg1[1]) // M
                {
                  return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
                }
                else
                {
                  if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x55b7a8ac3800) // F2b <
                  {
                    const data_expression& t2 = down_cast<data_expression>(arg1[1]);
                    if (var_1 == t2[1]) // M
                    {
                      const data_expression& var_3 = down_cast<data_expression>(t2[2]); // S2
                      if (rewr_101_2(var_3, var_2,  this_rewriter) == sort_bool::true_()) // C
                      {
                        return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
                      }
                      else
                      {
                      }
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
              else
              {
                if (uint_address(arg1) == 0x55b7a8ac2180) // F1
                {
                  return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
                }
                else
                {
                  if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac11c0) // F1
                  {
                    const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
                    if (var_0 == arg1[1]) // M
                    {
                      const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
                      return rewr_45_2(var_0, var_4,  this_rewriter); // R1 @var_0 && @var_4
                    }
                    else
                    {
                      if (var_0 == arg1[2]) // M
                      {
                        return rewr_45_2(var_0, var_3,  this_rewriter); // R1 @var_0 && @var_3
                      }
                      else
                      {
                      }
                    }
                  }
                  else
                  {
                    if (uint_address(arg1) == 0x55b7a8ac07a0) // F1
                    {
                      return var_0; // R1 @var_0
                    }
                    else
                    {
                      if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac2720) // F1
                      {
                        if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x55b7a8ac2d50) // F2b !
                        {
                          const data_expression& t2 = down_cast<data_expression>(arg1[1]);
                          if (var_0 == t2[1]) // M
                          {
                            const data_expression& var_3 = down_cast<data_expression>(arg1[2]); // S2
                            return rewr_45_2(var_0, var_3,  this_rewriter); // R1 @var_0 && @var_3
                          }
                          else
                          {
                          }
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
            if (var_0 == arg1) // M
            {
              return var_0; // R1 @var_0
            }
            else
            {
              if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac2d50) // F1
              {
                if (var_0 == arg1[1]) // M
                {
                  return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
                }
                else
                {
                }
              }
              else
              {
                if (uint_address(arg1) == 0x55b7a8ac2180) // F1
                {
                  return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
                }
                else
                {
                  if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac11c0) // F1
                  {
                    const data_expression& var_1 = down_cast<data_expression>(arg1[1]); // S2
                    if (var_0 == arg1[1]) // M
                    {
                      const data_expression& var_2 = down_cast<data_expression>(arg1[2]); // S2
                      return rewr_45_2(var_0, var_2,  this_rewriter); // R1 @var_0 && @var_2
                    }
                    else
                    {
                      if (var_0 == arg1[2]) // M
                      {
                        return rewr_45_2(var_0, var_1,  this_rewriter); // R1 @var_0 && @var_1
                      }
                      else
                      {
                      }
                    }
                  }
                  else
                  {
                    if (uint_address(arg1) == 0x55b7a8ac07a0) // F1
                    {
                      return var_0; // R1 @var_0
                    }
                    else
                    {
                      if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac2720) // F1
                      {
                        if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x55b7a8ac2d50) // F2b !
                        {
                          const data_expression& t1 = down_cast<data_expression>(arg1[1]);
                          if (var_0 == t1[1]) // M
                          {
                            const data_expression& var_1 = down_cast<data_expression>(arg1[2]); // S2
                            return rewr_45_2(var_0, var_1,  this_rewriter); // R1 @var_0 && @var_1
                          }
                          else
                          {
                          }
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
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac11c0))), arg0, arg1);
  }

  static inline data_expression rewr_45_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_45_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_45_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_45_2(t[0], t[1], this_rewriter); }


  // [45] &&: Bool # Bool -> Bool
  static inline const data_expression& rewr_45_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf2440);
  }

  static inline data_expression rewr_45_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_45_0(this_rewriter); }

  static inline data_expression rewr_45_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_45_0(this_rewriter); }


  // [44] =>: Bool # Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_44_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!@var_0 || @var_1))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_2(rewr_85_1(local_rewrite(var_0, this_rewriter),  this_rewriter), var_1,  this_rewriter); // R1 !@var_0 || @var_1
    }
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@S(@var_0, @@R(true)))), @@F(true, @@D(@@N(@@S(@var_0, @@R(@var_0)))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
      if (uint_address(arg1) == 0x55b7a8ac07a0) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
        if (uint_address(arg1) == 0x55b7a8ac2180) // F1
        {
          return rewr_85_1(var_0,  this_rewriter); // R1 !@var_0
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac1160))), arg0, arg1);
  }

  static inline data_expression rewr_44_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_44_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_44_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_44_2(t[0], t[1], this_rewriter); }


  // [44] =>: Bool # Bool -> Bool
  static inline const data_expression& rewr_44_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c1fac0);
  }

  static inline data_expression rewr_44_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_44_0(this_rewriter); }

  static inline data_expression rewr_44_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_44_0(this_rewriter); }


  // [693] if: Bool # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) -> (Place -> List(Nat)) # Trans_name -> MarkingTrans
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_693_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b34b60))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_693_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_693_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_693_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_693_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [693] if: Bool # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) -> (Place -> List(Nat)) # Trans_name -> MarkingTrans
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_693_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b34b60))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_693_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_693_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_693_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_693_3(t[0], t[1], t[2], this_rewriter); }


  // [693] if: Bool # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) -> (Place -> List(Nat)) # Trans_name -> MarkingTrans
  static inline const data_expression& rewr_693_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c61500);
  }

  static inline data_expression rewr_693_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_693_0(this_rewriter); }

  static inline data_expression rewr_693_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_693_0(this_rewriter); }


  // [692] !=: ((Place -> List(Nat)) # Trans_name -> MarkingTrans) # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_692_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_691_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b34b30))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_692_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_692_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_692_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_692_2(t[0], t[1], this_rewriter); }


  // [692] !=: ((Place -> List(Nat)) # Trans_name -> MarkingTrans) # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) -> Bool
  static inline const data_expression& rewr_692_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c24460);
  }

  static inline data_expression rewr_692_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_692_0(this_rewriter); }

  static inline data_expression rewr_692_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_692_0(this_rewriter); }


  // [691] ==: ((Place -> List(Nat)) # Trans_name -> MarkingTrans) # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_691_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Place -> List(Nat), x3: Trans_name. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(0), rewr_698_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(1))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(1))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Place -> List(Nat), x3: Trans_name. @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b34b00))), arg0, arg1);
  }

  static inline data_expression rewr_691_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_691_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_691_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_691_2(t[0], t[1], this_rewriter); }


  // [691] ==: ((Place -> List(Nat)) # Trans_name -> MarkingTrans) # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) -> Bool
  static inline const data_expression& rewr_691_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf2410);
  }

  static inline data_expression rewr_691_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_691_0(this_rewriter); }

  static inline data_expression rewr_691_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_691_0(this_rewriter); }


  // [686] if: Bool # (Pos -> Pos) # (Pos -> Pos) -> Pos -> Pos
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_686_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b34740))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_686_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_686_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_686_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_686_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [686] if: Bool # (Pos -> Pos) # (Pos -> Pos) -> Pos -> Pos
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_686_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b34740))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_686_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_686_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_686_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_686_3(t[0], t[1], t[2], this_rewriter); }


  // [686] if: Bool # (Pos -> Pos) # (Pos -> Pos) -> Pos -> Pos
  static inline const data_expression& rewr_686_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf23b0);
  }

  static inline data_expression rewr_686_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_686_0(this_rewriter); }

  static inline data_expression rewr_686_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_686_0(this_rewriter); }


  // [685] !=: (Pos -> Pos) # (Pos -> Pos) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_685_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_684_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b34710))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_685_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_685_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_685_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_685_2(t[0], t[1], this_rewriter); }


  // [685] !=: (Pos -> Pos) # (Pos -> Pos) -> Bool
  static inline const data_expression& rewr_685_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c21cc0);
  }

  static inline data_expression rewr_685_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_685_0(this_rewriter); }

  static inline data_expression rewr_685_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_685_0(this_rewriter); }


  // [684] ==: (Pos -> Pos) # (Pos -> Pos) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_684_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Pos. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(1), rewr_83_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(2))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(2))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Pos. @var_0(x1) == @var_1(x1)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b346e0))), arg0, arg1);
  }

  static inline data_expression rewr_684_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_684_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_684_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_684_2(t[0], t[1], this_rewriter); }


  // [684] ==: (Pos -> Pos) # (Pos -> Pos) -> Bool
  static inline const data_expression& rewr_684_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c61620);
  }

  static inline data_expression rewr_684_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_684_0(this_rewriter); }

  static inline data_expression rewr_684_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_684_0(this_rewriter); }


  // [675] if: Bool # (Nat -> Pos) # (Nat -> Pos) -> Nat -> Pos
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_675_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b34200))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_675_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_675_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_675_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_675_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [675] if: Bool # (Nat -> Pos) # (Nat -> Pos) -> Nat -> Pos
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_675_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b34200))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_675_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_675_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_675_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_675_3(t[0], t[1], t[2], this_rewriter); }


  // [675] if: Bool # (Nat -> Pos) # (Nat -> Pos) -> Nat -> Pos
  static inline const data_expression& rewr_675_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf2380);
  }

  static inline data_expression rewr_675_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_675_0(this_rewriter); }

  static inline data_expression rewr_675_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_675_0(this_rewriter); }


  // [674] !=: (Nat -> Pos) # (Nat -> Pos) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_674_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_673_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b341d0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_674_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_674_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_674_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_674_2(t[0], t[1], this_rewriter); }


  // [674] !=: (Nat -> Pos) # (Nat -> Pos) -> Bool
  static inline const data_expression& rewr_674_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8ba9d80);
  }

  static inline data_expression rewr_674_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_674_0(this_rewriter); }

  static inline data_expression rewr_674_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_674_0(this_rewriter); }


  // [673] ==: (Nat -> Pos) # (Nat -> Pos) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_673_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Nat. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(2), rewr_83_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(3))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(3))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Nat. @var_0(x1) == @var_1(x1)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b341a0))), arg0, arg1);
  }

  static inline data_expression rewr_673_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_673_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_673_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_673_2(t[0], t[1], this_rewriter); }


  // [673] ==: (Nat -> Pos) # (Nat -> Pos) -> Bool
  static inline const data_expression& rewr_673_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c61850);
  }

  static inline data_expression rewr_673_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_673_0(this_rewriter); }

  static inline data_expression rewr_673_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_673_0(this_rewriter); }


  // [664] if: Bool # (Real -> Real) # (Real -> Real) -> Real -> Real
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_664_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b33c60))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_664_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_664_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_664_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_664_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [664] if: Bool # (Real -> Real) # (Real -> Real) -> Real -> Real
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_664_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b33c60))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_664_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_664_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_664_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_664_3(t[0], t[1], t[2], this_rewriter); }


  // [664] if: Bool # (Real -> Real) # (Real -> Real) -> Real -> Real
  static inline const data_expression& rewr_664_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c61880);
  }

  static inline data_expression rewr_664_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_664_0(this_rewriter); }

  static inline data_expression rewr_664_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_664_0(this_rewriter); }


  // [663] !=: (Real -> Real) # (Real -> Real) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_663_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_662_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b33c30))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_663_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_663_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_663_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_663_2(t[0], t[1], this_rewriter); }


  // [663] !=: (Real -> Real) # (Real -> Real) -> Bool
  static inline const data_expression& rewr_663_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c616b0);
  }

  static inline data_expression rewr_663_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_663_0(this_rewriter); }

  static inline data_expression rewr_663_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_663_0(this_rewriter); }


  // [662] ==: (Real -> Real) # (Real -> Real) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_662_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Real. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(3), rewr_102_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(4))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(4))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Real. @var_0(x1) == @var_1(x1)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b33c00))), arg0, arg1);
  }

  static inline data_expression rewr_662_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_662_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_662_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_662_2(t[0], t[1], this_rewriter); }


  // [662] ==: (Real -> Real) # (Real -> Real) -> Bool
  static inline const data_expression& rewr_662_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c61430);
  }

  static inline data_expression rewr_662_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_662_0(this_rewriter); }

  static inline data_expression rewr_662_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_662_0(this_rewriter); }


  // [652] if: Bool # (Real # Real -> Bool) # (Real # Real -> Bool) -> Real # Real -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_652_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b33510))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_652_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_652_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_652_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_652_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [652] if: Bool # (Real # Real -> Bool) # (Real # Real -> Bool) -> Real # Real -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_652_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b33510))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_652_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_652_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_652_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_652_3(t[0], t[1], t[2], this_rewriter); }


  // [652] if: Bool # (Real # Real -> Bool) # (Real # Real -> Bool) -> Real # Real -> Bool
  static inline const data_expression& rewr_652_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c618b0);
  }

  static inline data_expression rewr_652_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_652_0(this_rewriter); }

  static inline data_expression rewr_652_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_652_0(this_rewriter); }


  // [651] !=: (Real # Real -> Bool) # (Real # Real -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_651_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_650_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b334e0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_651_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_651_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_651_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_651_2(t[0], t[1], this_rewriter); }


  // [651] !=: (Real # Real -> Bool) # (Real # Real -> Bool) -> Bool
  static inline const data_expression& rewr_651_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c617f0);
  }

  static inline data_expression rewr_651_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_651_0(this_rewriter); }

  static inline data_expression rewr_651_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_651_0(this_rewriter); }


  // [650] ==: (Real # Real -> Bool) # (Real # Real -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_650_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: Real. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(4), rewr_403_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(4)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(5))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(4)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(5)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: Real. @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b334b0))), arg0, arg1);
  }

  static inline data_expression rewr_650_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_650_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_650_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_650_2(t[0], t[1], this_rewriter); }


  // [650] ==: (Real # Real -> Bool) # (Real # Real -> Bool) -> Bool
  static inline const data_expression& rewr_650_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bfde50);
  }

  static inline data_expression rewr_650_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_650_0(this_rewriter); }

  static inline data_expression rewr_650_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_650_0(this_rewriter); }


  // [645] if: Bool # (Real # Real -> Real) # (Real # Real -> Real) -> Real # Real -> Real
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_645_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b33000))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_645_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_645_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_645_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_645_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [645] if: Bool # (Real # Real -> Real) # (Real # Real -> Real) -> Real # Real -> Real
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_645_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b33000))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_645_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_645_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_645_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_645_3(t[0], t[1], t[2], this_rewriter); }


  // [645] if: Bool # (Real # Real -> Real) # (Real # Real -> Real) -> Real # Real -> Real
  static inline const data_expression& rewr_645_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bfdd60);
  }

  static inline data_expression rewr_645_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_645_0(this_rewriter); }

  static inline data_expression rewr_645_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_645_0(this_rewriter); }


  // [644] !=: (Real # Real -> Real) # (Real # Real -> Real) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_644_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_643_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b32fd0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_644_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_644_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_644_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_644_2(t[0], t[1], this_rewriter); }


  // [644] !=: (Real # Real -> Real) # (Real # Real -> Real) -> Bool
  static inline const data_expression& rewr_644_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c61680);
  }

  static inline data_expression rewr_644_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_644_0(this_rewriter); }

  static inline data_expression rewr_644_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_644_0(this_rewriter); }


  // [643] ==: (Real # Real -> Real) # (Real # Real -> Real) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_643_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: Real. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(4), rewr_102_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(4)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(5))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(4)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(5))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: Real. @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b32fa0))), arg0, arg1);
  }

  static inline data_expression rewr_643_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_643_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_643_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_643_2(t[0], t[1], this_rewriter); }


  // [643] ==: (Real # Real -> Real) # (Real # Real -> Real) -> Bool
  static inline const data_expression& rewr_643_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c23e60);
  }

  static inline data_expression rewr_643_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_643_0(this_rewriter); }

  static inline data_expression rewr_643_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_643_0(this_rewriter); }


  // [638] if: Bool # (Pos -> Int) # (Pos -> Int) -> Pos -> Int
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_638_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b32be0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_638_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_638_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_638_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_638_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [638] if: Bool # (Pos -> Int) # (Pos -> Int) -> Pos -> Int
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_638_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b32be0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_638_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_638_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_638_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_638_3(t[0], t[1], t[2], this_rewriter); }


  // [638] if: Bool # (Pos -> Int) # (Pos -> Int) -> Pos -> Int
  static inline const data_expression& rewr_638_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c23ec0);
  }

  static inline data_expression rewr_638_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_638_0(this_rewriter); }

  static inline data_expression rewr_638_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_638_0(this_rewriter); }


  // [637] !=: (Pos -> Int) # (Pos -> Int) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_637_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_636_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b32bb0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_637_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_637_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_637_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_637_2(t[0], t[1], this_rewriter); }


  // [637] !=: (Pos -> Int) # (Pos -> Int) -> Bool
  static inline const data_expression& rewr_637_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf3830);
  }

  static inline data_expression rewr_637_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_637_0(this_rewriter); }

  static inline data_expression rewr_637_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_637_0(this_rewriter); }


  // [636] ==: (Pos -> Int) # (Pos -> Int) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_636_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Pos. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(1), rewr_617_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(2))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(2))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Pos. @var_0(x1) == @var_1(x1)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b32b80))), arg0, arg1);
  }

  static inline data_expression rewr_636_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_636_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_636_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_636_2(t[0], t[1], this_rewriter); }


  // [636] ==: (Pos -> Int) # (Pos -> Int) -> Bool
  static inline const data_expression& rewr_636_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf3940);
  }

  static inline data_expression rewr_636_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_636_0(this_rewriter); }

  static inline data_expression rewr_636_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_636_0(this_rewriter); }


  // [627] if: Bool # (Int # Pos -> Real) # (Int # Pos -> Real) -> Int # Pos -> Real
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_627_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b325e0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_627_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_627_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_627_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_627_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [627] if: Bool # (Int # Pos -> Real) # (Int # Pos -> Real) -> Int # Pos -> Real
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_627_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b325e0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_627_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_627_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_627_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_627_3(t[0], t[1], t[2], this_rewriter); }


  // [627] if: Bool # (Int # Pos -> Real) # (Int # Pos -> Real) -> Int # Pos -> Real
  static inline const data_expression& rewr_627_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bfdcc0);
  }

  static inline data_expression rewr_627_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_627_0(this_rewriter); }

  static inline data_expression rewr_627_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_627_0(this_rewriter); }


  // [626] !=: (Int # Pos -> Real) # (Int # Pos -> Real) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_626_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_625_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b325b0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_626_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_626_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_626_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_626_2(t[0], t[1], this_rewriter); }


  // [626] !=: (Int # Pos -> Real) # (Int # Pos -> Real) -> Bool
  static inline const data_expression& rewr_626_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf3860);
  }

  static inline data_expression rewr_626_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_626_0(this_rewriter); }

  static inline data_expression rewr_626_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_626_0(this_rewriter); }


  // [625] ==: (Int # Pos -> Real) # (Int # Pos -> Real) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_625_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Int, x3: Pos. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(5), rewr_102_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(6)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(7))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(6)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(7))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Int, x3: Pos. @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b32580))), arg0, arg1);
  }

  static inline data_expression rewr_625_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_625_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_625_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_625_2(t[0], t[1], this_rewriter); }


  // [625] ==: (Int # Pos -> Real) # (Int # Pos -> Real) -> Bool
  static inline const data_expression& rewr_625_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bfd720);
  }

  static inline data_expression rewr_625_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_625_0(this_rewriter); }

  static inline data_expression rewr_625_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_625_0(this_rewriter); }


  // [620] if: Bool # (Nat -> Int) # (Nat -> Int) -> Nat -> Int
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_620_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b321c0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_620_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_620_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_620_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_620_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [620] if: Bool # (Nat -> Int) # (Nat -> Int) -> Nat -> Int
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_620_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b321c0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_620_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_620_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_620_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_620_3(t[0], t[1], t[2], this_rewriter); }


  // [620] if: Bool # (Nat -> Int) # (Nat -> Int) -> Nat -> Int
  static inline const data_expression& rewr_620_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bfd690);
  }

  static inline data_expression rewr_620_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_620_0(this_rewriter); }

  static inline data_expression rewr_620_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_620_0(this_rewriter); }


  // [619] !=: (Nat -> Int) # (Nat -> Int) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_619_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_618_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b32190))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_619_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_619_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_619_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_619_2(t[0], t[1], this_rewriter); }


  // [619] !=: (Nat -> Int) # (Nat -> Int) -> Bool
  static inline const data_expression& rewr_619_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c61e30);
  }

  static inline data_expression rewr_619_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_619_0(this_rewriter); }

  static inline data_expression rewr_619_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_619_0(this_rewriter); }


  // [618] ==: (Nat -> Int) # (Nat -> Int) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_618_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Nat. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(2), rewr_617_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(3))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(3))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Nat. @var_0(x1) == @var_1(x1)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b32160))), arg0, arg1);
  }

  static inline data_expression rewr_618_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_618_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_618_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_618_2(t[0], t[1], this_rewriter); }


  // [618] ==: (Nat -> Int) # (Nat -> Int) -> Bool
  static inline const data_expression& rewr_618_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf3800);
  }

  static inline data_expression rewr_618_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_618_0(this_rewriter); }

  static inline data_expression rewr_618_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_618_0(this_rewriter); }


  // [608] if: Bool # (Place # Place -> Bool) # (Place # Place -> Bool) -> Place # Place -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_608_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b31b60))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_608_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_608_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_608_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_608_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [608] if: Bool # (Place # Place -> Bool) # (Place # Place -> Bool) -> Place # Place -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_608_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b31b60))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_608_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_608_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_608_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_608_3(t[0], t[1], t[2], this_rewriter); }


  // [608] if: Bool # (Place # Place -> Bool) # (Place # Place -> Bool) -> Place # Place -> Bool
  static inline const data_expression& rewr_608_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b093b0);
  }

  static inline data_expression rewr_608_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_608_0(this_rewriter); }

  static inline data_expression rewr_608_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_608_0(this_rewriter); }


  // [607] !=: (Place # Place -> Bool) # (Place # Place -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_607_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_606_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b31b30))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_607_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_607_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_607_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_607_2(t[0], t[1], this_rewriter); }


  // [607] !=: (Place # Place -> Bool) # (Place # Place -> Bool) -> Bool
  static inline const data_expression& rewr_607_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c62210);
  }

  static inline data_expression rewr_607_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_607_0(this_rewriter); }

  static inline data_expression rewr_607_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_607_0(this_rewriter); }


  // [606] ==: (Place # Place -> Bool) # (Place # Place -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_606_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: Place. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(6), rewr_403_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(8)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(9))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(8)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(9)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: Place. @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b31b00))), arg0, arg1);
  }

  static inline data_expression rewr_606_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_606_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_606_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_606_2(t[0], t[1], this_rewriter); }


  // [606] ==: (Place # Place -> Bool) # (Place # Place -> Bool) -> Bool
  static inline const data_expression& rewr_606_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bfce40);
  }

  static inline data_expression rewr_606_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_606_0(this_rewriter); }

  static inline data_expression rewr_606_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_606_0(this_rewriter); }


  // [601] if: Bool # (Bool # List(Nat) # List(Nat) -> List(Nat)) # (Bool # List(Nat) # List(Nat) -> List(Nat)) -> Bool # List(Nat) # List(Nat) -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4, class DATA_EXPR5>
  static inline data_expression rewr_601_6(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, const DATA_EXPR5& arg_not_nf5, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_1(@var_2, @var_3, @var_4)))))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_0(@var_2, @var_3, @var_4)))))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter), local_rewrite(var_4, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3, @var_4)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b31710))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter), local_rewrite(arg_not_nf5,this_rewriter));
  }

  static inline data_expression rewr_601_6_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_601_6(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_601_6_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_601_6(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], t[2], this_rewriter); }


  // [601] if: Bool # (Bool # List(Nat) # List(Nat) -> List(Nat)) # (Bool # List(Nat) # List(Nat) -> List(Nat)) -> Bool # List(Nat) # List(Nat) -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_601_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b31710))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_601_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_601_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_601_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_601_3(t[0], t[1], t[2], this_rewriter); }


  // [601] if: Bool # (Bool # List(Nat) # List(Nat) -> List(Nat)) # (Bool # List(Nat) # List(Nat) -> List(Nat)) -> Bool # List(Nat) # List(Nat) -> List(Nat)
  static inline const data_expression& rewr_601_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bfcf90);
  }

  static inline data_expression rewr_601_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_601_0(this_rewriter); }

  static inline data_expression rewr_601_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_601_0(this_rewriter); }


  // [600] !=: (Bool # List(Nat) # List(Nat) -> List(Nat)) # (Bool # List(Nat) # List(Nat) -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_600_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_599_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b316e0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_600_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_600_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_600_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_600_2(t[0], t[1], this_rewriter); }


  // [600] !=: (Bool # List(Nat) # List(Nat) -> List(Nat)) # (Bool # List(Nat) # List(Nat) -> List(Nat)) -> Bool
  static inline const data_expression& rewr_600_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b0be40);
  }

  static inline data_expression rewr_600_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_600_0(this_rewriter); }

  static inline data_expression rewr_600_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_600_0(this_rewriter); }


  // [599] ==: (Bool # List(Nat) # List(Nat) -> List(Nat)) # (Bool # List(Nat) # List(Nat) -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_599_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Bool, x2,x5: List(Nat). @var_0(x1, x2, x5) == @var_1(x1, x2, x5)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(7), rewr_90_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(10)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(11)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(12))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(10)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(11)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(12))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Bool, x2,x5: List(Nat). @var_0(x1, x2, x5) == @var_1(x1, x2, x5)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b316b0))), arg0, arg1);
  }

  static inline data_expression rewr_599_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_599_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_599_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_599_2(t[0], t[1], this_rewriter); }


  // [599] ==: (Bool # List(Nat) # List(Nat) -> List(Nat)) # (Bool # List(Nat) # List(Nat) -> List(Nat)) -> Bool
  static inline const data_expression& rewr_599_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c61ec0);
  }

  static inline data_expression rewr_599_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_599_0(this_rewriter); }

  static inline data_expression rewr_599_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_599_0(this_rewriter); }


  // [594] if: Bool # (Nat # List(Nat) -> Bool) # (Nat # List(Nat) -> Bool) -> Nat # List(Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_594_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b31260))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_594_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_594_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_594_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_594_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [594] if: Bool # (Nat # List(Nat) -> Bool) # (Nat # List(Nat) -> Bool) -> Nat # List(Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_594_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b31260))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_594_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_594_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_594_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_594_3(t[0], t[1], t[2], this_rewriter); }


  // [594] if: Bool # (Nat # List(Nat) -> Bool) # (Nat # List(Nat) -> Bool) -> Nat # List(Nat) -> Bool
  static inline const data_expression& rewr_594_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c62150);
  }

  static inline data_expression rewr_594_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_594_0(this_rewriter); }

  static inline data_expression rewr_594_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_594_0(this_rewriter); }


  // [593] !=: (Nat # List(Nat) -> Bool) # (Nat # List(Nat) -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_593_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_592_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b31230))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_593_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_593_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_593_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_593_2(t[0], t[1], this_rewriter); }


  // [593] !=: (Nat # List(Nat) -> Bool) # (Nat # List(Nat) -> Bool) -> Bool
  static inline const data_expression& rewr_593_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c24010);
  }

  static inline data_expression rewr_593_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_593_0(this_rewriter); }

  static inline data_expression rewr_593_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_593_0(this_rewriter); }


  // [592] ==: (Nat # List(Nat) -> Bool) # (Nat # List(Nat) -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_592_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Nat, x3: List(Nat). @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(8), rewr_403_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(3)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(13))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(3)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(13)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Nat, x3: List(Nat). @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b31200))), arg0, arg1);
  }

  static inline data_expression rewr_592_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_592_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_592_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_592_2(t[0], t[1], this_rewriter); }


  // [592] ==: (Nat # List(Nat) -> Bool) # (Nat # List(Nat) -> Bool) -> Bool
  static inline const data_expression& rewr_592_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c23fe0);
  }

  static inline data_expression rewr_592_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_592_0(this_rewriter); }

  static inline data_expression rewr_592_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_592_0(this_rewriter); }


  // [587] if: Bool # (Trans_name # Trans_name -> Bool) # (Trans_name # Trans_name -> Bool) -> Trans_name # Trans_name -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_587_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b30d80))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_587_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_587_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_587_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_587_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [587] if: Bool # (Trans_name # Trans_name -> Bool) # (Trans_name # Trans_name -> Bool) -> Trans_name # Trans_name -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_587_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b30d80))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_587_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_587_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_587_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_587_3(t[0], t[1], t[2], this_rewriter); }


  // [587] if: Bool # (Trans_name # Trans_name -> Bool) # (Trans_name # Trans_name -> Bool) -> Trans_name # Trans_name -> Bool
  static inline const data_expression& rewr_587_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c62450);
  }

  static inline data_expression rewr_587_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_587_0(this_rewriter); }

  static inline data_expression rewr_587_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_587_0(this_rewriter); }


  // [586] !=: (Trans_name # Trans_name -> Bool) # (Trans_name # Trans_name -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_586_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_585_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b30d50))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_586_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_586_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_586_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_586_2(t[0], t[1], this_rewriter); }


  // [586] !=: (Trans_name # Trans_name -> Bool) # (Trans_name # Trans_name -> Bool) -> Bool
  static inline const data_expression& rewr_586_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c62510);
  }

  static inline data_expression rewr_586_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_586_0(this_rewriter); }

  static inline data_expression rewr_586_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_586_0(this_rewriter); }


  // [585] ==: (Trans_name # Trans_name -> Bool) # (Trans_name # Trans_name -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_585_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: Trans_name. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(9), rewr_403_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(14)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(1))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(14)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(1)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: Trans_name. @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b30d20))), arg0, arg1);
  }

  static inline data_expression rewr_585_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_585_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_585_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_585_2(t[0], t[1], this_rewriter); }


  // [585] ==: (Trans_name # Trans_name -> Bool) # (Trans_name # Trans_name -> Bool) -> Bool
  static inline const data_expression& rewr_585_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c24230);
  }

  static inline data_expression rewr_585_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_585_0(this_rewriter); }

  static inline data_expression rewr_585_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_585_0(this_rewriter); }


  // [580] if: Bool # (Trans -> Trans_name) # (Trans -> Trans_name) -> Trans -> Trans_name
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_580_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b30960))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_580_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_580_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_580_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_580_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [580] if: Bool # (Trans -> Trans_name) # (Trans -> Trans_name) -> Trans -> Trans_name
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_580_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b30960))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_580_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_580_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_580_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_580_3(t[0], t[1], t[2], this_rewriter); }


  // [580] if: Bool # (Trans -> Trans_name) # (Trans -> Trans_name) -> Trans -> Trans_name
  static inline const data_expression& rewr_580_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c24260);
  }

  static inline data_expression rewr_580_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_580_0(this_rewriter); }

  static inline data_expression rewr_580_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_580_0(this_rewriter); }


  // [579] !=: (Trans -> Trans_name) # (Trans -> Trans_name) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_579_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_578_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b30930))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_579_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_579_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_579_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_579_2(t[0], t[1], this_rewriter); }


  // [579] !=: (Trans -> Trans_name) # (Trans -> Trans_name) -> Bool
  static inline const data_expression& rewr_579_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b0bd80);
  }

  static inline data_expression rewr_579_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_579_0(this_rewriter); }

  static inline data_expression rewr_579_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_579_0(this_rewriter); }


  // [578] ==: (Trans -> Trans_name) # (Trans -> Trans_name) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_578_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Trans. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(10), rewr_87_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(15))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(15))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Trans. @var_0(x1) == @var_1(x1)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b30900))), arg0, arg1);
  }

  static inline data_expression rewr_578_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_578_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_578_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_578_2(t[0], t[1], this_rewriter); }


  // [578] ==: (Trans -> Trans_name) # (Trans -> Trans_name) -> Bool
  static inline const data_expression& rewr_578_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bfc770);
  }

  static inline data_expression rewr_578_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_578_0(this_rewriter); }

  static inline data_expression rewr_578_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_578_0(this_rewriter); }


  // [569] if: Bool # (Bool -> Bool) # (Bool -> Bool) -> Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_569_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b303c0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_569_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_569_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_569_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_569_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [569] if: Bool # (Bool -> Bool) # (Bool -> Bool) -> Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_569_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b303c0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_569_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_569_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_569_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_569_3(t[0], t[1], t[2], this_rewriter); }


  // [569] if: Bool # (Bool -> Bool) # (Bool -> Bool) -> Bool -> Bool
  static inline const data_expression& rewr_569_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c243e0);
  }

  static inline data_expression rewr_569_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_569_0(this_rewriter); }

  static inline data_expression rewr_569_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_569_0(this_rewriter); }


  // [568] !=: (Bool -> Bool) # (Bool -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_568_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_567_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b30390))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_568_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_568_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_568_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_568_2(t[0], t[1], this_rewriter); }


  // [568] !=: (Bool -> Bool) # (Bool -> Bool) -> Bool
  static inline const data_expression& rewr_568_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bfc840);
  }

  static inline data_expression rewr_568_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_568_0(this_rewriter); }

  static inline data_expression rewr_568_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_568_0(this_rewriter); }


  // [567] ==: (Bool -> Bool) # (Bool -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_567_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Bool. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(11), rewr_403_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(10))), this_rewriter), delayed_application1<data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(10)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Bool. @var_0(x1) == @var_1(x1)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b30360))), arg0, arg1);
  }

  static inline data_expression rewr_567_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_567_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_567_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_567_2(t[0], t[1], this_rewriter); }


  // [567] ==: (Bool -> Bool) # (Bool -> Bool) -> Bool
  static inline const data_expression& rewr_567_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c62420);
  }

  static inline data_expression rewr_567_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_567_0(this_rewriter); }

  static inline data_expression rewr_567_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_567_0(this_rewriter); }


  // [556] if: Bool # (Bool # Bool # Bool -> Bool) # (Bool # Bool # Bool -> Bool) -> Bool # Bool # Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4, class DATA_EXPR5>
  static inline data_expression rewr_556_6(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, const DATA_EXPR5& arg_not_nf5, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_1(@var_2, @var_3, @var_4)))))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_0(@var_2, @var_3, @var_4)))))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter), local_rewrite(var_4, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3, @var_4)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2fcd0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter), local_rewrite(arg_not_nf5,this_rewriter));
  }

  static inline data_expression rewr_556_6_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_556_6(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_556_6_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_556_6(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], t[2], this_rewriter); }


  // [556] if: Bool # (Bool # Bool # Bool -> Bool) # (Bool # Bool # Bool -> Bool) -> Bool # Bool # Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_556_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2fcd0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_556_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_556_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_556_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_556_3(t[0], t[1], t[2], this_rewriter); }


  // [556] if: Bool # (Bool # Bool # Bool -> Bool) # (Bool # Bool # Bool -> Bool) -> Bool # Bool # Bool -> Bool
  static inline const data_expression& rewr_556_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c242c0);
  }

  static inline data_expression rewr_556_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_556_0(this_rewriter); }

  static inline data_expression rewr_556_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_556_0(this_rewriter); }


  // [555] !=: (Bool # Bool # Bool -> Bool) # (Bool # Bool # Bool -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_555_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_554_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2fca0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_555_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_555_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_555_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_555_2(t[0], t[1], this_rewriter); }


  // [555] !=: (Bool # Bool # Bool -> Bool) # (Bool # Bool # Bool -> Bool) -> Bool
  static inline const data_expression& rewr_555_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b40050);
  }

  static inline data_expression rewr_555_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_555_0(this_rewriter); }

  static inline data_expression rewr_555_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_555_0(this_rewriter); }


  // [554] ==: (Bool # Bool # Bool -> Bool) # (Bool # Bool # Bool -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_554_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x2,x5: Bool. @var_0(x1, x2, x5) == @var_1(x1, x2, x5)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(12), rewr_403_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(10)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(16)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(17))), this_rewriter), delayed_application3<data_expression,data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(10)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(16)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(17)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x2,x5: Bool. @var_0(x1, x2, x5) == @var_1(x1, x2, x5)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2fc70))), arg0, arg1);
  }

  static inline data_expression rewr_554_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_554_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_554_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_554_2(t[0], t[1], this_rewriter); }


  // [554] ==: (Bool # Bool # Bool -> Bool) # (Bool # Bool # Bool -> Bool) -> Bool
  static inline const data_expression& rewr_554_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b3fbf0);
  }

  static inline data_expression rewr_554_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_554_0(this_rewriter); }

  static inline data_expression rewr_554_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_554_0(this_rewriter); }


  // [549] if: Bool # (Pos # Pos -> Bool) # (Pos # Pos -> Bool) -> Pos # Pos -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_549_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2f820))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_549_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_549_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_549_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_549_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [549] if: Bool # (Pos # Pos -> Bool) # (Pos # Pos -> Bool) -> Pos # Pos -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_549_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2f820))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_549_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_549_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_549_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_549_3(t[0], t[1], t[2], this_rewriter); }


  // [549] if: Bool # (Pos # Pos -> Bool) # (Pos # Pos -> Bool) -> Pos # Pos -> Bool
  static inline const data_expression& rewr_549_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bfc160);
  }

  static inline data_expression rewr_549_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_549_0(this_rewriter); }

  static inline data_expression rewr_549_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_549_0(this_rewriter); }


  // [548] !=: (Pos # Pos -> Bool) # (Pos # Pos -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_548_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_547_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2f7f0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_548_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_548_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_548_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_548_2(t[0], t[1], this_rewriter); }


  // [548] !=: (Pos # Pos -> Bool) # (Pos # Pos -> Bool) -> Bool
  static inline const data_expression& rewr_548_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b3fff0);
  }

  static inline data_expression rewr_548_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_548_0(this_rewriter); }

  static inline data_expression rewr_548_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_548_0(this_rewriter); }


  // [547] ==: (Pos # Pos -> Bool) # (Pos # Pos -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_547_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: Pos. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(13), rewr_403_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(2)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(7))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(2)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(7)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: Pos. @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2f7c0))), arg0, arg1);
  }

  static inline data_expression rewr_547_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_547_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_547_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_547_2(t[0], t[1], this_rewriter); }


  // [547] ==: (Pos # Pos -> Bool) # (Pos # Pos -> Bool) -> Bool
  static inline const data_expression& rewr_547_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c61d90);
  }

  static inline data_expression rewr_547_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_547_0(this_rewriter); }

  static inline data_expression rewr_547_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_547_0(this_rewriter); }


  // [542] if: Bool # (Trans # Trans -> Bool) # (Trans # Trans -> Bool) -> Trans # Trans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_542_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2f370))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_542_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_542_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_542_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_542_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [542] if: Bool # (Trans # Trans -> Bool) # (Trans # Trans -> Bool) -> Trans # Trans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_542_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2f370))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_542_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_542_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_542_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_542_3(t[0], t[1], t[2], this_rewriter); }


  // [542] if: Bool # (Trans # Trans -> Bool) # (Trans # Trans -> Bool) -> Trans # Trans -> Bool
  static inline const data_expression& rewr_542_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c20020);
  }

  static inline data_expression rewr_542_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_542_0(this_rewriter); }

  static inline data_expression rewr_542_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_542_0(this_rewriter); }


  // [541] !=: (Trans # Trans -> Bool) # (Trans # Trans -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_541_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_540_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2f340))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_541_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_541_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_541_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_541_2(t[0], t[1], this_rewriter); }


  // [541] !=: (Trans # Trans -> Bool) # (Trans # Trans -> Bool) -> Bool
  static inline const data_expression& rewr_541_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b409b0);
  }

  static inline data_expression rewr_541_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_541_0(this_rewriter); }

  static inline data_expression rewr_541_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_541_0(this_rewriter); }


  // [540] ==: (Trans # Trans -> Bool) # (Trans # Trans -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_540_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: Trans. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(14), rewr_403_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(15)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(18))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(15)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(18)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: Trans. @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2f310))), arg0, arg1);
  }

  static inline data_expression rewr_540_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_540_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_540_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_540_2(t[0], t[1], this_rewriter); }


  // [540] ==: (Trans # Trans -> Bool) # (Trans # Trans -> Bool) -> Bool
  static inline const data_expression& rewr_540_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b40980);
  }

  static inline data_expression rewr_540_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_540_0(this_rewriter); }

  static inline data_expression rewr_540_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_540_0(this_rewriter); }


  // [535] if: Bool # (Bool # Pos -> Pos) # (Bool # Pos -> Pos) -> Bool # Pos -> Pos
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_535_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2ee90))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_535_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_535_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_535_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_535_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [535] if: Bool # (Bool # Pos -> Pos) # (Bool # Pos -> Pos) -> Bool # Pos -> Pos
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_535_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2ee90))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_535_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_535_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_535_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_535_3(t[0], t[1], t[2], this_rewriter); }


  // [535] if: Bool # (Bool # Pos -> Pos) # (Bool # Pos -> Pos) -> Bool # Pos -> Pos
  static inline const data_expression& rewr_535_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c61b80);
  }

  static inline data_expression rewr_535_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_535_0(this_rewriter); }

  static inline data_expression rewr_535_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_535_0(this_rewriter); }


  // [534] !=: (Bool # Pos -> Pos) # (Bool # Pos -> Pos) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_534_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_533_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2ee60))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_534_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_534_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_534_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_534_2(t[0], t[1], this_rewriter); }


  // [534] !=: (Bool # Pos -> Pos) # (Bool # Pos -> Pos) -> Bool
  static inline const data_expression& rewr_534_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c20100);
  }

  static inline data_expression rewr_534_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_534_0(this_rewriter); }

  static inline data_expression rewr_534_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_534_0(this_rewriter); }


  // [533] ==: (Bool # Pos -> Pos) # (Bool # Pos -> Pos) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_533_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Bool, x3: Pos. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(15), rewr_83_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(10)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(7))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(10)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(7))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Bool, x3: Pos. @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2ee30))), arg0, arg1);
  }

  static inline data_expression rewr_533_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_533_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_533_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_533_2(t[0], t[1], this_rewriter); }


  // [533] ==: (Bool # Pos -> Pos) # (Bool # Pos -> Pos) -> Bool
  static inline const data_expression& rewr_533_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b400b0);
  }

  static inline data_expression rewr_533_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_533_0(this_rewriter); }

  static inline data_expression rewr_533_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_533_0(this_rewriter); }


  // [528] if: Bool # (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) # (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) -> Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4, class DATA_EXPR5, class DATA_EXPR6>
  static inline data_expression rewr_528_7(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, const DATA_EXPR5& arg_not_nf5, const DATA_EXPR6& arg_not_nf6, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@N(@@S(@var_5, @@R(@var_1(@var_2, @var_3, @var_4)(@var_5)))))))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@N(@@S(@var_5, @@R(@var_0(@var_2, @var_3, @var_4)(@var_5)))))))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
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
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2e9e0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter), local_rewrite(arg_not_nf5,this_rewriter)), local_rewrite(arg_not_nf6,this_rewriter));
  }

  static inline data_expression rewr_528_7_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_528_7(term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[2], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_528_7_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_528_7(down_cast<application>(down_cast<application>(t.head()).head())[0], down_cast<application>(down_cast<application>(t.head()).head())[1], down_cast<application>(down_cast<application>(t.head()).head())[2], down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [528] if: Bool # (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) # (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) -> Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4, class DATA_EXPR5>
  static inline data_expression rewr_528_6(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, const DATA_EXPR5& arg_not_nf5, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_1(@var_2, @var_3, @var_4)))))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_0(@var_2, @var_3, @var_4)))))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter), local_rewrite(var_4, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3, @var_4)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2e9e0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter), local_rewrite(arg_not_nf5,this_rewriter));
  }

  static inline data_expression rewr_528_6_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_528_6(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_528_6_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_528_6(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], t[2], this_rewriter); }


  // [528] if: Bool # (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) # (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) -> Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_528_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2e9e0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_528_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_528_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_528_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_528_3(t[0], t[1], t[2], this_rewriter); }


  // [528] if: Bool # (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) # (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) -> Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)
  static inline const data_expression& rewr_528_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b3fab0);
  }

  static inline data_expression rewr_528_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_528_0(this_rewriter); }

  static inline data_expression rewr_528_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_528_0(this_rewriter); }


  // [527] !=: (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) # (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_527_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_526_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2e9b0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_527_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_527_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_527_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_527_2(t[0], t[1], this_rewriter); }


  // [527] !=: (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) # (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_527_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b10e10);
  }

  static inline data_expression rewr_527_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_527_0(this_rewriter); }

  static inline data_expression rewr_527_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_527_0(this_rewriter); }


  // [526] ==: (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) # (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_526_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Bool, x2,x5: Place -> List(Nat). @var_0(x1, x2, x5) == @var_1(x1, x2, x5)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(16), rewr_316_2(delayed_application3<data_expression,data_expression,data_expression,data_expression>(local_rewrite(var_0, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(10)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(19)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(20)), this_rewriter), delayed_application3<data_expression,data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(10)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(19)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(20)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Bool, x2,x5: Place -> List(Nat). @var_0(x1, x2, x5) == @var_1(x1, x2, x5)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2e980))), arg0, arg1);
  }

  static inline data_expression rewr_526_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_526_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_526_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_526_2(t[0], t[1], this_rewriter); }


  // [526] ==: (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) # (Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_526_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b10ce0);
  }

  static inline data_expression rewr_526_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_526_0(this_rewriter); }

  static inline data_expression rewr_526_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_526_0(this_rewriter); }


  // [521] if: Bool # (Nat # List(Nat) -> List(Nat)) # (Nat # List(Nat) -> List(Nat)) -> Nat # List(Nat) -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_521_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2e530))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_521_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_521_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_521_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_521_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [521] if: Bool # (Nat # List(Nat) -> List(Nat)) # (Nat # List(Nat) -> List(Nat)) -> Nat # List(Nat) -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_521_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2e530))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_521_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_521_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_521_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_521_3(t[0], t[1], t[2], this_rewriter); }


  // [521] if: Bool # (Nat # List(Nat) -> List(Nat)) # (Nat # List(Nat) -> List(Nat)) -> Nat # List(Nat) -> List(Nat)
  static inline const data_expression& rewr_521_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b403e0);
  }

  static inline data_expression rewr_521_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_521_0(this_rewriter); }

  static inline data_expression rewr_521_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_521_0(this_rewriter); }


  // [520] !=: (Nat # List(Nat) -> List(Nat)) # (Nat # List(Nat) -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_520_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_519_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2e500))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_520_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_520_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_520_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_520_2(t[0], t[1], this_rewriter); }


  // [520] !=: (Nat # List(Nat) -> List(Nat)) # (Nat # List(Nat) -> List(Nat)) -> Bool
  static inline const data_expression& rewr_520_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b11190);
  }

  static inline data_expression rewr_520_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_520_0(this_rewriter); }

  static inline data_expression rewr_520_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_520_0(this_rewriter); }


  // [519] ==: (Nat # List(Nat) -> List(Nat)) # (Nat # List(Nat) -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_519_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Nat, x3: List(Nat). @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(8), rewr_90_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(3)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(13))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(3)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(13))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Nat, x3: List(Nat). @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2e4d0))), arg0, arg1);
  }

  static inline data_expression rewr_519_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_519_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_519_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_519_2(t[0], t[1], this_rewriter); }


  // [519] ==: (Nat # List(Nat) -> List(Nat)) # (Nat # List(Nat) -> List(Nat)) -> Bool
  static inline const data_expression& rewr_519_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bfba30);
  }

  static inline data_expression rewr_519_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_519_0(this_rewriter); }

  static inline data_expression rewr_519_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_519_0(this_rewriter); }


  // [514] if: Bool # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) -> (Place -> List(Nat)) # Trans -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4, class DATA_EXPR5>
  static inline data_expression rewr_514_6(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, const DATA_EXPR5& arg_not_nf5, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_1(@var_2, @var_3)(@var_4)))))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_0(@var_2, @var_3)(@var_4)))))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
        return rewrite_with_arguments_in_normal_form(application(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), local_rewrite(var_4, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)(@var_4)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2e080))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter)), local_rewrite(arg_not_nf5,this_rewriter));
  }

  static inline data_expression rewr_514_6_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_514_6(term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[2], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_514_6_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_514_6(down_cast<application>(down_cast<application>(t.head()).head())[0], down_cast<application>(down_cast<application>(t.head()).head())[1], down_cast<application>(down_cast<application>(t.head()).head())[2], down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], t[0], this_rewriter); }


  // [514] if: Bool # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) -> (Place -> List(Nat)) # Trans -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_514_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2e080))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_514_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_514_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_514_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_514_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [514] if: Bool # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) -> (Place -> List(Nat)) # Trans -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_514_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2e080))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_514_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_514_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_514_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_514_3(t[0], t[1], t[2], this_rewriter); }


  // [514] if: Bool # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) -> (Place -> List(Nat)) # Trans -> Place -> List(Nat)
  static inline const data_expression& rewr_514_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b10c50);
  }

  static inline data_expression rewr_514_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_514_0(this_rewriter); }

  static inline data_expression rewr_514_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_514_0(this_rewriter); }


  // [513] !=: ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_513_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_512_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2e050))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_513_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_513_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_513_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_513_2(t[0], t[1], this_rewriter); }


  // [513] !=: ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_513_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c61200);
  }

  static inline data_expression rewr_513_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_513_0(this_rewriter); }

  static inline data_expression rewr_513_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_513_0(this_rewriter); }


  // [512] ==: ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_512_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Place -> List(Nat), x3: Trans. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(17), rewr_316_2(delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_0, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(18)), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(18)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Place -> List(Nat), x3: Trans. @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2e020))), arg0, arg1);
  }

  static inline data_expression rewr_512_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_512_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_512_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_512_2(t[0], t[1], this_rewriter); }


  // [512] ==: ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_512_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b3fcf0);
  }

  static inline data_expression rewr_512_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_512_0(this_rewriter); }

  static inline data_expression rewr_512_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_512_0(this_rewriter); }


  // [507] if: Bool # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) -> PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_507_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2dbd0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_507_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_507_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_507_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_507_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [507] if: Bool # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) -> PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_507_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2dbd0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_507_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_507_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_507_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_507_3(t[0], t[1], t[2], this_rewriter); }


  // [507] if: Bool # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) -> PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)
  static inline const data_expression& rewr_507_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b3fe70);
  }

  static inline data_expression rewr_507_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_507_0(this_rewriter); }

  static inline data_expression rewr_507_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_507_0(this_rewriter); }


  // [506] !=: (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_506_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_505_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2dba0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_506_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_506_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_506_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_506_2(t[0], t[1], this_rewriter); }


  // [506] !=: (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) -> Bool
  static inline const data_expression& rewr_506_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c611d0);
  }

  static inline data_expression rewr_506_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_506_0(this_rewriter); }

  static inline data_expression rewr_506_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_506_0(this_rewriter); }


  // [505] ==: (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_505_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: PlaceTokens, x3: List(PlaceTokens). @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(18), rewr_268_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(21)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(22))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(21)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(22))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: PlaceTokens, x3: List(PlaceTokens). @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2db70))), arg0, arg1);
  }

  static inline data_expression rewr_505_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_505_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_505_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_505_2(t[0], t[1], this_rewriter); }


  // [505] ==: (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) -> Bool
  static inline const data_expression& rewr_505_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b3fde0);
  }

  static inline data_expression rewr_505_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_505_0(this_rewriter); }

  static inline data_expression rewr_505_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_505_0(this_rewriter); }


  // [500] if: Bool # (List(Nat) # List(Nat) -> List(Nat)) # (List(Nat) # List(Nat) -> List(Nat)) -> List(Nat) # List(Nat) -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_500_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2d720))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_500_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_500_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_500_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_500_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [500] if: Bool # (List(Nat) # List(Nat) -> List(Nat)) # (List(Nat) # List(Nat) -> List(Nat)) -> List(Nat) # List(Nat) -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_500_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2d720))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_500_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_500_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_500_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_500_3(t[0], t[1], t[2], this_rewriter); }


  // [500] if: Bool # (List(Nat) # List(Nat) -> List(Nat)) # (List(Nat) # List(Nat) -> List(Nat)) -> List(Nat) # List(Nat) -> List(Nat)
  static inline const data_expression& rewr_500_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b10f80);
  }

  static inline data_expression rewr_500_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_500_0(this_rewriter); }

  static inline data_expression rewr_500_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_500_0(this_rewriter); }


  // [499] !=: (List(Nat) # List(Nat) -> List(Nat)) # (List(Nat) # List(Nat) -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_499_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_498_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2d6f0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_499_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_499_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_499_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_499_2(t[0], t[1], this_rewriter); }


  // [499] !=: (List(Nat) # List(Nat) -> List(Nat)) # (List(Nat) # List(Nat) -> List(Nat)) -> Bool
  static inline const data_expression& rewr_499_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b11130);
  }

  static inline data_expression rewr_499_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_499_0(this_rewriter); }

  static inline data_expression rewr_499_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_499_0(this_rewriter); }


  // [498] ==: (List(Nat) # List(Nat) -> List(Nat)) # (List(Nat) # List(Nat) -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_498_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: List(Nat). @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(19), rewr_90_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(23)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(13))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(23)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(13))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: List(Nat). @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2d6c0))), arg0, arg1);
  }

  static inline data_expression rewr_498_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_498_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_498_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_498_2(t[0], t[1], this_rewriter); }


  // [498] ==: (List(Nat) # List(Nat) -> List(Nat)) # (List(Nat) # List(Nat) -> List(Nat)) -> Bool
  static inline const data_expression& rewr_498_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c67170);
  }

  static inline data_expression rewr_498_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_498_0(this_rewriter); }

  static inline data_expression rewr_498_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_498_0(this_rewriter); }


  // [493] if: Bool # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) -> (Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4, class DATA_EXPR5>
  static inline data_expression rewr_493_6(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, const DATA_EXPR5& arg_not_nf5, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_1(@var_2, @var_3)(@var_4)))))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_0(@var_2, @var_3)(@var_4)))))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
        return rewrite_with_arguments_in_normal_form(application(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), local_rewrite(var_4, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)(@var_4)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2d270))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter)), local_rewrite(arg_not_nf5,this_rewriter));
  }

  static inline data_expression rewr_493_6_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_493_6(term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[2], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_493_6_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_493_6(down_cast<application>(down_cast<application>(t.head()).head())[0], down_cast<application>(down_cast<application>(t.head()).head())[1], down_cast<application>(down_cast<application>(t.head()).head())[2], down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], t[0], this_rewriter); }


  // [493] if: Bool # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) -> (Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_493_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2d270))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_493_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_493_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_493_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_493_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [493] if: Bool # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) -> (Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_493_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2d270))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_493_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_493_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_493_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_493_3(t[0], t[1], t[2], this_rewriter); }


  // [493] if: Bool # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) -> (Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)
  static inline const data_expression& rewr_493_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bfdcf0);
  }

  static inline data_expression rewr_493_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_493_0(this_rewriter); }

  static inline data_expression rewr_493_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_493_0(this_rewriter); }


  // [492] !=: ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_492_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_491_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2d240))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_492_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_492_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_492_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_492_2(t[0], t[1], this_rewriter); }


  // [492] !=: ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_492_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c30340);
  }

  static inline data_expression rewr_492_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_492_0(this_rewriter); }

  static inline data_expression rewr_492_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_492_0(this_rewriter); }


  // [491] ==: ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_491_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Place -> List(Nat), x3: List(PlaceTokens). @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(20), rewr_316_2(delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_0, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(22)), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(22)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Place -> List(Nat), x3: List(PlaceTokens). @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2d210))), arg0, arg1);
  }

  static inline data_expression rewr_491_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_491_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_491_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_491_2(t[0], t[1], this_rewriter); }


  // [491] ==: ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_491_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b40680);
  }

  static inline data_expression rewr_491_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_491_0(this_rewriter); }

  static inline data_expression rewr_491_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_491_0(this_rewriter); }


  // [486] if: Bool # (Trans # List(Trans) -> Bool) # (Trans # List(Trans) -> Bool) -> Trans # List(Trans) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_486_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2cd90))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_486_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_486_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_486_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_486_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [486] if: Bool # (Trans # List(Trans) -> Bool) # (Trans # List(Trans) -> Bool) -> Trans # List(Trans) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_486_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2cd90))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_486_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_486_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_486_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_486_3(t[0], t[1], t[2], this_rewriter); }


  // [486] if: Bool # (Trans # List(Trans) -> Bool) # (Trans # List(Trans) -> Bool) -> Trans # List(Trans) -> Bool
  static inline const data_expression& rewr_486_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b40570);
  }

  static inline data_expression rewr_486_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_486_0(this_rewriter); }

  static inline data_expression rewr_486_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_486_0(this_rewriter); }


  // [485] !=: (Trans # List(Trans) -> Bool) # (Trans # List(Trans) -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_485_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_484_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2cd60))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_485_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_485_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_485_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_485_2(t[0], t[1], this_rewriter); }


  // [485] !=: (Trans # List(Trans) -> Bool) # (Trans # List(Trans) -> Bool) -> Bool
  static inline const data_expression& rewr_485_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c2fe10);
  }

  static inline data_expression rewr_485_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_485_0(this_rewriter); }

  static inline data_expression rewr_485_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_485_0(this_rewriter); }


  // [484] ==: (Trans # List(Trans) -> Bool) # (Trans # List(Trans) -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_484_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Trans, x3: List(Trans). @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(21), rewr_403_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(15)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(24))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(15)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(24)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Trans, x3: List(Trans). @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2cd30))), arg0, arg1);
  }

  static inline data_expression rewr_484_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_484_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_484_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_484_2(t[0], t[1], this_rewriter); }


  // [484] ==: (Trans # List(Trans) -> Bool) # (Trans # List(Trans) -> Bool) -> Bool
  static inline const data_expression& rewr_484_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c2ffa0);
  }

  static inline data_expression rewr_484_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_484_0(this_rewriter); }

  static inline data_expression rewr_484_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_484_0(this_rewriter); }


  // [479] if: Bool # (Trans -> Nat) # (Trans -> Nat) -> Trans -> Nat
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_479_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2c970))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_479_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_479_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_479_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_479_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [479] if: Bool # (Trans -> Nat) # (Trans -> Nat) -> Trans -> Nat
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_479_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2c970))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_479_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_479_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_479_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_479_3(t[0], t[1], t[2], this_rewriter); }


  // [479] if: Bool # (Trans -> Nat) # (Trans -> Nat) -> Trans -> Nat
  static inline const data_expression& rewr_479_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c2ff40);
  }

  static inline data_expression rewr_479_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_479_0(this_rewriter); }

  static inline data_expression rewr_479_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_479_0(this_rewriter); }


  // [478] !=: (Trans -> Nat) # (Trans -> Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_478_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_477_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2c940))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_478_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_478_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_478_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_478_2(t[0], t[1], this_rewriter); }


  // [478] !=: (Trans -> Nat) # (Trans -> Nat) -> Bool
  static inline const data_expression& rewr_478_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c2fd20);
  }

  static inline data_expression rewr_478_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_478_0(this_rewriter); }

  static inline data_expression rewr_478_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_478_0(this_rewriter); }


  // [477] ==: (Trans -> Nat) # (Trans -> Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_477_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Trans. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(10), rewr_35_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(15))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(15))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Trans. @var_0(x1) == @var_1(x1)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2c910))), arg0, arg1);
  }

  static inline data_expression rewr_477_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_477_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_477_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_477_2(t[0], t[1], this_rewriter); }


  // [477] ==: (Trans -> Nat) # (Trans -> Nat) -> Bool
  static inline const data_expression& rewr_477_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c30480);
  }

  static inline data_expression rewr_477_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_477_0(this_rewriter); }

  static inline data_expression rewr_477_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_477_0(this_rewriter); }


  // [468] if: Bool # ((Place -> List(Nat)) # Trans -> Bool) # ((Place -> List(Nat)) # Trans -> Bool) -> (Place -> List(Nat)) # Trans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_468_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2c3a0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_468_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_468_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_468_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_468_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [468] if: Bool # ((Place -> List(Nat)) # Trans -> Bool) # ((Place -> List(Nat)) # Trans -> Bool) -> (Place -> List(Nat)) # Trans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_468_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2c3a0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_468_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_468_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_468_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_468_3(t[0], t[1], t[2], this_rewriter); }


  // [468] if: Bool # ((Place -> List(Nat)) # Trans -> Bool) # ((Place -> List(Nat)) # Trans -> Bool) -> (Place -> List(Nat)) # Trans -> Bool
  static inline const data_expression& rewr_468_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c2fcf0);
  }

  static inline data_expression rewr_468_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_468_0(this_rewriter); }

  static inline data_expression rewr_468_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_468_0(this_rewriter); }


  // [467] !=: ((Place -> List(Nat)) # Trans -> Bool) # ((Place -> List(Nat)) # Trans -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_467_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_466_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2c370))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_467_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_467_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_467_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_467_2(t[0], t[1], this_rewriter); }


  // [467] !=: ((Place -> List(Nat)) # Trans -> Bool) # ((Place -> List(Nat)) # Trans -> Bool) -> Bool
  static inline const data_expression& rewr_467_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c30450);
  }

  static inline data_expression rewr_467_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_467_0(this_rewriter); }

  static inline data_expression rewr_467_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_467_0(this_rewriter); }


  // [466] ==: ((Place -> List(Nat)) # Trans -> Bool) # ((Place -> List(Nat)) # Trans -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_466_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Place -> List(Nat), x3: Trans. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(17), rewr_403_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(18))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(18)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Place -> List(Nat), x3: Trans. @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2c340))), arg0, arg1);
  }

  static inline data_expression rewr_466_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_466_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_466_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_466_2(t[0], t[1], this_rewriter); }


  // [466] ==: ((Place -> List(Nat)) # Trans -> Bool) # ((Place -> List(Nat)) # Trans -> Bool) -> Bool
  static inline const data_expression& rewr_466_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c2fc00);
  }

  static inline data_expression rewr_466_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_466_0(this_rewriter); }

  static inline data_expression rewr_466_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_466_0(this_rewriter); }


  // [461] if: Bool # (Bool # Bool -> Bool) # (Bool # Bool -> Bool) -> Bool # Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_461_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2bec0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_461_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_461_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_461_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_461_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [461] if: Bool # (Bool # Bool -> Bool) # (Bool # Bool -> Bool) -> Bool # Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_461_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2bec0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_461_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_461_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_461_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_461_3(t[0], t[1], t[2], this_rewriter); }


  // [461] if: Bool # (Bool # Bool -> Bool) # (Bool # Bool -> Bool) -> Bool # Bool -> Bool
  static inline const data_expression& rewr_461_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c30630);
  }

  static inline data_expression rewr_461_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_461_0(this_rewriter); }

  static inline data_expression rewr_461_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_461_0(this_rewriter); }


  // [460] !=: (Bool # Bool -> Bool) # (Bool # Bool -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_460_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_459_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2be90))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_460_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_460_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_460_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_460_2(t[0], t[1], this_rewriter); }


  // [460] !=: (Bool # Bool -> Bool) # (Bool # Bool -> Bool) -> Bool
  static inline const data_expression& rewr_460_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c2fc30);
  }

  static inline data_expression rewr_460_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_460_0(this_rewriter); }

  static inline data_expression rewr_460_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_460_0(this_rewriter); }


  // [459] ==: (Bool # Bool -> Bool) # (Bool # Bool -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_459_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: Bool. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(22), rewr_403_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(10)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(25))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(10)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(25)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: Bool. @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2be60))), arg0, arg1);
  }

  static inline data_expression rewr_459_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_459_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_459_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_459_2(t[0], t[1], this_rewriter); }


  // [459] ==: (Bool # Bool -> Bool) # (Bool # Bool -> Bool) -> Bool
  static inline const data_expression& rewr_459_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b406b0);
  }

  static inline data_expression rewr_459_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_459_0(this_rewriter); }

  static inline data_expression rewr_459_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_459_0(this_rewriter); }


  // [454] if: Bool # (PlaceTokens # List(PlaceTokens) -> Bool) # (PlaceTokens # List(PlaceTokens) -> Bool) -> PlaceTokens # List(PlaceTokens) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_454_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2b9e0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_454_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_454_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_454_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_454_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [454] if: Bool # (PlaceTokens # List(PlaceTokens) -> Bool) # (PlaceTokens # List(PlaceTokens) -> Bool) -> PlaceTokens # List(PlaceTokens) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_454_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2b9e0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_454_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_454_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_454_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_454_3(t[0], t[1], t[2], this_rewriter); }


  // [454] if: Bool # (PlaceTokens # List(PlaceTokens) -> Bool) # (PlaceTokens # List(PlaceTokens) -> Bool) -> PlaceTokens # List(PlaceTokens) -> Bool
  static inline const data_expression& rewr_454_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c66c30);
  }

  static inline data_expression rewr_454_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_454_0(this_rewriter); }

  static inline data_expression rewr_454_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_454_0(this_rewriter); }


  // [453] !=: (PlaceTokens # List(PlaceTokens) -> Bool) # (PlaceTokens # List(PlaceTokens) -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_453_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_452_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2b9b0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_453_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_453_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_453_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_453_2(t[0], t[1], this_rewriter); }


  // [453] !=: (PlaceTokens # List(PlaceTokens) -> Bool) # (PlaceTokens # List(PlaceTokens) -> Bool) -> Bool
  static inline const data_expression& rewr_453_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c30370);
  }

  static inline data_expression rewr_453_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_453_0(this_rewriter); }

  static inline data_expression rewr_453_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_453_0(this_rewriter); }


  // [452] ==: (PlaceTokens # List(PlaceTokens) -> Bool) # (PlaceTokens # List(PlaceTokens) -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_452_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: PlaceTokens, x3: List(PlaceTokens). @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(18), rewr_403_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(21)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(22))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(21)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(22)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: PlaceTokens, x3: List(PlaceTokens). @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2b980))), arg0, arg1);
  }

  static inline data_expression rewr_452_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_452_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_452_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_452_2(t[0], t[1], this_rewriter); }


  // [452] ==: (PlaceTokens # List(PlaceTokens) -> Bool) # (PlaceTokens # List(PlaceTokens) -> Bool) -> Bool
  static inline const data_expression& rewr_452_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c66cc0);
  }

  static inline data_expression rewr_452_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_452_0(this_rewriter); }

  static inline data_expression rewr_452_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_452_0(this_rewriter); }


  // [447] if: Bool # (Trans -> List(PlaceTokens)) # (Trans -> List(PlaceTokens)) -> Trans -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_447_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2b5c0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_447_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_447_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_447_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_447_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [447] if: Bool # (Trans -> List(PlaceTokens)) # (Trans -> List(PlaceTokens)) -> Trans -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_447_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2b5c0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_447_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_447_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_447_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_447_3(t[0], t[1], t[2], this_rewriter); }


  // [447] if: Bool # (Trans -> List(PlaceTokens)) # (Trans -> List(PlaceTokens)) -> Trans -> List(PlaceTokens)
  static inline const data_expression& rewr_447_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c66cf0);
  }

  static inline data_expression rewr_447_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_447_0(this_rewriter); }

  static inline data_expression rewr_447_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_447_0(this_rewriter); }


  // [446] !=: (Trans -> List(PlaceTokens)) # (Trans -> List(PlaceTokens)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_446_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_445_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2b590))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_446_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_446_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_446_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_446_2(t[0], t[1], this_rewriter); }


  // [446] !=: (Trans -> List(PlaceTokens)) # (Trans -> List(PlaceTokens)) -> Bool
  static inline const data_expression& rewr_446_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c30b00);
  }

  static inline data_expression rewr_446_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_446_0(this_rewriter); }

  static inline data_expression rewr_446_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_446_0(this_rewriter); }


  // [445] ==: (Trans -> List(PlaceTokens)) # (Trans -> List(PlaceTokens)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_445_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Trans. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(10), rewr_268_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(15))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(15))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Trans. @var_0(x1) == @var_1(x1)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2b560))), arg0, arg1);
  }

  static inline data_expression rewr_445_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_445_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_445_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_445_2(t[0], t[1], this_rewriter); }


  // [445] ==: (Trans -> List(PlaceTokens)) # (Trans -> List(PlaceTokens)) -> Bool
  static inline const data_expression& rewr_445_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c30510);
  }

  static inline data_expression rewr_445_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_445_0(this_rewriter); }

  static inline data_expression rewr_445_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_445_0(this_rewriter); }


  // [436] if: Bool # (List(Nat) # List(Nat) -> Bool) # (List(Nat) # List(Nat) -> Bool) -> List(Nat) # List(Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_436_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2aff0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_436_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_436_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_436_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_436_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [436] if: Bool # (List(Nat) # List(Nat) -> Bool) # (List(Nat) # List(Nat) -> Bool) -> List(Nat) # List(Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_436_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2aff0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_436_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_436_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_436_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_436_3(t[0], t[1], t[2], this_rewriter); }


  // [436] if: Bool # (List(Nat) # List(Nat) -> Bool) # (List(Nat) # List(Nat) -> Bool) -> List(Nat) # List(Nat) -> Bool
  static inline const data_expression& rewr_436_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c30c20);
  }

  static inline data_expression rewr_436_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_436_0(this_rewriter); }

  static inline data_expression rewr_436_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_436_0(this_rewriter); }


  // [435] !=: (List(Nat) # List(Nat) -> Bool) # (List(Nat) # List(Nat) -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_435_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_434_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2afc0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_435_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_435_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_435_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_435_2(t[0], t[1], this_rewriter); }


  // [435] !=: (List(Nat) # List(Nat) -> Bool) # (List(Nat) # List(Nat) -> Bool) -> Bool
  static inline const data_expression& rewr_435_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf9b60);
  }

  static inline data_expression rewr_435_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_435_0(this_rewriter); }

  static inline data_expression rewr_435_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_435_0(this_rewriter); }


  // [434] ==: (List(Nat) # List(Nat) -> Bool) # (List(Nat) # List(Nat) -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_434_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: List(Nat). @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(19), rewr_403_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(23)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(13))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(23)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(13)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: List(Nat). @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2af90))), arg0, arg1);
  }

  static inline data_expression rewr_434_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_434_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_434_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_434_2(t[0], t[1], this_rewriter); }


  // [434] ==: (List(Nat) # List(Nat) -> Bool) # (List(Nat) # List(Nat) -> Bool) -> Bool
  static inline const data_expression& rewr_434_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c66c00);
  }

  static inline data_expression rewr_434_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_434_0(this_rewriter); }

  static inline data_expression rewr_434_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_434_0(this_rewriter); }


  // [429] if: Bool # (Trans -> Bool) # (Trans -> Bool) -> Trans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_429_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2abd0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_429_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_429_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_429_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_429_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [429] if: Bool # (Trans -> Bool) # (Trans -> Bool) -> Trans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_429_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2abd0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_429_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_429_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_429_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_429_3(t[0], t[1], t[2], this_rewriter); }


  // [429] if: Bool # (Trans -> Bool) # (Trans -> Bool) -> Trans -> Bool
  static inline const data_expression& rewr_429_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c30b30);
  }

  static inline data_expression rewr_429_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_429_0(this_rewriter); }

  static inline data_expression rewr_429_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_429_0(this_rewriter); }


  // [428] !=: (Trans -> Bool) # (Trans -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_428_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_427_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2aba0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_428_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_428_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_428_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_428_2(t[0], t[1], this_rewriter); }


  // [428] !=: (Trans -> Bool) # (Trans -> Bool) -> Bool
  static inline const data_expression& rewr_428_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b407d0);
  }

  static inline data_expression rewr_428_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_428_0(this_rewriter); }

  static inline data_expression rewr_428_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_428_0(this_rewriter); }


  // [427] ==: (Trans -> Bool) # (Trans -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_427_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Trans. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(10), rewr_403_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(15))), this_rewriter), delayed_application1<data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(15)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Trans. @var_0(x1) == @var_1(x1)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2ab70))), arg0, arg1);
  }

  static inline data_expression rewr_427_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_427_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_427_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_427_2(t[0], t[1], this_rewriter); }


  // [427] ==: (Trans -> Bool) # (Trans -> Bool) -> Bool
  static inline const data_expression& rewr_427_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b40710);
  }

  static inline data_expression rewr_427_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_427_0(this_rewriter); }

  static inline data_expression rewr_427_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_427_0(this_rewriter); }


  // [417] if: Bool # ((Place -> List(Nat)) -> List(Trans)) # ((Place -> List(Nat)) -> List(Trans)) -> (Place -> List(Nat)) -> List(Trans)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_417_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2a510))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_417_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_417_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_417_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_417_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [417] if: Bool # ((Place -> List(Nat)) -> List(Trans)) # ((Place -> List(Nat)) -> List(Trans)) -> (Place -> List(Nat)) -> List(Trans)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_417_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2a510))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_417_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_417_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_417_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_417_3(t[0], t[1], t[2], this_rewriter); }


  // [417] if: Bool # ((Place -> List(Nat)) -> List(Trans)) # ((Place -> List(Nat)) -> List(Trans)) -> (Place -> List(Nat)) -> List(Trans)
  static inline const data_expression& rewr_417_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8b407a0);
  }

  static inline data_expression rewr_417_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_417_0(this_rewriter); }

  static inline data_expression rewr_417_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_417_0(this_rewriter); }


  // [416] !=: ((Place -> List(Nat)) -> List(Trans)) # ((Place -> List(Nat)) -> List(Trans)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_416_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_415_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2a4e0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_416_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_416_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_416_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_416_2(t[0], t[1], this_rewriter); }


  // [416] !=: ((Place -> List(Nat)) -> List(Trans)) # ((Place -> List(Nat)) -> List(Trans)) -> Bool
  static inline const data_expression& rewr_416_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf93c0);
  }

  static inline data_expression rewr_416_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_416_0(this_rewriter); }

  static inline data_expression rewr_416_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_416_0(this_rewriter); }


  // [415] ==: ((Place -> List(Nat)) -> List(Trans)) # ((Place -> List(Nat)) -> List(Trans)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_415_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Place -> List(Nat). @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(23), rewr_287_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(0))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(0))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Place -> List(Nat). @var_0(x1) == @var_1(x1)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b2a4b0))), arg0, arg1);
  }

  static inline data_expression rewr_415_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_415_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_415_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_415_2(t[0], t[1], this_rewriter); }


  // [415] ==: ((Place -> List(Nat)) -> List(Trans)) # ((Place -> List(Nat)) -> List(Trans)) -> Bool
  static inline const data_expression& rewr_415_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf9300);
  }

  static inline data_expression rewr_415_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_415_0(this_rewriter); }

  static inline data_expression rewr_415_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_415_0(this_rewriter); }


  // [406] if: Bool # (Trans # Trans # Trans # Trans -> List(Trans)) # (Trans # Trans # Trans # Trans -> List(Trans)) -> Trans # Trans # Trans # Trans -> List(Trans)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4, class DATA_EXPR5, class DATA_EXPR6>
  static inline data_expression rewr_406_7(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, const DATA_EXPR5& arg_not_nf5, const DATA_EXPR6& arg_not_nf6, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@N(@@S(@var_5, @@R(@var_1(@var_2, @var_3, @var_4, @var_5)))))))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@N(@@S(@var_5, @@R(@var_0(@var_2, @var_3, @var_4, @var_5)))))))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
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
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b29e50))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter), local_rewrite(arg_not_nf5,this_rewriter), local_rewrite(arg_not_nf6,this_rewriter));
  }

  static inline data_expression rewr_406_7_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_406_7(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), term_not_in_normal_form(t[3], this_rewriter), this_rewriter); }

  static inline data_expression rewr_406_7_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_406_7(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], t[2], t[3], this_rewriter); }


  // [406] if: Bool # (Trans # Trans # Trans # Trans -> List(Trans)) # (Trans # Trans # Trans # Trans -> List(Trans)) -> Trans # Trans # Trans # Trans -> List(Trans)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_406_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b29e50))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_406_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_406_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_406_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_406_3(t[0], t[1], t[2], this_rewriter); }


  // [406] if: Bool # (Trans # Trans # Trans # Trans -> List(Trans)) # (Trans # Trans # Trans # Trans -> List(Trans)) -> Trans # Trans # Trans # Trans -> List(Trans)
  static inline const data_expression& rewr_406_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c30e60);
  }

  static inline data_expression rewr_406_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_406_0(this_rewriter); }

  static inline data_expression rewr_406_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_406_0(this_rewriter); }


  // [405] !=: (Trans # Trans # Trans # Trans -> List(Trans)) # (Trans # Trans # Trans # Trans -> List(Trans)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_405_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_404_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b29e20))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_405_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_405_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_405_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_405_2(t[0], t[1], this_rewriter); }


  // [405] !=: (Trans # Trans # Trans # Trans -> List(Trans)) # (Trans # Trans # Trans # Trans -> List(Trans)) -> Bool
  static inline const data_expression& rewr_405_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c31780);
  }

  static inline data_expression rewr_405_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_405_0(this_rewriter); }

  static inline data_expression rewr_405_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_405_0(this_rewriter); }


  // [404] ==: (Trans # Trans # Trans # Trans -> List(Trans)) # (Trans # Trans # Trans # Trans -> List(Trans)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_404_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x2,x3,x7: Trans. @var_0(x1, x2, x3, x7) == @var_1(x1, x2, x3, x7)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(24), rewr_287_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(15)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(26)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(18)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(27))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(15)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(26)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(18)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(27))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x2,x3,x7: Trans. @var_0(x1, x2, x3, x7) == @var_1(x1, x2, x3, x7)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b29df0))), arg0, arg1);
  }

  static inline data_expression rewr_404_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_404_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_404_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_404_2(t[0], t[1], this_rewriter); }


  // [404] ==: (Trans # Trans # Trans # Trans -> List(Trans)) # (Trans # Trans # Trans # Trans -> List(Trans)) -> Bool
  static inline const data_expression& rewr_404_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c308d0);
  }

  static inline data_expression rewr_404_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_404_0(this_rewriter); }

  static inline data_expression rewr_404_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_404_0(this_rewriter); }


  // [398] if: Bool # (Nat # Nat -> Bool) # (Nat # Nat -> Bool) -> Nat # Nat -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_398_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b29970))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_398_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_398_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_398_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_398_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [398] if: Bool # (Nat # Nat -> Bool) # (Nat # Nat -> Bool) -> Nat # Nat -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_398_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b29970))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_398_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_398_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_398_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_398_3(t[0], t[1], t[2], this_rewriter); }


  // [398] if: Bool # (Nat # Nat -> Bool) # (Nat # Nat -> Bool) -> Nat # Nat -> Bool
  static inline const data_expression& rewr_398_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c317e0);
  }

  static inline data_expression rewr_398_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_398_0(this_rewriter); }

  static inline data_expression rewr_398_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_398_0(this_rewriter); }


  // [397] !=: (Nat # Nat -> Bool) # (Nat # Nat -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_397_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_396_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b29940))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_397_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_397_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_397_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_397_2(t[0], t[1], this_rewriter); }


  // [397] !=: (Nat # Nat -> Bool) # (Nat # Nat -> Bool) -> Bool
  static inline const data_expression& rewr_397_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c31d30);
  }

  static inline data_expression rewr_397_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_397_0(this_rewriter); }

  static inline data_expression rewr_397_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_397_0(this_rewriter); }


  // [396] ==: (Nat # Nat -> Bool) # (Nat # Nat -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_396_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: Nat. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(25), rewr_403_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(3)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(28))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(3)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(28)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: Nat. @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b29910))), arg0, arg1);
  }

  static inline data_expression rewr_396_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_396_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_396_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_396_2(t[0], t[1], this_rewriter); }


  // [396] ==: (Nat # Nat -> Bool) # (Nat # Nat -> Bool) -> Bool
  static inline const data_expression& rewr_396_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c31cd0);
  }

  static inline data_expression rewr_396_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_396_0(this_rewriter); }

  static inline data_expression rewr_396_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_396_0(this_rewriter); }


  // [391] if: Bool # (List(Nat) -> Nat) # (List(Nat) -> Nat) -> List(Nat) -> Nat
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_391_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8acbd50))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_391_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_391_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_391_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_391_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [391] if: Bool # (List(Nat) -> Nat) # (List(Nat) -> Nat) -> List(Nat) -> Nat
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_391_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8acbd50))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_391_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_391_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_391_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_391_3(t[0], t[1], t[2], this_rewriter); }


  // [391] if: Bool # (List(Nat) -> Nat) # (List(Nat) -> Nat) -> List(Nat) -> Nat
  static inline const data_expression& rewr_391_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf9a70);
  }

  static inline data_expression rewr_391_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_391_0(this_rewriter); }

  static inline data_expression rewr_391_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_391_0(this_rewriter); }


  // [390] !=: (List(Nat) -> Nat) # (List(Nat) -> Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_390_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_389_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8acbd20))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_390_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_390_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_390_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_390_2(t[0], t[1], this_rewriter); }


  // [390] !=: (List(Nat) -> Nat) # (List(Nat) -> Nat) -> Bool
  static inline const data_expression& rewr_390_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c31be0);
  }

  static inline data_expression rewr_390_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_390_0(this_rewriter); }

  static inline data_expression rewr_390_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_390_0(this_rewriter); }


  // [389] ==: (List(Nat) -> Nat) # (List(Nat) -> Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_389_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: List(Nat). @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(26), rewr_35_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(23))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(23))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: List(Nat). @var_0(x1) == @var_1(x1)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8acbcf0))), arg0, arg1);
  }

  static inline data_expression rewr_389_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_389_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_389_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_389_2(t[0], t[1], this_rewriter); }


  // [389] ==: (List(Nat) -> Nat) # (List(Nat) -> Nat) -> Bool
  static inline const data_expression& rewr_389_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c315f0);
  }

  static inline data_expression rewr_389_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_389_0(this_rewriter); }

  static inline data_expression rewr_389_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_389_0(this_rewriter); }


  // [380] if: Bool # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) -> Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4, class DATA_EXPR5, class DATA_EXPR6, class DATA_EXPR7>
  static inline data_expression rewr_380_8(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, const DATA_EXPR5& arg_not_nf5, const DATA_EXPR6& arg_not_nf6, const DATA_EXPR7& arg_not_nf7, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@N(@@S(@var_5, @@N(@@S(@var_6, @@R(@var_1(@var_2, @var_3, @var_4, @var_5, @var_6)))))))))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@N(@@S(@var_5, @@N(@@S(@var_6, @@R(@var_0(@var_2, @var_3, @var_4, @var_5, @var_6)))))))))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
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
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8acb6c0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter), local_rewrite(arg_not_nf5,this_rewriter), local_rewrite(arg_not_nf6,this_rewriter), local_rewrite(arg_not_nf7,this_rewriter));
  }

  static inline data_expression rewr_380_8_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_380_8(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), term_not_in_normal_form(t[3], this_rewriter), term_not_in_normal_form(t[4], this_rewriter), this_rewriter); }

  static inline data_expression rewr_380_8_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_380_8(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], t[2], t[3], t[4], this_rewriter); }


  // [380] if: Bool # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) -> Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_380_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8acb6c0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_380_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_380_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_380_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_380_3(t[0], t[1], t[2], this_rewriter); }


  // [380] if: Bool # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) -> Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans
  static inline const data_expression& rewr_380_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c32210);
  }

  static inline data_expression rewr_380_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_380_0(this_rewriter); }

  static inline data_expression rewr_380_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_380_0(this_rewriter); }


  // [379] !=: (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_379_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_378_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8acb690))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_379_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_379_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_379_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_379_2(t[0], t[1], this_rewriter); }


  // [379] !=: (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) -> Bool
  static inline const data_expression& rewr_379_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c33040);
  }

  static inline data_expression rewr_379_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_379_0(this_rewriter); }

  static inline data_expression rewr_379_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_379_0(this_rewriter); }


  // [378] ==: (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_378_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Trans_name, x2: Bool, x3: Nat, x4,x9: List(PlaceTokens). @var_0(x1, x2, x3, x4, x9) == @var_1(x1, x2, x3, x4, x9)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(27), rewr_81_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(14)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(16)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(28)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(29)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(30))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(14)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(16)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(28)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(29)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(30))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Trans_name, x2: Bool, x3: Nat, x4,x9: List(PlaceTokens). @var_0(x1, x2, x3, x4, x9) == @var_1(x1, x2, x3, x4, x9)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8acb660))), arg0, arg1);
  }

  static inline data_expression rewr_378_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_378_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_378_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_378_2(t[0], t[1], this_rewriter); }


  // [378] ==: (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) -> Bool
  static inline const data_expression& rewr_378_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c31220);
  }

  static inline data_expression rewr_378_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_378_0(this_rewriter); }

  static inline data_expression rewr_378_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_378_0(this_rewriter); }


  // [373] if: Bool # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) -> PlaceTokens # PlaceTokens -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_373_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8acb1e0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_373_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_373_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_373_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_373_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [373] if: Bool # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) -> PlaceTokens # PlaceTokens -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_373_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8acb1e0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_373_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_373_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_373_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_373_3(t[0], t[1], t[2], this_rewriter); }


  // [373] if: Bool # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) -> PlaceTokens # PlaceTokens -> List(PlaceTokens)
  static inline const data_expression& rewr_373_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c310d0);
  }

  static inline data_expression rewr_373_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_373_0(this_rewriter); }

  static inline data_expression rewr_373_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_373_0(this_rewriter); }


  // [372] !=: (PlaceTokens # PlaceTokens -> List(PlaceTokens)) # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_372_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_371_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8acb1b0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_372_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_372_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_372_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_372_2(t[0], t[1], this_rewriter); }


  // [372] !=: (PlaceTokens # PlaceTokens -> List(PlaceTokens)) # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) -> Bool
  static inline const data_expression& rewr_372_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf8c50);
  }

  static inline data_expression rewr_372_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_372_0(this_rewriter); }

  static inline data_expression rewr_372_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_372_0(this_rewriter); }


  // [371] ==: (PlaceTokens # PlaceTokens -> List(PlaceTokens)) # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_371_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: PlaceTokens. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(28), rewr_268_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(21)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(31))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(21)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(31))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: PlaceTokens. @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8acb180))), arg0, arg1);
  }

  static inline data_expression rewr_371_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_371_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_371_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_371_2(t[0], t[1], this_rewriter); }


  // [371] ==: (PlaceTokens # PlaceTokens -> List(PlaceTokens)) # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) -> Bool
  static inline const data_expression& rewr_371_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c31070);
  }

  static inline data_expression rewr_371_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_371_0(this_rewriter); }

  static inline data_expression rewr_371_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_371_0(this_rewriter); }


  // [366] if: Bool # (PlaceTokens -> List(PlaceTokens)) # (PlaceTokens -> List(PlaceTokens)) -> PlaceTokens -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_366_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8acad90))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_366_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_366_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_366_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_366_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [366] if: Bool # (PlaceTokens -> List(PlaceTokens)) # (PlaceTokens -> List(PlaceTokens)) -> PlaceTokens -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_366_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8acad90))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_366_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_366_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_366_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_366_3(t[0], t[1], t[2], this_rewriter); }


  // [366] if: Bool # (PlaceTokens -> List(PlaceTokens)) # (PlaceTokens -> List(PlaceTokens)) -> PlaceTokens -> List(PlaceTokens)
  static inline const data_expression& rewr_366_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c330d0);
  }

  static inline data_expression rewr_366_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_366_0(this_rewriter); }

  static inline data_expression rewr_366_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_366_0(this_rewriter); }


  // [365] !=: (PlaceTokens -> List(PlaceTokens)) # (PlaceTokens -> List(PlaceTokens)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_365_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_364_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8acad60))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_365_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_365_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_365_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_365_2(t[0], t[1], this_rewriter); }


  // [365] !=: (PlaceTokens -> List(PlaceTokens)) # (PlaceTokens -> List(PlaceTokens)) -> Bool
  static inline const data_expression& rewr_365_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c33130);
  }

  static inline data_expression rewr_365_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_365_0(this_rewriter); }

  static inline data_expression rewr_365_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_365_0(this_rewriter); }


  // [364] ==: (PlaceTokens -> List(PlaceTokens)) # (PlaceTokens -> List(PlaceTokens)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_364_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: PlaceTokens. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(29), rewr_268_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(21))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(21))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: PlaceTokens. @var_0(x1) == @var_1(x1)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8acad30))), arg0, arg1);
  }

  static inline data_expression rewr_364_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_364_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_364_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_364_2(t[0], t[1], this_rewriter); }


  // [364] ==: (PlaceTokens -> List(PlaceTokens)) # (PlaceTokens -> List(PlaceTokens)) -> Bool
  static inline const data_expression& rewr_364_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c33190);
  }

  static inline data_expression rewr_364_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_364_0(this_rewriter); }

  static inline data_expression rewr_364_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_364_0(this_rewriter); }


  // [354] if: Bool # (Place # List(Nat) -> PlaceTokens) # (Place # List(Nat) -> PlaceTokens) -> Place # List(Nat) -> PlaceTokens
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_354_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8aca610))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_354_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_354_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_354_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_354_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [354] if: Bool # (Place # List(Nat) -> PlaceTokens) # (Place # List(Nat) -> PlaceTokens) -> Place # List(Nat) -> PlaceTokens
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_354_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8aca610))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_354_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_354_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_354_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_354_3(t[0], t[1], t[2], this_rewriter); }


  // [354] if: Bool # (Place # List(Nat) -> PlaceTokens) # (Place # List(Nat) -> PlaceTokens) -> Place # List(Nat) -> PlaceTokens
  static inline const data_expression& rewr_354_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c30f20);
  }

  static inline data_expression rewr_354_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_354_0(this_rewriter); }

  static inline data_expression rewr_354_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_354_0(this_rewriter); }


  // [353] !=: (Place # List(Nat) -> PlaceTokens) # (Place # List(Nat) -> PlaceTokens) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_353_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_352_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8aca5e0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_353_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_353_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_353_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_353_2(t[0], t[1], this_rewriter); }


  // [353] !=: (Place # List(Nat) -> PlaceTokens) # (Place # List(Nat) -> PlaceTokens) -> Bool
  static inline const data_expression& rewr_353_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c622e0);
  }

  static inline data_expression rewr_353_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_353_0(this_rewriter); }

  static inline data_expression rewr_353_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_353_0(this_rewriter); }


  // [352] ==: (Place # List(Nat) -> PlaceTokens) # (Place # List(Nat) -> PlaceTokens) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_352_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Place, x3: List(Nat). @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(30), rewr_269_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(8)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(13))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(8)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(13))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Place, x3: List(Nat). @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8aca5b0))), arg0, arg1);
  }

  static inline data_expression rewr_352_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_352_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_352_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_352_2(t[0], t[1], this_rewriter); }


  // [352] ==: (Place # List(Nat) -> PlaceTokens) # (Place # List(Nat) -> PlaceTokens) -> Bool
  static inline const data_expression& rewr_352_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c30fb0);
  }

  static inline data_expression rewr_352_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_352_0(this_rewriter); }

  static inline data_expression rewr_352_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_352_0(this_rewriter); }


  // [347] if: Bool # (Nat -> List(Nat)) # (Nat -> List(Nat)) -> Nat -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_347_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8aca1f0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_347_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_347_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_347_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_347_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [347] if: Bool # (Nat -> List(Nat)) # (Nat -> List(Nat)) -> Nat -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_347_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8aca1f0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_347_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_347_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_347_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_347_3(t[0], t[1], t[2], this_rewriter); }


  // [347] if: Bool # (Nat -> List(Nat)) # (Nat -> List(Nat)) -> Nat -> List(Nat)
  static inline const data_expression& rewr_347_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c33310);
  }

  static inline data_expression rewr_347_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_347_0(this_rewriter); }

  static inline data_expression rewr_347_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_347_0(this_rewriter); }


  // [346] !=: (Nat -> List(Nat)) # (Nat -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_346_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_345_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8aca1c0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_346_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_346_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_346_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_346_2(t[0], t[1], this_rewriter); }


  // [346] !=: (Nat -> List(Nat)) # (Nat -> List(Nat)) -> Bool
  static inline const data_expression& rewr_346_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c33280);
  }

  static inline data_expression rewr_346_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_346_0(this_rewriter); }

  static inline data_expression rewr_346_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_346_0(this_rewriter); }


  // [345] ==: (Nat -> List(Nat)) # (Nat -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_345_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Nat. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(2), rewr_90_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(3))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(3))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Nat. @var_0(x1) == @var_1(x1)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8aca190))), arg0, arg1);
  }

  static inline data_expression rewr_345_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_345_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_345_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_345_2(t[0], t[1], this_rewriter); }


  // [345] ==: (Nat -> List(Nat)) # (Nat -> List(Nat)) -> Bool
  static inline const data_expression& rewr_345_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c33340);
  }

  static inline data_expression rewr_345_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_345_0(this_rewriter); }

  static inline data_expression rewr_345_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_345_0(this_rewriter); }


  // [336] if: Bool # (Pos -> Nat) # (Pos -> Nat) -> Pos -> Nat
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_336_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac9b90))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_336_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_336_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_336_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_336_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [336] if: Bool # (Pos -> Nat) # (Pos -> Nat) -> Pos -> Nat
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_336_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac9b90))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_336_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_336_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_336_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_336_3(t[0], t[1], t[2], this_rewriter); }


  // [336] if: Bool # (Pos -> Nat) # (Pos -> Nat) -> Pos -> Nat
  static inline const data_expression& rewr_336_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c33640);
  }

  static inline data_expression rewr_336_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_336_0(this_rewriter); }

  static inline data_expression rewr_336_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_336_0(this_rewriter); }


  // [335] !=: (Pos -> Nat) # (Pos -> Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_335_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_334_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac9b60))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_335_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_335_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_335_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_335_2(t[0], t[1], this_rewriter); }


  // [335] !=: (Pos -> Nat) # (Pos -> Nat) -> Bool
  static inline const data_expression& rewr_335_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf85a0);
  }

  static inline data_expression rewr_335_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_335_0(this_rewriter); }

  static inline data_expression rewr_335_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_335_0(this_rewriter); }


  // [334] ==: (Pos -> Nat) # (Pos -> Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_334_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Pos. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(1), rewr_35_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(2))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(2))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Pos. @var_0(x1) == @var_1(x1)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac9b30))), arg0, arg1);
  }

  static inline data_expression rewr_334_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_334_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_334_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_334_2(t[0], t[1], this_rewriter); }


  // [334] ==: (Pos -> Nat) # (Pos -> Nat) -> Bool
  static inline const data_expression& rewr_334_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf7dd0);
  }

  static inline data_expression rewr_334_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_334_0(this_rewriter); }

  static inline data_expression rewr_334_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_334_0(this_rewriter); }


  // [324] if: Bool # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) -> (Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4, class DATA_EXPR5, class DATA_EXPR6>
  static inline data_expression rewr_324_7(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, const DATA_EXPR5& arg_not_nf5, const DATA_EXPR6& arg_not_nf6, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@N(@@S(@var_5, @@R(@var_1(@var_2, @var_3, @var_4)(@var_5)))))))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@N(@@S(@var_5, @@R(@var_0(@var_2, @var_3, @var_4)(@var_5)))))))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
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
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac9410))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter), local_rewrite(arg_not_nf5,this_rewriter)), local_rewrite(arg_not_nf6,this_rewriter));
  }

  static inline data_expression rewr_324_7_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_324_7(term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[2], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_324_7_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_324_7(down_cast<application>(down_cast<application>(t.head()).head())[0], down_cast<application>(down_cast<application>(t.head()).head())[1], down_cast<application>(down_cast<application>(t.head()).head())[2], down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [324] if: Bool # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) -> (Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4, class DATA_EXPR5>
  static inline data_expression rewr_324_6(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, const DATA_EXPR5& arg_not_nf5, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_1(@var_2, @var_3, @var_4)))))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_0(@var_2, @var_3, @var_4)))))))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter), local_rewrite(var_4, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3, @var_4)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac9410))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter), local_rewrite(arg_not_nf5,this_rewriter));
  }

  static inline data_expression rewr_324_6_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_324_6(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_324_6_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_324_6(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], t[2], this_rewriter); }


  // [324] if: Bool # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) -> (Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_324_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac9410))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_324_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_324_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_324_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_324_3(t[0], t[1], t[2], this_rewriter); }


  // [324] if: Bool # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) -> (Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)
  static inline const data_expression& rewr_324_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c33830);
  }

  static inline data_expression rewr_324_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_324_0(this_rewriter); }

  static inline data_expression rewr_324_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_324_0(this_rewriter); }


  // [323] !=: ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_323_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_322_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac93e0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_323_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_323_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_323_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_323_2(t[0], t[1], this_rewriter); }


  // [323] !=: ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_323_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c33a10);
  }

  static inline data_expression rewr_323_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_323_0(this_rewriter); }

  static inline data_expression rewr_323_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_323_0(this_rewriter); }


  // [322] ==: ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_322_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Place -> List(Nat), x2: Place, x5: List(Nat). @var_0(x1, x2, x5) == @var_1(x1, x2, x5)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(31), rewr_316_2(delayed_application3<data_expression,data_expression,data_expression,data_expression>(local_rewrite(var_0, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(32)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(12)), this_rewriter), delayed_application3<data_expression,data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(32)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(12)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Place -> List(Nat), x2: Place, x5: List(Nat). @var_0(x1, x2, x5) == @var_1(x1, x2, x5)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac93b0))), arg0, arg1);
  }

  static inline data_expression rewr_322_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_322_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_322_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_322_2(t[0], t[1], this_rewriter); }


  // [322] ==: ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_322_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c33ad0);
  }

  static inline data_expression rewr_322_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_322_0(this_rewriter); }

  static inline data_expression rewr_322_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_322_0(this_rewriter); }


  // [317] !=: (Place -> List(Nat)) # (Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_317_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_316_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac8fc0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_317_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_317_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_317_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_317_2(t[0], t[1], this_rewriter); }


  // [317] !=: (Place -> List(Nat)) # (Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_317_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf8630);
  }

  static inline data_expression rewr_317_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_317_0(this_rewriter); }

  static inline data_expression rewr_317_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_317_0(this_rewriter); }


  // [316] ==: (Place -> List(Nat)) # (Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_316_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Place. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(32), rewr_90_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(8))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(8))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Place. @var_0(x1) == @var_1(x1)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac8f90))), arg0, arg1);
  }

  static inline data_expression rewr_316_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_316_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_316_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_316_2(t[0], t[1], this_rewriter); }


  // [316] ==: (Place -> List(Nat)) # (Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_316_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c338c0);
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
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf7e60);
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
    return *reinterpret_cast<const data_expression*>(0x55b7a8c33920);
  }

  static inline data_expression rewr_312_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_312_0(this_rewriter); }

  static inline data_expression rewr_312_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_312_0(this_rewriter); }


  // [77] if: Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_77_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac2120))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
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
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac2120))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_77_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_77_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_77_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_77_3(t[0], t[1], t[2], this_rewriter); }


  // [77] if: Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)
  static inline const data_expression& rewr_77_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf7ec0);
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac2000))), local_rewrite(arg_not_nf0,this_rewriter), arg1, local_rewrite(arg_not_nf2,this_rewriter)), arg3);
  }

  static inline data_expression rewr_76_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_76_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_76_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_76_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [76] @func_update_stable: (Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_76_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac2000))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter), local_rewrite(arg_not_nf2,this_rewriter));
  }

  static inline data_expression rewr_76_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_76_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_76_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_76_3(t[0], t[1], t[2], this_rewriter); }


  // [76] @func_update_stable: (Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)
  static inline const data_expression& rewr_76_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c33700);
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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac2000) // F1
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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac2000) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        const data_expression& var_3 = down_cast<data_expression>(arg0[3]); // S2
        const data_expression& var_4 = arg1; // S1a
        if (var_2 == arg1) // M
        {
          const data_expression& var_5 = arg2; // S1a
          const DATA_EXPR3& var_6 = arg_not_nf3; // S1b
          return rewr_313_4(rewr_90_2(rewrite_with_arguments_in_normal_form(application(var_1, var_2), this_rewriter), var_5,  this_rewriter), var_1, rewr_76_3(var_1, var_2, var_5,  this_rewriter), local_rewrite(var_6, this_rewriter),  this_rewriter); // R1 @if_always_else(@var_1(@var_2) == @var_5, @var_1, @var_1[@var_2 -> @var_5])(@var_6)
        }
        else
        {
          const data_expression& var_5 = arg2; // S1a
          const DATA_EXPR3& var_6 = arg_not_nf3; // S1b
          if (rewr_314_2(var_4, var_2,  this_rewriter) == sort_bool::true_()) // C
          {
            return rewr_313_4(rewr_90_2(rewrite_with_arguments_in_normal_form(application(var_1, var_4), this_rewriter), var_5,  this_rewriter), rewr_76_3(var_1, var_2, var_3,  this_rewriter), rewr_76_3(delayed_rewr_76_3<data_expression, data_expression, data_expression>(var_1, var_2, var_3,  this_rewriter), var_4, var_5,  this_rewriter), local_rewrite(var_6, this_rewriter),  this_rewriter); // R1 @if_always_else(@var_1(@var_4) == @var_5, @var_1[@var_2 -> @var_3], @var_1[@var_2 -> @var_3][@var_4 -> @var_5])(@var_6)
          }
          else
          {
            if (rewr_312_1(var_0,  this_rewriter) == sort_bool::true_()) // C
            {
              return rewr_313_4(rewr_90_2(rewrite_with_arguments_in_normal_form(application(var_0, var_4), this_rewriter), var_5,  this_rewriter), var_0, rewr_76_3(var_0, var_4, var_5,  this_rewriter), local_rewrite(var_6, this_rewriter),  this_rewriter); // R1 @if_always_else(@var_0(@var_4) == @var_5, @var_0, @var_0[@var_4 -> @var_5])(@var_6)
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
          return rewr_313_4(rewr_90_2(rewrite_with_arguments_in_normal_form(application(var_0, var_1), this_rewriter), var_2,  this_rewriter), var_0, rewr_76_3(var_0, var_1, var_2,  this_rewriter), local_rewrite(var_3, this_rewriter),  this_rewriter); // R1 @if_always_else(@var_0(@var_1) == @var_2, @var_0, @var_0[@var_1 -> @var_2])(@var_3)
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac0740))), arg0, arg1, arg2), arg3);
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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac2000) // F1
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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac2000) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        const data_expression& var_3 = down_cast<data_expression>(arg0[3]); // S2
        const data_expression& var_4 = arg1; // S1a
        if (var_2 == arg1) // M
        {
          const data_expression& var_5 = arg2; // S1a
          return rewr_313_3(rewr_90_2(rewrite_with_arguments_in_normal_form(application(var_1, var_2), this_rewriter), var_5,  this_rewriter), var_1, rewr_76_3(var_1, var_2, var_5,  this_rewriter),  this_rewriter); // R1 @if_always_else(@var_1(@var_2) == @var_5, @var_1, @var_1[@var_2 -> @var_5])
        }
        else
        {
          const data_expression& var_5 = arg2; // S1a
          if (rewr_312_1(var_0,  this_rewriter) == sort_bool::true_()) // C
          {
            return rewr_313_3(rewr_90_2(rewrite_with_arguments_in_normal_form(application(var_0, var_4), this_rewriter), var_5,  this_rewriter), var_0, rewr_76_3(var_0, var_4, var_5,  this_rewriter),  this_rewriter); // R1 @if_always_else(@var_0(@var_4) == @var_5, @var_0, @var_0[@var_4 -> @var_5])
          }
          else
          {
            if (rewr_314_2(var_4, var_2,  this_rewriter) == sort_bool::true_()) // C
            {
              return rewr_313_3(rewr_90_2(rewrite_with_arguments_in_normal_form(application(var_1, var_4), this_rewriter), var_5,  this_rewriter), rewr_76_3(var_1, var_2, var_3,  this_rewriter), rewr_76_3(delayed_rewr_76_3<data_expression, data_expression, data_expression>(var_1, var_2, var_3,  this_rewriter), var_4, var_5,  this_rewriter),  this_rewriter); // R1 @if_always_else(@var_1(@var_4) == @var_5, @var_1[@var_2 -> @var_3], @var_1[@var_2 -> @var_3][@var_4 -> @var_5])
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
          return rewr_313_3(rewr_90_2(rewrite_with_arguments_in_normal_form(application(var_0, var_1), this_rewriter), var_2,  this_rewriter), var_0, rewr_76_3(var_0, var_1, var_2,  this_rewriter),  this_rewriter); // R1 @if_always_else(@var_0(@var_1) == @var_2, @var_0, @var_0[@var_1 -> @var_2])
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac0740))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_13_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_13_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_13_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_13_3(t[0], t[1], t[2], this_rewriter); }


  // [13] @func_update: (Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)
  static inline const data_expression& rewr_13_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c339e0);
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
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac8870))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
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
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac8870))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_307_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_307_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_307_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_307_3(t[0], t[1], t[2], this_rewriter); }


  // [307] if: Bool # (Nat # Nat -> List(Nat)) # (Nat # Nat -> List(Nat)) -> Nat # Nat -> List(Nat)
  static inline const data_expression& rewr_307_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c33b00);
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac8840))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_306_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_306_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_306_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_306_2(t[0], t[1], this_rewriter); }


  // [306] !=: (Nat # Nat -> List(Nat)) # (Nat # Nat -> List(Nat)) -> Bool
  static inline const data_expression& rewr_306_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c33aa0);
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
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(25), rewr_90_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(3)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(28))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(3)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(28))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: Nat. @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac8810))), arg0, arg1);
  }

  static inline data_expression rewr_305_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_305_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_305_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_305_2(t[0], t[1], this_rewriter); }


  // [305] ==: (Nat # Nat -> List(Nat)) # (Nat # Nat -> List(Nat)) -> Bool
  static inline const data_expression& rewr_305_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c31ee0);
  }

  static inline data_expression rewr_305_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_305_0(this_rewriter); }

  static inline data_expression rewr_305_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_305_0(this_rewriter); }


  // [302] !=: List(Nat) # List(Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_302_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_90_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac8570))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_302_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_302_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_302_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_302_2(t[0], t[1], this_rewriter); }


  // [302] !=: List(Nat) # List(Nat) -> Bool
  static inline const data_expression& rewr_302_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf77d0);
  }

  static inline data_expression rewr_302_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_302_0(this_rewriter); }

  static inline data_expression rewr_302_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_302_0(this_rewriter); }


  // [90] ==: List(Nat) # List(Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_90_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac1970) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
        }
        else
        {
          if (uint_address(arg1) == 0x55b7a8ac06b0) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac1970) // F1
            {
              const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
              const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
              return rewr_45_2(rewr_35_2(var_1, var_3,  this_rewriter), delayed_rewr_90_2<data_expression, data_expression>(var_2, var_4,  this_rewriter),  this_rewriter); // R1 @var_1 == @var_3 && @var_2 == @var_4
            }
            else
            {
            }
          }
        }
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac06b0) // F1
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac1970) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
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
            return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac2fc0))), arg0, arg1);
  }

  static inline data_expression rewr_90_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_90_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_90_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_90_2(t[0], t[1], this_rewriter); }


  // [90] ==: List(Nat) # List(Nat) -> Bool
  static inline const data_expression& rewr_90_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c33ec0);
  }

  static inline data_expression rewr_90_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_90_0(this_rewriter); }

  static inline data_expression rewr_90_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_90_0(this_rewriter); }


  // [89] if: Bool # List(Nat) # List(Nat) -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_89_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac2f90))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_89_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_89_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_89_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_89_3(t[0], t[1], t[2], this_rewriter); }


  // [89] if: Bool # List(Nat) # List(Nat) -> List(Nat)
  static inline const data_expression& rewr_89_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf7710);
  }

  static inline data_expression rewr_89_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_89_0(this_rewriter); }

  static inline data_expression rewr_89_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_89_0(this_rewriter); }


  // [88] in: Nat # List(Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_88_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@N(@@F([], @@R(false), @@X))
    {
      if (uint_address(arg1) == 0x55b7a8ac06b0) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
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
      if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac1970) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg1[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg1[2]); // S2
        return rewr_82_2(rewr_35_2(var_0, var_1,  this_rewriter), delayed_rewr_88_2<data_expression, data_expression>(var_0, var_2,  this_rewriter),  this_rewriter); // R1 @var_0 == @var_1 || @var_0 in @var_2
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac2e70))), arg0, arg1);
  }

  static inline data_expression rewr_88_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_88_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_88_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_88_2(t[0], t[1], this_rewriter); }


  // [88] in: Nat # List(Nat) -> Bool
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
  
  // [88] in: Nat # List(Nat) -> Bool
  static inline const data_expression& rewr_88_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf77a0);
  }

  static inline data_expression rewr_88_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_88_0(this_rewriter); }

  static inline data_expression rewr_88_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_88_0(this_rewriter); }


  // [56] ++: List(Nat) # List(Nat) -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_56_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(|>, @@S(@var_0, @@N(@@S(@var_1, @@D(@@N(@@S(@var_2, @@R(@var_0 |> @var_1 ++ @var_2))))))), @@F([], @@D(@@N(@@S(@var_0, @@R(@var_0)))), @@X))
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac1970) // F1
      {
        const data_expression& var_0 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_1 = down_cast<data_expression>(arg0[2]); // S2
        const DATA_EXPR1& var_2 = arg_not_nf1; // S1b
        return rewr_60_2(var_0, rewr_56_2(var_1, var_2,  this_rewriter),  this_rewriter); // R1 @var_0 |> @var_1 ++ @var_2
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac06b0) // F1
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
      if (uint_address(arg1) == 0x55b7a8ac06b0) // F1
      {
        return var_0; // R1 @var_0
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac1700))), arg0, arg1);
  }

  static inline data_expression rewr_56_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_56_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_56_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_56_2(t[0], t[1], this_rewriter); }


  // [56] ++: List(Nat) # List(Nat) -> List(Nat)
  static inline const data_expression& rewr_56_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c33730);
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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac1970) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
        }
        else
        {
          if (uint_address(arg1) == 0x55b7a8ac06b0) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac1970) // F1
            {
              const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
              const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
              return rewr_82_2(rewr_45_2(rewr_35_2(var_1, var_3,  this_rewriter), delayed_rewr_41_2<data_expression, data_expression>(var_2, var_4,  this_rewriter),  this_rewriter), delayed_rewr_107_2<data_expression, data_expression>(var_1, var_3,  this_rewriter),  this_rewriter); // R1 @var_1 == @var_3 && @var_2 <= @var_4 || @var_1 < @var_3
            }
            else
            {
            }
          }
        }
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac06b0) // F1
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac1970) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
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
            return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac1040))), arg0, arg1);
  }

  static inline data_expression rewr_41_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_41_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_41_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_41_2(t[0], t[1], this_rewriter); }


  // [107] <: Nat # Nat -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_107_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_107_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_107_2(m_t0, m_t1, this_rewriter);
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
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf6ef0);
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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac1970) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[2]); // S2
        return rewr_17_1(rewr_103_1(rewr_34_1(var_1,  this_rewriter),  this_rewriter),  this_rewriter); // R1 succ(#@var_1)
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac06b0) // F1
        {
          return *reinterpret_cast<const data_expression*>(0x55b7a8c33800); // R1 0
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac0e30))), arg0);
  }

  static inline data_expression rewr_34_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_34_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_34_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_34_1(t[0], this_rewriter); }


  // [34] #: List(Nat) -> Nat
  static inline const data_expression& rewr_34_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c31e10);
  }

  static inline data_expression rewr_34_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_34_0(this_rewriter); }

  static inline data_expression rewr_34_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_34_0(this_rewriter); }


  // [292] if: Bool # List(Trans) # List(Trans) -> List(Trans)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_292_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac7910))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_292_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_292_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_292_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_292_3(t[0], t[1], t[2], this_rewriter); }


  // [292] if: Bool # List(Trans) # List(Trans) -> List(Trans)
  static inline const data_expression& rewr_292_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c34990);
  }

  static inline data_expression rewr_292_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_292_0(this_rewriter); }

  static inline data_expression rewr_292_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_292_0(this_rewriter); }


  // [291] !=: List(Trans) # List(Trans) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_291_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_287_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac78e0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_291_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_291_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_291_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_291_2(t[0], t[1], this_rewriter); }


  // [291] !=: List(Trans) # List(Trans) -> Bool
  static inline const data_expression& rewr_291_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c33e30);
  }

  static inline data_expression rewr_291_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_291_0(this_rewriter); }

  static inline data_expression rewr_291_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_291_0(this_rewriter); }


  // [287] ==: List(Trans) # List(Trans) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_287_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac6e00) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
        }
        else
        {
          if (uint_address(arg1) == 0x55b7a8ac6dd0) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac6e00) // F1
            {
              const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
              const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
              return rewr_45_2(rewr_81_2(var_1, var_3,  this_rewriter), delayed_rewr_287_2<data_expression, data_expression>(var_2, var_4,  this_rewriter),  this_rewriter); // R1 @var_1 == @var_3 && @var_2 == @var_4
            }
            else
            {
            }
          }
        }
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac6dd0) // F1
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac6e00) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
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
            return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac70a0))), arg0, arg1);
  }

  static inline data_expression rewr_287_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_287_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_287_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_287_2(t[0], t[1], this_rewriter); }


  // [287] ==: List(Trans) # List(Trans) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_287_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_287_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_287_2(m_t0, m_t1, this_rewriter);
      }
  };
  
  // [287] ==: List(Trans) # List(Trans) -> Bool
  static inline const data_expression& rewr_287_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c33e60);
  }

  static inline data_expression rewr_287_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_287_0(this_rewriter); }

  static inline data_expression rewr_287_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_287_0(this_rewriter); }


  // [274] if: Bool # List(PlaceTokens) # List(PlaceTokens) -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_274_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x55b7a8ac2180) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac07a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac6b00))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_274_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_274_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_274_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_274_3(t[0], t[1], t[2], this_rewriter); }


  // [274] if: Bool # List(PlaceTokens) # List(PlaceTokens) -> List(PlaceTokens)
  static inline const data_expression& rewr_274_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c32180);
  }

  static inline data_expression rewr_274_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_274_0(this_rewriter); }

  static inline data_expression rewr_274_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_274_0(this_rewriter); }


  // [273] !=: List(PlaceTokens) # List(PlaceTokens) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_273_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_85_1(rewr_268_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac6ad0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_273_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_273_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_273_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_273_2(t[0], t[1], this_rewriter); }


  // [273] !=: List(PlaceTokens) # List(PlaceTokens) -> Bool
  static inline const data_expression& rewr_273_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf6ec0);
  }

  static inline data_expression rewr_273_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_273_0(this_rewriter); }

  static inline data_expression rewr_273_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_273_0(this_rewriter); }


  // [268] ==: List(PlaceTokens) # List(PlaceTokens) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_268_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x55b7a8ac1610) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
        }
        else
        {
          if (uint_address(arg1) == 0x55b7a8ac14f0) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac1610) // F1
            {
              const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
              const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
              return rewr_45_2(rewr_269_2(var_1, var_3,  this_rewriter), delayed_rewr_268_2<data_expression, data_expression>(var_2, var_4,  this_rewriter),  this_rewriter); // R1 @var_1 == @var_3 && @var_2 == @var_4
            }
            else
            {
            }
          }
        }
      }
      else
      {
        if (uint_address(arg0) == 0x55b7a8ac14f0) // F1
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac1610) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
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
            return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac6260))), arg0, arg1);
  }

  static inline data_expression rewr_268_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_268_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_268_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_268_2(t[0], t[1], this_rewriter); }


  // [268] ==: List(PlaceTokens) # List(PlaceTokens) -> Bool
  static inline const data_expression& rewr_268_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf7010);
  }

  static inline data_expression rewr_268_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_268_0(this_rewriter); }

  static inline data_expression rewr_268_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_268_0(this_rewriter); }


  // [43] in: PlaceTokens # List(PlaceTokens) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_43_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@N(@@F([], @@R(false), @@X))
    {
      if (uint_address(arg1) == 0x55b7a8ac14f0) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0); // R1 false
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
      if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x55b7a8ac1610) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg1[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg1[2]); // S2
        return rewr_82_2(rewr_269_2(var_0, var_1,  this_rewriter), delayed_rewr_43_2<data_expression, data_expression>(var_0, var_2,  this_rewriter),  this_rewriter); // R1 @var_0 == @var_1 || @var_0 in @var_2
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac1100))), arg0, arg1);
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
    return *reinterpret_cast<const data_expression*>(0x55b7a8c33950);
  }

  static inline data_expression rewr_43_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_43_0(this_rewriter); }

  static inline data_expression rewr_43_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_43_0(this_rewriter); }


  // [826] marking_trans: (Place -> List(Nat)) # Trans_name -> MarkingTrans
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_826_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8b66730))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_826_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_826_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_826_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_826_2(t[0], t[1], this_rewriter); }


  // [826] marking_trans: (Place -> List(Nat)) # Trans_name -> MarkingTrans
  static inline const data_expression& rewr_826_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c32150);
  }

  static inline data_expression rewr_826_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_826_0(this_rewriter); }

  static inline data_expression rewr_826_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_826_0(this_rewriter); }


  // [20] place_tokens: Place # List(Nat) -> PlaceTokens
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_20_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac0a40))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_20_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_20_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_20_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_20_2(t[0], t[1], this_rewriter); }


  // [20] place_tokens: Place # List(Nat) -> PlaceTokens
  static inline const data_expression& rewr_20_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf76e0);
  }

  static inline data_expression rewr_20_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_20_0(this_rewriter); }

  static inline data_expression rewr_20_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_20_0(this_rewriter); }


  // [28] trans: Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_28_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac0c80))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter), local_rewrite(arg_not_nf2,this_rewriter), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_28_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_28_5(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), term_not_in_normal_form(t[3], this_rewriter), term_not_in_normal_form(t[4], this_rewriter), this_rewriter); }

  static inline data_expression rewr_28_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_28_5(t[0], t[1], t[2], t[3], t[4], this_rewriter); }


  // [28] trans: Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans
  static inline const data_expression& rewr_28_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c31f10);
  }

  static inline data_expression rewr_28_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_28_0(this_rewriter); }

  static inline data_expression rewr_28_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_28_0(this_rewriter); }


  // [27] t3: Trans_name
  static inline const data_expression& rewr_27_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf6fe0);
  }

  static inline data_expression rewr_27_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_27_0(this_rewriter); }

  static inline data_expression rewr_27_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_27_0(this_rewriter); }


  // [31] t2: Trans_name
  static inline const data_expression& rewr_31_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c34340);
  }

  static inline data_expression rewr_31_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_31_0(this_rewriter); }

  static inline data_expression rewr_31_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_31_0(this_rewriter); }


  // [36] t1: Trans_name
  static inline const data_expression& rewr_36_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c339b0);
  }

  static inline data_expression rewr_36_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_36_0(this_rewriter); }

  static inline data_expression rewr_36_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_36_0(this_rewriter); }


  // [37] t0: Trans_name
  static inline const data_expression& rewr_37_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c34750);
  }

  static inline data_expression rewr_37_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_37_0(this_rewriter); }

  static inline data_expression rewr_37_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_37_0(this_rewriter); }


  // [19] p5: Place
  static inline const data_expression& rewr_19_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf7040);
  }

  static inline data_expression rewr_19_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_19_0(this_rewriter); }

  static inline data_expression rewr_19_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_19_0(this_rewriter); }


  // [23] p4: Place
  static inline const data_expression& rewr_23_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c30040);
  }

  static inline data_expression rewr_23_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_23_0(this_rewriter); }

  static inline data_expression rewr_23_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_23_0(this_rewriter); }


  // [25] p3: Place
  static inline const data_expression& rewr_25_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bfcfc0);
  }

  static inline data_expression rewr_25_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_25_0(this_rewriter); }

  static inline data_expression rewr_25_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_25_0(this_rewriter); }


  // [30] p2: Place
  static inline const data_expression& rewr_30_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf7070);
  }

  static inline data_expression rewr_30_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_30_0(this_rewriter); }

  static inline data_expression rewr_30_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_30_0(this_rewriter); }


  // [33] p1: Place
  static inline const data_expression& rewr_33_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c33e90);
  }

  static inline data_expression rewr_33_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_33_0(this_rewriter); }

  static inline data_expression rewr_33_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_33_0(this_rewriter); }


  // [11] p0: Place
  static inline const data_expression& rewr_11_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c33a40);
  }

  static inline data_expression rewr_11_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_11_0(this_rewriter); }

  static inline data_expression rewr_11_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_11_0(this_rewriter); }


  // [80] @cDub: Bool # Pos -> Pos
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_80_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac21b0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_80_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_80_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_80_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_80_2(t[0], t[1], this_rewriter); }


  // [80] @cDub: Bool # Pos -> Pos
  static inline const data_expression& rewr_80_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c33d40);
  }

  static inline data_expression rewr_80_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_80_0(this_rewriter); }

  static inline data_expression rewr_80_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_80_0(this_rewriter); }


  // [78] 1: Pos
  static inline const data_expression& rewr_78_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c1ffc0);
  }

  static inline data_expression rewr_78_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_78_0(this_rewriter); }

  static inline data_expression rewr_78_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_78_0(this_rewriter); }


  // [122] @cPair: Nat # Nat -> @NatPair
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_122_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac4550))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_122_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_122_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_122_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_122_2(t[0], t[1], this_rewriter); }


  // [122] @cPair: Nat # Nat -> @NatPair
  static inline const data_expression& rewr_122_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c32ff0);
  }

  static inline data_expression rewr_122_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_122_0(this_rewriter); }

  static inline data_expression rewr_122_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_122_0(this_rewriter); }


  // [75] 0: Nat
  static inline const data_expression& rewr_75_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c33800);
  }

  static inline data_expression rewr_75_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_75_0(this_rewriter); }

  static inline data_expression rewr_75_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_75_0(this_rewriter); }


  // [17] @cNat: Pos -> Nat
  template < class DATA_EXPR0>
  static inline data_expression rewr_17_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac09b0))), local_rewrite(arg_not_nf0,this_rewriter));
  }

  static inline data_expression rewr_17_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_17_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_17_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_17_1(t[0], this_rewriter); }


  // [17] @cNat: Pos -> Nat
  static inline const data_expression& rewr_17_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c33860);
  }

  static inline data_expression rewr_17_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_17_0(this_rewriter); }

  static inline data_expression rewr_17_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_17_0(this_rewriter); }


  // [94] @cNeg: Pos -> Int
  template < class DATA_EXPR0>
  static inline data_expression rewr_94_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac3740))), local_rewrite(arg_not_nf0,this_rewriter));
  }

  static inline data_expression rewr_94_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_94_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_94_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_94_1(t[0], this_rewriter); }


  // [94] @cNeg: Pos -> Int
  static inline const data_expression& rewr_94_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c300f0);
  }

  static inline data_expression rewr_94_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_94_0(this_rewriter); }

  static inline data_expression rewr_94_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_94_0(this_rewriter); }


  // [92] @cInt: Nat -> Int
  template < class DATA_EXPR0>
  static inline data_expression rewr_92_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac36b0))), local_rewrite(arg_not_nf0,this_rewriter));
  }

  static inline data_expression rewr_92_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_92_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_92_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_92_1(t[0], this_rewriter); }


  // [92] @cInt: Nat -> Int
  static inline const data_expression& rewr_92_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c30120);
  }

  static inline data_expression rewr_92_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_92_0(this_rewriter); }

  static inline data_expression rewr_92_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_92_0(this_rewriter); }


  // [79] false: Bool
  static inline const data_expression& rewr_79_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8aab2b0);
  }

  static inline data_expression rewr_79_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_79_0(this_rewriter); }

  static inline data_expression rewr_79_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_79_0(this_rewriter); }


  // [15] true: Bool
  static inline const data_expression& rewr_15_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf2d60);
  }

  static inline data_expression rewr_15_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_15_0(this_rewriter); }

  static inline data_expression rewr_15_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_15_0(this_rewriter); }


  // [60] |>: Nat # List(Nat) -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_60_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac1970))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_60_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_60_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_60_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_60_2(t[0], t[1], this_rewriter); }


  // [60] |>: Nat # List(Nat) -> List(Nat)
  static inline const data_expression& rewr_60_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8c30190);
  }

  static inline data_expression rewr_60_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_60_0(this_rewriter); }

  static inline data_expression rewr_60_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_60_0(this_rewriter); }


  // [12] []: List(Nat)
  static inline const data_expression& rewr_12_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bc6020);
  }

  static inline data_expression rewr_12_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_12_0(this_rewriter); }

  static inline data_expression rewr_12_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_12_0(this_rewriter); }


  // [278] |>: Trans # List(Trans) -> List(Trans)
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_278_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac6e00))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_278_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_278_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_278_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_278_2(t[0], t[1], this_rewriter); }


  // [278] |>: Trans # List(Trans) -> List(Trans)
  static inline const data_expression& rewr_278_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf6780);
  }

  static inline data_expression rewr_278_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_278_0(this_rewriter); }

  static inline data_expression rewr_278_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_278_0(this_rewriter); }


  // [277] []: List(Trans)
  static inline const data_expression& rewr_277_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf68b0);
  }

  static inline data_expression rewr_277_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_277_0(this_rewriter); }

  static inline data_expression rewr_277_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_277_0(this_rewriter); }


  // [54] |>: PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_54_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55b7a8ac1610))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_54_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_54_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_54_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_54_2(t[0], t[1], this_rewriter); }


  // [54] |>: PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)
  static inline const data_expression& rewr_54_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf6080);
  }

  static inline data_expression rewr_54_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_54_0(this_rewriter); }

  static inline data_expression rewr_54_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_54_0(this_rewriter); }


  // [51] []: List(PlaceTokens)
  static inline const data_expression& rewr_51_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55b7a8bf60b0);
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
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 89 + 3] = rewr_functions::rewr_89_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 89 + 3] = rewr_functions::rewr_89_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 90 + 2] = rewr_functions::rewr_90_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 90 + 2] = rewr_functions::rewr_90_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 91 + 2] = rewr_functions::rewr_91_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 91 + 2] = rewr_functions::rewr_91_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 92 + 1] = rewr_functions::rewr_92_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 92 + 1] = rewr_functions::rewr_92_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 94 + 1] = rewr_functions::rewr_94_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 94 + 1] = rewr_functions::rewr_94_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 96 + 2] = rewr_functions::rewr_96_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 96 + 2] = rewr_functions::rewr_96_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 101 + 2] = rewr_functions::rewr_101_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 101 + 2] = rewr_functions::rewr_101_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 102 + 2] = rewr_functions::rewr_102_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 102 + 2] = rewr_functions::rewr_102_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 103 + 1] = rewr_functions::rewr_103_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 103 + 1] = rewr_functions::rewr_103_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 105 + 1] = rewr_functions::rewr_105_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 105 + 1] = rewr_functions::rewr_105_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 106 + 2] = rewr_functions::rewr_106_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 106 + 2] = rewr_functions::rewr_106_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 107 + 2] = rewr_functions::rewr_107_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 107 + 2] = rewr_functions::rewr_107_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 117 + 1] = rewr_functions::rewr_117_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 117 + 1] = rewr_functions::rewr_117_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 122 + 2] = rewr_functions::rewr_122_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 122 + 2] = rewr_functions::rewr_122_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 268 + 2] = rewr_functions::rewr_268_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 268 + 2] = rewr_functions::rewr_268_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 269 + 2] = rewr_functions::rewr_269_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 269 + 2] = rewr_functions::rewr_269_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 273 + 2] = rewr_functions::rewr_273_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 273 + 2] = rewr_functions::rewr_273_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 274 + 3] = rewr_functions::rewr_274_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 274 + 3] = rewr_functions::rewr_274_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 278 + 2] = rewr_functions::rewr_278_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 278 + 2] = rewr_functions::rewr_278_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 287 + 2] = rewr_functions::rewr_287_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 287 + 2] = rewr_functions::rewr_287_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 291 + 2] = rewr_functions::rewr_291_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 291 + 2] = rewr_functions::rewr_291_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 292 + 3] = rewr_functions::rewr_292_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 292 + 3] = rewr_functions::rewr_292_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 302 + 2] = rewr_functions::rewr_302_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 302 + 2] = rewr_functions::rewr_302_2_term_arg_in_normal_form;
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
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 317 + 2] = rewr_functions::rewr_317_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 317 + 2] = rewr_functions::rewr_317_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 322 + 2] = rewr_functions::rewr_322_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 322 + 2] = rewr_functions::rewr_322_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 323 + 2] = rewr_functions::rewr_323_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 323 + 2] = rewr_functions::rewr_323_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 324 + 3] = rewr_functions::rewr_324_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 324 + 3] = rewr_functions::rewr_324_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 324 + 6] = rewr_functions::rewr_324_6_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 324 + 6] = rewr_functions::rewr_324_6_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 324 + 7] = rewr_functions::rewr_324_7_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 324 + 7] = rewr_functions::rewr_324_7_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 333 + 2] = rewr_functions::rewr_333_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 333 + 2] = rewr_functions::rewr_333_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 334 + 2] = rewr_functions::rewr_334_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 334 + 2] = rewr_functions::rewr_334_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 335 + 2] = rewr_functions::rewr_335_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 335 + 2] = rewr_functions::rewr_335_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 336 + 3] = rewr_functions::rewr_336_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 336 + 3] = rewr_functions::rewr_336_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 336 + 4] = rewr_functions::rewr_336_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 336 + 4] = rewr_functions::rewr_336_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 345 + 2] = rewr_functions::rewr_345_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 345 + 2] = rewr_functions::rewr_345_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 346 + 2] = rewr_functions::rewr_346_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 346 + 2] = rewr_functions::rewr_346_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 347 + 3] = rewr_functions::rewr_347_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 347 + 3] = rewr_functions::rewr_347_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 347 + 4] = rewr_functions::rewr_347_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 347 + 4] = rewr_functions::rewr_347_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 352 + 2] = rewr_functions::rewr_352_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 352 + 2] = rewr_functions::rewr_352_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 353 + 2] = rewr_functions::rewr_353_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 353 + 2] = rewr_functions::rewr_353_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 354 + 3] = rewr_functions::rewr_354_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 354 + 3] = rewr_functions::rewr_354_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 354 + 5] = rewr_functions::rewr_354_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 354 + 5] = rewr_functions::rewr_354_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 363 + 2] = rewr_functions::rewr_363_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 363 + 2] = rewr_functions::rewr_363_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 364 + 2] = rewr_functions::rewr_364_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 364 + 2] = rewr_functions::rewr_364_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 365 + 2] = rewr_functions::rewr_365_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 365 + 2] = rewr_functions::rewr_365_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 366 + 3] = rewr_functions::rewr_366_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 366 + 3] = rewr_functions::rewr_366_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 366 + 4] = rewr_functions::rewr_366_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 366 + 4] = rewr_functions::rewr_366_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 371 + 2] = rewr_functions::rewr_371_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 371 + 2] = rewr_functions::rewr_371_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 372 + 2] = rewr_functions::rewr_372_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 372 + 2] = rewr_functions::rewr_372_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 373 + 3] = rewr_functions::rewr_373_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 373 + 3] = rewr_functions::rewr_373_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 373 + 5] = rewr_functions::rewr_373_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 373 + 5] = rewr_functions::rewr_373_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 378 + 2] = rewr_functions::rewr_378_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 378 + 2] = rewr_functions::rewr_378_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 379 + 2] = rewr_functions::rewr_379_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 379 + 2] = rewr_functions::rewr_379_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 380 + 3] = rewr_functions::rewr_380_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 380 + 3] = rewr_functions::rewr_380_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 380 + 8] = rewr_functions::rewr_380_8_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 380 + 8] = rewr_functions::rewr_380_8_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 389 + 2] = rewr_functions::rewr_389_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 389 + 2] = rewr_functions::rewr_389_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 390 + 2] = rewr_functions::rewr_390_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 390 + 2] = rewr_functions::rewr_390_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 391 + 3] = rewr_functions::rewr_391_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 391 + 3] = rewr_functions::rewr_391_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 391 + 4] = rewr_functions::rewr_391_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 391 + 4] = rewr_functions::rewr_391_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 396 + 2] = rewr_functions::rewr_396_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 396 + 2] = rewr_functions::rewr_396_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 397 + 2] = rewr_functions::rewr_397_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 397 + 2] = rewr_functions::rewr_397_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 398 + 3] = rewr_functions::rewr_398_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 398 + 3] = rewr_functions::rewr_398_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 398 + 5] = rewr_functions::rewr_398_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 398 + 5] = rewr_functions::rewr_398_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 403 + 2] = rewr_functions::rewr_403_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 403 + 2] = rewr_functions::rewr_403_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 404 + 2] = rewr_functions::rewr_404_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 404 + 2] = rewr_functions::rewr_404_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 405 + 2] = rewr_functions::rewr_405_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 405 + 2] = rewr_functions::rewr_405_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 406 + 3] = rewr_functions::rewr_406_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 406 + 3] = rewr_functions::rewr_406_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 406 + 7] = rewr_functions::rewr_406_7_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 406 + 7] = rewr_functions::rewr_406_7_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 415 + 2] = rewr_functions::rewr_415_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 415 + 2] = rewr_functions::rewr_415_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 416 + 2] = rewr_functions::rewr_416_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 416 + 2] = rewr_functions::rewr_416_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 417 + 3] = rewr_functions::rewr_417_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 417 + 3] = rewr_functions::rewr_417_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 417 + 4] = rewr_functions::rewr_417_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 417 + 4] = rewr_functions::rewr_417_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 426 + 2] = rewr_functions::rewr_426_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 426 + 2] = rewr_functions::rewr_426_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 427 + 2] = rewr_functions::rewr_427_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 427 + 2] = rewr_functions::rewr_427_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 428 + 2] = rewr_functions::rewr_428_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 428 + 2] = rewr_functions::rewr_428_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 429 + 3] = rewr_functions::rewr_429_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 429 + 3] = rewr_functions::rewr_429_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 429 + 4] = rewr_functions::rewr_429_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 429 + 4] = rewr_functions::rewr_429_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 434 + 2] = rewr_functions::rewr_434_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 434 + 2] = rewr_functions::rewr_434_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 435 + 2] = rewr_functions::rewr_435_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 435 + 2] = rewr_functions::rewr_435_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 436 + 3] = rewr_functions::rewr_436_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 436 + 3] = rewr_functions::rewr_436_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 436 + 5] = rewr_functions::rewr_436_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 436 + 5] = rewr_functions::rewr_436_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 445 + 2] = rewr_functions::rewr_445_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 445 + 2] = rewr_functions::rewr_445_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 446 + 2] = rewr_functions::rewr_446_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 446 + 2] = rewr_functions::rewr_446_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 447 + 3] = rewr_functions::rewr_447_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 447 + 3] = rewr_functions::rewr_447_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 447 + 4] = rewr_functions::rewr_447_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 447 + 4] = rewr_functions::rewr_447_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 452 + 2] = rewr_functions::rewr_452_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 452 + 2] = rewr_functions::rewr_452_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 453 + 2] = rewr_functions::rewr_453_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 453 + 2] = rewr_functions::rewr_453_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 454 + 3] = rewr_functions::rewr_454_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 454 + 3] = rewr_functions::rewr_454_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 454 + 5] = rewr_functions::rewr_454_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 454 + 5] = rewr_functions::rewr_454_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 459 + 2] = rewr_functions::rewr_459_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 459 + 2] = rewr_functions::rewr_459_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 460 + 2] = rewr_functions::rewr_460_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 460 + 2] = rewr_functions::rewr_460_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 461 + 3] = rewr_functions::rewr_461_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 461 + 3] = rewr_functions::rewr_461_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 461 + 5] = rewr_functions::rewr_461_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 461 + 5] = rewr_functions::rewr_461_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 466 + 2] = rewr_functions::rewr_466_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 466 + 2] = rewr_functions::rewr_466_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 467 + 2] = rewr_functions::rewr_467_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 467 + 2] = rewr_functions::rewr_467_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 468 + 3] = rewr_functions::rewr_468_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 468 + 3] = rewr_functions::rewr_468_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 468 + 5] = rewr_functions::rewr_468_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 468 + 5] = rewr_functions::rewr_468_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 477 + 2] = rewr_functions::rewr_477_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 477 + 2] = rewr_functions::rewr_477_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 478 + 2] = rewr_functions::rewr_478_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 478 + 2] = rewr_functions::rewr_478_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 479 + 3] = rewr_functions::rewr_479_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 479 + 3] = rewr_functions::rewr_479_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 479 + 4] = rewr_functions::rewr_479_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 479 + 4] = rewr_functions::rewr_479_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 484 + 2] = rewr_functions::rewr_484_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 484 + 2] = rewr_functions::rewr_484_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 485 + 2] = rewr_functions::rewr_485_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 485 + 2] = rewr_functions::rewr_485_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 486 + 3] = rewr_functions::rewr_486_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 486 + 3] = rewr_functions::rewr_486_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 486 + 5] = rewr_functions::rewr_486_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 486 + 5] = rewr_functions::rewr_486_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 491 + 2] = rewr_functions::rewr_491_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 491 + 2] = rewr_functions::rewr_491_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 492 + 2] = rewr_functions::rewr_492_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 492 + 2] = rewr_functions::rewr_492_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 493 + 3] = rewr_functions::rewr_493_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 493 + 3] = rewr_functions::rewr_493_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 493 + 5] = rewr_functions::rewr_493_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 493 + 5] = rewr_functions::rewr_493_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 493 + 6] = rewr_functions::rewr_493_6_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 493 + 6] = rewr_functions::rewr_493_6_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 498 + 2] = rewr_functions::rewr_498_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 498 + 2] = rewr_functions::rewr_498_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 499 + 2] = rewr_functions::rewr_499_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 499 + 2] = rewr_functions::rewr_499_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 500 + 3] = rewr_functions::rewr_500_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 500 + 3] = rewr_functions::rewr_500_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 500 + 5] = rewr_functions::rewr_500_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 500 + 5] = rewr_functions::rewr_500_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 505 + 2] = rewr_functions::rewr_505_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 505 + 2] = rewr_functions::rewr_505_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 506 + 2] = rewr_functions::rewr_506_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 506 + 2] = rewr_functions::rewr_506_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 507 + 3] = rewr_functions::rewr_507_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 507 + 3] = rewr_functions::rewr_507_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 507 + 5] = rewr_functions::rewr_507_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 507 + 5] = rewr_functions::rewr_507_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 512 + 2] = rewr_functions::rewr_512_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 512 + 2] = rewr_functions::rewr_512_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 513 + 2] = rewr_functions::rewr_513_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 513 + 2] = rewr_functions::rewr_513_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 514 + 3] = rewr_functions::rewr_514_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 514 + 3] = rewr_functions::rewr_514_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 514 + 5] = rewr_functions::rewr_514_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 514 + 5] = rewr_functions::rewr_514_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 514 + 6] = rewr_functions::rewr_514_6_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 514 + 6] = rewr_functions::rewr_514_6_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 519 + 2] = rewr_functions::rewr_519_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 519 + 2] = rewr_functions::rewr_519_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 520 + 2] = rewr_functions::rewr_520_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 520 + 2] = rewr_functions::rewr_520_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 521 + 3] = rewr_functions::rewr_521_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 521 + 3] = rewr_functions::rewr_521_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 521 + 5] = rewr_functions::rewr_521_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 521 + 5] = rewr_functions::rewr_521_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 526 + 2] = rewr_functions::rewr_526_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 526 + 2] = rewr_functions::rewr_526_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 527 + 2] = rewr_functions::rewr_527_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 527 + 2] = rewr_functions::rewr_527_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 528 + 3] = rewr_functions::rewr_528_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 528 + 3] = rewr_functions::rewr_528_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 528 + 6] = rewr_functions::rewr_528_6_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 528 + 6] = rewr_functions::rewr_528_6_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 528 + 7] = rewr_functions::rewr_528_7_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 528 + 7] = rewr_functions::rewr_528_7_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 533 + 2] = rewr_functions::rewr_533_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 533 + 2] = rewr_functions::rewr_533_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 534 + 2] = rewr_functions::rewr_534_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 534 + 2] = rewr_functions::rewr_534_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 535 + 3] = rewr_functions::rewr_535_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 535 + 3] = rewr_functions::rewr_535_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 535 + 5] = rewr_functions::rewr_535_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 535 + 5] = rewr_functions::rewr_535_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 540 + 2] = rewr_functions::rewr_540_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 540 + 2] = rewr_functions::rewr_540_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 541 + 2] = rewr_functions::rewr_541_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 541 + 2] = rewr_functions::rewr_541_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 542 + 3] = rewr_functions::rewr_542_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 542 + 3] = rewr_functions::rewr_542_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 542 + 5] = rewr_functions::rewr_542_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 542 + 5] = rewr_functions::rewr_542_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 547 + 2] = rewr_functions::rewr_547_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 547 + 2] = rewr_functions::rewr_547_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 548 + 2] = rewr_functions::rewr_548_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 548 + 2] = rewr_functions::rewr_548_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 549 + 3] = rewr_functions::rewr_549_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 549 + 3] = rewr_functions::rewr_549_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 549 + 5] = rewr_functions::rewr_549_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 549 + 5] = rewr_functions::rewr_549_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 554 + 2] = rewr_functions::rewr_554_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 554 + 2] = rewr_functions::rewr_554_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 555 + 2] = rewr_functions::rewr_555_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 555 + 2] = rewr_functions::rewr_555_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 556 + 3] = rewr_functions::rewr_556_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 556 + 3] = rewr_functions::rewr_556_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 556 + 6] = rewr_functions::rewr_556_6_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 556 + 6] = rewr_functions::rewr_556_6_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 566 + 2] = rewr_functions::rewr_566_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 566 + 2] = rewr_functions::rewr_566_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 567 + 2] = rewr_functions::rewr_567_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 567 + 2] = rewr_functions::rewr_567_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 568 + 2] = rewr_functions::rewr_568_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 568 + 2] = rewr_functions::rewr_568_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 569 + 3] = rewr_functions::rewr_569_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 569 + 3] = rewr_functions::rewr_569_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 569 + 4] = rewr_functions::rewr_569_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 569 + 4] = rewr_functions::rewr_569_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 578 + 2] = rewr_functions::rewr_578_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 578 + 2] = rewr_functions::rewr_578_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 579 + 2] = rewr_functions::rewr_579_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 579 + 2] = rewr_functions::rewr_579_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 580 + 3] = rewr_functions::rewr_580_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 580 + 3] = rewr_functions::rewr_580_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 580 + 4] = rewr_functions::rewr_580_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 580 + 4] = rewr_functions::rewr_580_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 585 + 2] = rewr_functions::rewr_585_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 585 + 2] = rewr_functions::rewr_585_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 586 + 2] = rewr_functions::rewr_586_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 586 + 2] = rewr_functions::rewr_586_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 587 + 3] = rewr_functions::rewr_587_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 587 + 3] = rewr_functions::rewr_587_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 587 + 5] = rewr_functions::rewr_587_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 587 + 5] = rewr_functions::rewr_587_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 592 + 2] = rewr_functions::rewr_592_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 592 + 2] = rewr_functions::rewr_592_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 593 + 2] = rewr_functions::rewr_593_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 593 + 2] = rewr_functions::rewr_593_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 594 + 3] = rewr_functions::rewr_594_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 594 + 3] = rewr_functions::rewr_594_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 594 + 5] = rewr_functions::rewr_594_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 594 + 5] = rewr_functions::rewr_594_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 599 + 2] = rewr_functions::rewr_599_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 599 + 2] = rewr_functions::rewr_599_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 600 + 2] = rewr_functions::rewr_600_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 600 + 2] = rewr_functions::rewr_600_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 601 + 3] = rewr_functions::rewr_601_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 601 + 3] = rewr_functions::rewr_601_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 601 + 6] = rewr_functions::rewr_601_6_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 601 + 6] = rewr_functions::rewr_601_6_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 606 + 2] = rewr_functions::rewr_606_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 606 + 2] = rewr_functions::rewr_606_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 607 + 2] = rewr_functions::rewr_607_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 607 + 2] = rewr_functions::rewr_607_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 608 + 3] = rewr_functions::rewr_608_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 608 + 3] = rewr_functions::rewr_608_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 608 + 5] = rewr_functions::rewr_608_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 608 + 5] = rewr_functions::rewr_608_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 617 + 2] = rewr_functions::rewr_617_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 617 + 2] = rewr_functions::rewr_617_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 618 + 2] = rewr_functions::rewr_618_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 618 + 2] = rewr_functions::rewr_618_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 619 + 2] = rewr_functions::rewr_619_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 619 + 2] = rewr_functions::rewr_619_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 620 + 3] = rewr_functions::rewr_620_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 620 + 3] = rewr_functions::rewr_620_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 620 + 4] = rewr_functions::rewr_620_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 620 + 4] = rewr_functions::rewr_620_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 625 + 2] = rewr_functions::rewr_625_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 625 + 2] = rewr_functions::rewr_625_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 626 + 2] = rewr_functions::rewr_626_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 626 + 2] = rewr_functions::rewr_626_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 627 + 3] = rewr_functions::rewr_627_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 627 + 3] = rewr_functions::rewr_627_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 627 + 5] = rewr_functions::rewr_627_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 627 + 5] = rewr_functions::rewr_627_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 636 + 2] = rewr_functions::rewr_636_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 636 + 2] = rewr_functions::rewr_636_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 637 + 2] = rewr_functions::rewr_637_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 637 + 2] = rewr_functions::rewr_637_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 638 + 3] = rewr_functions::rewr_638_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 638 + 3] = rewr_functions::rewr_638_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 638 + 4] = rewr_functions::rewr_638_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 638 + 4] = rewr_functions::rewr_638_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 643 + 2] = rewr_functions::rewr_643_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 643 + 2] = rewr_functions::rewr_643_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 644 + 2] = rewr_functions::rewr_644_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 644 + 2] = rewr_functions::rewr_644_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 645 + 3] = rewr_functions::rewr_645_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 645 + 3] = rewr_functions::rewr_645_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 645 + 5] = rewr_functions::rewr_645_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 645 + 5] = rewr_functions::rewr_645_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 650 + 2] = rewr_functions::rewr_650_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 650 + 2] = rewr_functions::rewr_650_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 651 + 2] = rewr_functions::rewr_651_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 651 + 2] = rewr_functions::rewr_651_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 652 + 3] = rewr_functions::rewr_652_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 652 + 3] = rewr_functions::rewr_652_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 652 + 5] = rewr_functions::rewr_652_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 652 + 5] = rewr_functions::rewr_652_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 661 + 2] = rewr_functions::rewr_661_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 661 + 2] = rewr_functions::rewr_661_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 662 + 2] = rewr_functions::rewr_662_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 662 + 2] = rewr_functions::rewr_662_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 663 + 2] = rewr_functions::rewr_663_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 663 + 2] = rewr_functions::rewr_663_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 664 + 3] = rewr_functions::rewr_664_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 664 + 3] = rewr_functions::rewr_664_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 664 + 4] = rewr_functions::rewr_664_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 664 + 4] = rewr_functions::rewr_664_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 673 + 2] = rewr_functions::rewr_673_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 673 + 2] = rewr_functions::rewr_673_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 674 + 2] = rewr_functions::rewr_674_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 674 + 2] = rewr_functions::rewr_674_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 675 + 3] = rewr_functions::rewr_675_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 675 + 3] = rewr_functions::rewr_675_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 675 + 4] = rewr_functions::rewr_675_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 675 + 4] = rewr_functions::rewr_675_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 684 + 2] = rewr_functions::rewr_684_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 684 + 2] = rewr_functions::rewr_684_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 685 + 2] = rewr_functions::rewr_685_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 685 + 2] = rewr_functions::rewr_685_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 686 + 3] = rewr_functions::rewr_686_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 686 + 3] = rewr_functions::rewr_686_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 686 + 4] = rewr_functions::rewr_686_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 686 + 4] = rewr_functions::rewr_686_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 691 + 2] = rewr_functions::rewr_691_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 691 + 2] = rewr_functions::rewr_691_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 692 + 2] = rewr_functions::rewr_692_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 692 + 2] = rewr_functions::rewr_692_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 693 + 3] = rewr_functions::rewr_693_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 693 + 3] = rewr_functions::rewr_693_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 693 + 5] = rewr_functions::rewr_693_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 693 + 5] = rewr_functions::rewr_693_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 698 + 2] = rewr_functions::rewr_698_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 698 + 2] = rewr_functions::rewr_698_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 704 + 3] = rewr_functions::rewr_704_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 704 + 3] = rewr_functions::rewr_704_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 705 + 2] = rewr_functions::rewr_705_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 705 + 2] = rewr_functions::rewr_705_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 707 + 2] = rewr_functions::rewr_707_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 707 + 2] = rewr_functions::rewr_707_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 708 + 3] = rewr_functions::rewr_708_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 708 + 3] = rewr_functions::rewr_708_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 709 + 3] = rewr_functions::rewr_709_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 709 + 3] = rewr_functions::rewr_709_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 712 + 3] = rewr_functions::rewr_712_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 712 + 3] = rewr_functions::rewr_712_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 714 + 2] = rewr_functions::rewr_714_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 714 + 2] = rewr_functions::rewr_714_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 719 + 2] = rewr_functions::rewr_719_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 719 + 2] = rewr_functions::rewr_719_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 720 + 3] = rewr_functions::rewr_720_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 720 + 3] = rewr_functions::rewr_720_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 724 + 2] = rewr_functions::rewr_724_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 724 + 2] = rewr_functions::rewr_724_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 725 + 3] = rewr_functions::rewr_725_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 725 + 3] = rewr_functions::rewr_725_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 730 + 3] = rewr_functions::rewr_730_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 730 + 3] = rewr_functions::rewr_730_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 734 + 3] = rewr_functions::rewr_734_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 734 + 3] = rewr_functions::rewr_734_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 738 + 2] = rewr_functions::rewr_738_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 738 + 2] = rewr_functions::rewr_738_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 739 + 3] = rewr_functions::rewr_739_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 739 + 3] = rewr_functions::rewr_739_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 744 + 2] = rewr_functions::rewr_744_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 744 + 2] = rewr_functions::rewr_744_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 745 + 3] = rewr_functions::rewr_745_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 745 + 3] = rewr_functions::rewr_745_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 759 + 1] = rewr_functions::rewr_759_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 759 + 1] = rewr_functions::rewr_759_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 760 + 2] = rewr_functions::rewr_760_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 760 + 2] = rewr_functions::rewr_760_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 761 + 2] = rewr_functions::rewr_761_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 761 + 2] = rewr_functions::rewr_761_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 774 + 1] = rewr_functions::rewr_774_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 774 + 1] = rewr_functions::rewr_774_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 775 + 2] = rewr_functions::rewr_775_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 775 + 2] = rewr_functions::rewr_775_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 789 + 1] = rewr_functions::rewr_789_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 789 + 1] = rewr_functions::rewr_789_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 790 + 2] = rewr_functions::rewr_790_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 790 + 2] = rewr_functions::rewr_790_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 809 + 1] = rewr_functions::rewr_809_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 809 + 1] = rewr_functions::rewr_809_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 810 + 2] = rewr_functions::rewr_810_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 810 + 2] = rewr_functions::rewr_810_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 826 + 2] = rewr_functions::rewr_826_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 826 + 2] = rewr_functions::rewr_826_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 827 + 1] = rewr_functions::rewr_827_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 827 + 1] = rewr_functions::rewr_827_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 827 + 2] = rewr_functions::rewr_827_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 827 + 2] = rewr_functions::rewr_827_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 829 + 1] = rewr_functions::rewr_829_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 829 + 1] = rewr_functions::rewr_829_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 830 + 2] = rewr_functions::rewr_830_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 830 + 2] = rewr_functions::rewr_830_2_term_arg_in_normal_form;
}

#define INDEX_BOUND__ 825// These values are not used anymore.
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
      if (uint_address(arg0) == 0x5565840eb6b0) // F1
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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840ec970) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840ec580))), arg0, arg1);
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
    return *reinterpret_cast<const data_expression*>(0x55658444efd0);
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
      if (uint_address(arg1) == 0x5565840eb6b0) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x55658444fb90); // R1 []
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
      if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840ec970) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840ec8e0))), arg0, arg1);
  }

  static inline data_expression rewr_59_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_59_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_59_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_59_2(t[0], t[1], this_rewriter); }


  // [59] remove_token: Nat # List(Nat) -> List(Nat)
  static inline const data_expression& rewr_59_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565842ffcb0);
  }

  static inline data_expression rewr_59_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_59_0(this_rewriter); }

  static inline data_expression rewr_59_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_59_0(this_rewriter); }


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
      if (uint_address(arg1) == 0x5565840ec4f0) // F1
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
      if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840ec610) // F1
      {
        if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x5565840eba40) // F2b place_tokens
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840ec6a0))), arg0, arg1), local_rewrite(arg_not_nf2,this_rewriter));
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
      if (uint_address(arg1) == 0x5565840ec4f0) // F1
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
      if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840ec610) // F1
      {
        if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x5565840eba40) // F2b place_tokens
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840ec6a0))), arg0, arg1);
  }

  static inline data_expression rewr_55_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_55_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_55_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_55_2(t[0], t[1], this_rewriter); }


  // [55] add_tokens: (Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)
  static inline const data_expression& rewr_55_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565842ffaa0);
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
      if (uint_address(arg1) == 0x5565840ec4f0) // F1
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
      if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840ec610) // F1
      {
        if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x5565840eba40) // F2b place_tokens
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840ec520))), arg0, arg1), local_rewrite(arg_not_nf2,this_rewriter));
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
      if (uint_address(arg1) == 0x5565840ec4f0) // F1
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
      if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840ec610) // F1
      {
        if (is_application_no_check(down_cast<data_expression>(arg1[1])) && uint_address(down_cast<data_expression>(arg1[1])[0]) == 0x5565840eba40) // F2b place_tokens
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840ec520))), arg0, arg1);
  }

  static inline data_expression rewr_52_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_52_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_52_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_52_2(t[0], t[1], this_rewriter); }


  // [52] remove_tokens: (Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)
  static inline const data_expression& rewr_52_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658444f290);
  }

  static inline data_expression rewr_52_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_52_0(this_rewriter); }

  static inline data_expression rewr_52_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_52_0(this_rewriter); }


  // [809] @equal_arguments: MarkingTrans # MarkingTrans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_809_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565841904a0) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
        }
        else
        {
          if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565841904a0) // F1
          {
            const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
            const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
            return rewr_45_2(rewr_83_2(var_1, var_3,  this_rewriter), delayed_rewr_84_2<data_expression, data_expression>(var_2, var_4,  this_rewriter),  this_rewriter); // R1 @var_1 == @var_3 && @var_2 == @var_4
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
          return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584190560))), arg0, arg1);
  }

  static inline data_expression rewr_809_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_809_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_809_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_809_2(t[0], t[1], this_rewriter); }


  // [84] ==: Trans_name # Trans_name -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_84_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_84_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_84_2(m_t0, m_t1, this_rewriter);
      }
  };
  
  // [809] @equal_arguments: MarkingTrans # MarkingTrans -> Bool
  static inline const data_expression& rewr_809_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658444ef40);
  }

  static inline data_expression rewr_809_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_809_0(this_rewriter); }

  static inline data_expression rewr_809_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_809_0(this_rewriter); }


  // [808] @to_pos: MarkingTrans -> Pos
  template < class DATA_EXPR0>
  static inline data_expression rewr_808_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(marking_trans, @@N(@@R(1)), @@X)
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565841904a0) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x556584284750); // R1 1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584190530))), arg0);
  }

  static inline data_expression rewr_808_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_808_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_808_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_808_1(t[0], this_rewriter); }


  // [808] @to_pos: MarkingTrans -> Pos
  static inline const data_expression& rewr_808_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658444f2f0);
  }

  static inline data_expression rewr_808_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_808_0(this_rewriter); }

  static inline data_expression rewr_808_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_808_0(this_rewriter); }


  // [789] @equal_arguments: PlaceTokens # PlaceTokens -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_789_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840eba40) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
        }
        else
        {
          if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840eba40) // F1
          {
            const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
            const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
            return rewr_45_2(rewr_698_2(var_1, var_3,  this_rewriter), delayed_rewr_297_2<data_expression, data_expression>(var_2, var_4,  this_rewriter),  this_rewriter); // R1 @var_1 == @var_3 && @var_2 == @var_4
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
          return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658418f540))), arg0, arg1);
  }

  static inline data_expression rewr_789_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_789_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_789_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_789_2(t[0], t[1], this_rewriter); }


  // [297] ==: List(Nat) # List(Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_297_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_297_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_297_2(m_t0, m_t1, this_rewriter);
      }
  };
  
  // [789] @equal_arguments: PlaceTokens # PlaceTokens -> Bool
  static inline const data_expression& rewr_789_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584284780);
  }

  static inline data_expression rewr_789_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_789_0(this_rewriter); }

  static inline data_expression rewr_789_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_789_0(this_rewriter); }


  // [788] @to_pos: PlaceTokens -> Pos
  template < class DATA_EXPR0>
  static inline data_expression rewr_788_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(place_tokens, @@N(@@R(1)), @@X)
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840eba40) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x556584284750); // R1 1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658418f510))), arg0);
  }

  static inline data_expression rewr_788_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_788_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_788_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_788_1(t[0], this_rewriter); }


  // [788] @to_pos: PlaceTokens -> Pos
  static inline const data_expression& rewr_788_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658444f260);
  }

  static inline data_expression rewr_788_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_788_0(this_rewriter); }

  static inline data_expression rewr_788_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_788_0(this_rewriter); }


  // [769] @equal_arguments: Trans # Trans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_769_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840ebc80) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        const data_expression& var_3 = down_cast<data_expression>(arg0[3]); // S2
        const data_expression& var_4 = down_cast<data_expression>(arg0[4]); // S2
        const data_expression& var_5 = down_cast<data_expression>(arg0[5]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
        }
        else
        {
          if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840ebc80) // F1
          {
            const data_expression& var_6 = down_cast<data_expression>(arg1[1]); // S2
            const data_expression& var_7 = down_cast<data_expression>(arg1[2]); // S2
            const data_expression& var_8 = down_cast<data_expression>(arg1[3]); // S2
            const data_expression& var_9 = down_cast<data_expression>(arg1[4]); // S2
            const data_expression& var_10 = down_cast<data_expression>(arg1[5]); // S2
            return rewr_45_2(rewr_84_2(var_1, var_6,  this_rewriter), delayed_rewr_45_2<delayed_rewr_401_2<data_expression, data_expression>, delayed_rewr_45_2<delayed_rewr_35_2<data_expression, data_expression>, delayed_rewr_45_2<delayed_rewr_263_2<data_expression, data_expression>, delayed_rewr_263_2<data_expression, data_expression>>>>(delayed_rewr_401_2<data_expression, data_expression>(var_2, var_7,  this_rewriter), delayed_rewr_45_2<delayed_rewr_35_2<data_expression, data_expression>, delayed_rewr_45_2<delayed_rewr_263_2<data_expression, data_expression>, delayed_rewr_263_2<data_expression, data_expression>>>(delayed_rewr_35_2<data_expression, data_expression>(var_3, var_8,  this_rewriter), delayed_rewr_45_2<delayed_rewr_263_2<data_expression, data_expression>, delayed_rewr_263_2<data_expression, data_expression>>(delayed_rewr_263_2<data_expression, data_expression>(var_4, var_9,  this_rewriter), delayed_rewr_263_2<data_expression, data_expression>(var_5, var_10,  this_rewriter),  this_rewriter),  this_rewriter),  this_rewriter),  this_rewriter); // R1 @var_1 == @var_6 && @var_2 == @var_7 && @var_3 == @var_8 && @var_4 == @var_9 && @var_5 == @var_10
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
          return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658418e790))), arg0, arg1);
  }

  static inline data_expression rewr_769_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_769_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_769_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_769_2(t[0], t[1], this_rewriter); }


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
  
  // [263] ==: List(PlaceTokens) # List(PlaceTokens) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_263_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_263_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_263_2(m_t0, m_t1, this_rewriter);
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
  
  // [401] ==: Bool # Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_401_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_401_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_401_2(m_t0, m_t1, this_rewriter);
      }
  };
  
  // [769] @equal_arguments: Trans # Trans -> Bool
  static inline const data_expression& rewr_769_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584284640);
  }

  static inline data_expression rewr_769_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_769_0(this_rewriter); }

  static inline data_expression rewr_769_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_769_0(this_rewriter); }


  // [768] @to_pos: Trans -> Pos
  template < class DATA_EXPR0>
  static inline data_expression rewr_768_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(trans, @@N(@@N(@@N(@@N(@@R(1))))), @@X)
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840ebc80) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x556584284750); // R1 1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658418e760))), arg0);
  }

  static inline data_expression rewr_768_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_768_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_768_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_768_1(t[0], this_rewriter); }


  // [768] @to_pos: Trans -> Pos
  static inline const data_expression& rewr_768_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658444fce0);
  }

  static inline data_expression rewr_768_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_768_0(this_rewriter); }

  static inline data_expression rewr_768_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_768_0(this_rewriter); }


  // [57] to: Trans -> List(PlaceTokens)
  template < class DATA_EXPR0>
  static inline data_expression rewr_57_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(trans, @@N(@@N(@@N(@@N(@@S(@var_4, @@R(@var_4)))))), @@X)
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840ebc80) // F1
      {
        const data_expression& var_4 = down_cast<data_expression>(arg0[5]); // S2
        return var_4; // R1 @var_4
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840ec7c0))), arg0);
  }

  static inline data_expression rewr_57_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_57_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_57_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_57_1(t[0], this_rewriter); }


  // [57] to: Trans -> List(PlaceTokens)
  static inline const data_expression& rewr_57_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658427ed60);
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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840ebc80) // F1
      {
        const data_expression& var_3 = down_cast<data_expression>(arg0[4]); // S2
        return var_3; // R1 @var_3
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840ec0a0))), arg0);
  }

  static inline data_expression rewr_42_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_42_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_42_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_42_1(t[0], this_rewriter); }


  // [42] from: Trans -> List(PlaceTokens)
  static inline const data_expression& rewr_42_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658444f230);
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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840ebc80) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[2]); // S2
        return var_1; // R1 @var_1
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840ebfe0))), arg0);
  }

  static inline data_expression rewr_40_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_40_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_40_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_40_1(t[0], this_rewriter); }


  // [40] guard: Trans -> Bool
  static inline const data_expression& rewr_40_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658427ed30);
  }

  static inline data_expression rewr_40_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_40_0(this_rewriter); }

  static inline data_expression rewr_40_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_40_0(this_rewriter); }


  // [75] trans_name: Trans -> Trans_name
  template < class DATA_EXPR0>
  static inline data_expression rewr_75_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(trans, @@S(@var_0, @@N(@@N(@@N(@@N(@@R(@var_0)))))), @@X)
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840ebc80) // F1
      {
        const data_expression& var_0 = down_cast<data_expression>(arg0[1]); // S2
        return var_0; // R1 @var_0
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840ecfd0))), arg0);
  }

  static inline data_expression rewr_75_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_75_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_75_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_75_1(t[0], this_rewriter); }


  // [75] trans_name: Trans -> Trans_name
  static inline const data_expression& rewr_75_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565842ffce0);
  }

  static inline data_expression rewr_75_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_75_0(this_rewriter); }

  static inline data_expression rewr_75_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_75_0(this_rewriter); }


  // [754] @equal_arguments: Trans_name # Trans_name -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_754_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

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
      if (uint_address(arg0) == 0x5565840ebc50) // F1
      {
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
        }
        else
        {
          if (uint_address(arg1) == 0x5565840ebc50) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
          }
          else
          {
          }
        }
      }
      else
      {
        if (uint_address(arg0) == 0x5565840ebf50) // F1
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
          }
          else
          {
            if (uint_address(arg1) == 0x5565840ebf50) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
            }
            else
            {
            }
          }
        }
        else
        {
          if (uint_address(arg0) == 0x5565840ebd40) // F1
          {
            if (var_0 == arg1) // M
            {
              return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
            }
            else
            {
              if (uint_address(arg1) == 0x5565840ebd40) // F1
              {
                return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
              }
              else
              {
              }
            }
          }
          else
          {
            if (uint_address(arg0) == 0x5565840ebec0) // F1
            {
              if (var_0 == arg1) // M
              {
                return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
              }
              else
              {
                if (uint_address(arg1) == 0x5565840ebec0) // F1
                {
                  return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
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
                return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
              }
              else
              {
              }
            }
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658418d4a0))), arg0, arg1);
  }

  static inline data_expression rewr_754_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_754_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_754_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_754_2(t[0], t[1], this_rewriter); }


  // [754] @equal_arguments: Trans_name # Trans_name -> Bool
  static inline const data_expression& rewr_754_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658427eca0);
  }

  static inline data_expression rewr_754_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_754_0(this_rewriter); }

  static inline data_expression rewr_754_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_754_0(this_rewriter); }


  // [753] @to_pos: Trans_name -> Pos
  template < class DATA_EXPR0>
  static inline data_expression rewr_753_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(t3, @@R(4), @@F(t0, @@R(1), @@F(t2, @@R(3), @@F(t1, @@R(2), @@X))))
    {
      if (uint_address(arg0) == 0x5565840ebc50) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x5565842846a0); // R1 4
      }
      else
      {
        if (uint_address(arg0) == 0x5565840ebf50) // F1
        {
          return *reinterpret_cast<const data_expression*>(0x556584284750); // R1 1
        }
        else
        {
          if (uint_address(arg0) == 0x5565840ebd40) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x55658427ed00); // R1 3
          }
          else
          {
            if (uint_address(arg0) == 0x5565840ebec0) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55658427ecd0); // R1 2
            }
            else
            {
            }
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658418d470))), arg0);
  }

  static inline data_expression rewr_753_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_753_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_753_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_753_1(t[0], this_rewriter); }


  // [753] @to_pos: Trans_name -> Pos
  static inline const data_expression& rewr_753_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584451160);
  }

  static inline data_expression rewr_753_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_753_0(this_rewriter); }

  static inline data_expression rewr_753_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_753_0(this_rewriter); }


  // [740] @less_arguments: Place # Place -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_740_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@F(p5, @@D(@@N(@@F(p5, @@R(false), @@X))), @@F(p0, @@D(@@N(@@F(p0, @@R(false), @@X))), @@F(p4, @@D(@@N(@@F(p4, @@R(false), @@X))), @@F(p1, @@D(@@N(@@F(p1, @@R(false), @@X))), @@F(p3, @@D(@@N(@@F(p3, @@R(false), @@X))), @@F(p2, @@D(@@N(@@F(p2, @@R(false), @@X))), @@X))))))
    {
      if (uint_address(arg0) == 0x5565840eba10) // F1
      {
        if (uint_address(arg1) == 0x5565840eba10) // F1
        {
          return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
        }
        else
        {
        }
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb680) // F1
        {
          if (uint_address(arg1) == 0x5565840eb680) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
          }
          else
          {
          }
        }
        else
        {
          if (uint_address(arg0) == 0x5565840ebb00) // F1
          {
            if (uint_address(arg1) == 0x5565840ebb00) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
            }
            else
            {
            }
          }
          else
          {
            if (uint_address(arg0) == 0x5565840ebda0) // F1
            {
              if (uint_address(arg1) == 0x5565840ebda0) // F1
              {
                return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
              }
              else
              {
              }
            }
            else
            {
              if (uint_address(arg0) == 0x5565840ebb90) // F1
              {
                if (uint_address(arg1) == 0x5565840ebb90) // F1
                {
                  return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
                }
                else
                {
                }
              }
              else
              {
                if (uint_address(arg0) == 0x5565840ebce0) // F1
                {
                  if (uint_address(arg1) == 0x5565840ebce0) // F1
                  {
                    return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658418c660))), arg0, arg1);
  }

  static inline data_expression rewr_740_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_740_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_740_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_740_2(t[0], t[1], this_rewriter); }


  // [740] @less_arguments: Place # Place -> Bool
  static inline const data_expression& rewr_740_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565842847b0);
  }

  static inline data_expression rewr_740_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_740_0(this_rewriter); }

  static inline data_expression rewr_740_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_740_0(this_rewriter); }


  // [739] @equal_arguments: Place # Place -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_739_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

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
      if (uint_address(arg0) == 0x5565840eba10) // F1
      {
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
        }
        else
        {
          if (uint_address(arg1) == 0x5565840eba10) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
          }
          else
          {
          }
        }
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb680) // F1
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
          }
          else
          {
            if (uint_address(arg1) == 0x5565840eb680) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
            }
            else
            {
            }
          }
        }
        else
        {
          if (uint_address(arg0) == 0x5565840ebb00) // F1
          {
            if (var_0 == arg1) // M
            {
              return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
            }
            else
            {
              if (uint_address(arg1) == 0x5565840ebb00) // F1
              {
                return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
              }
              else
              {
              }
            }
          }
          else
          {
            if (uint_address(arg0) == 0x5565840ebda0) // F1
            {
              if (var_0 == arg1) // M
              {
                return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
              }
              else
              {
                if (uint_address(arg1) == 0x5565840ebda0) // F1
                {
                  return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
                }
                else
                {
                }
              }
            }
            else
            {
              if (uint_address(arg0) == 0x5565840ebb90) // F1
              {
                if (var_0 == arg1) // M
                {
                  return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
                }
                else
                {
                  if (uint_address(arg1) == 0x5565840ebb90) // F1
                  {
                    return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
                  }
                  else
                  {
                  }
                }
              }
              else
              {
                if (uint_address(arg0) == 0x5565840ebce0) // F1
                {
                  if (var_0 == arg1) // M
                  {
                    return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
                  }
                  else
                  {
                    if (uint_address(arg1) == 0x5565840ebce0) // F1
                    {
                      return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
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
                    return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658418c630))), arg0, arg1);
  }

  static inline data_expression rewr_739_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_739_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_739_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_739_2(t[0], t[1], this_rewriter); }


  // [739] @equal_arguments: Place # Place -> Bool
  static inline const data_expression& rewr_739_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565843bf0a0);
  }

  static inline data_expression rewr_739_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_739_0(this_rewriter); }

  static inline data_expression rewr_739_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_739_0(this_rewriter); }


  // [738] @to_pos: Place -> Pos
  template < class DATA_EXPR0>
  static inline data_expression rewr_738_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(p5, @@R(6), @@F(p0, @@R(1), @@F(p4, @@R(5), @@F(p1, @@R(2), @@F(p3, @@R(4), @@F(p2, @@R(3), @@X))))))
    {
      if (uint_address(arg0) == 0x5565840eba10) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x5565843bef30); // R1 6
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb680) // F1
        {
          return *reinterpret_cast<const data_expression*>(0x556584284750); // R1 1
        }
        else
        {
          if (uint_address(arg0) == 0x5565840ebb00) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x55658427ede0); // R1 5
          }
          else
          {
            if (uint_address(arg0) == 0x5565840ebda0) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55658427ecd0); // R1 2
            }
            else
            {
              if (uint_address(arg0) == 0x5565840ebb90) // F1
              {
                return *reinterpret_cast<const data_expression*>(0x5565842846a0); // R1 4
              }
              else
              {
                if (uint_address(arg0) == 0x5565840ebce0) // F1
                {
                  return *reinterpret_cast<const data_expression*>(0x55658427ed00); // R1 3
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658418c600))), arg0);
  }

  static inline data_expression rewr_738_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_738_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_738_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_738_1(t[0], this_rewriter); }


  // [738] @to_pos: Place -> Pos
  static inline const data_expression& rewr_738_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584284610);
  }

  static inline data_expression rewr_738_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_738_0(this_rewriter); }

  static inline data_expression rewr_738_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_738_0(this_rewriter); }


  // [724] if: Bool # @NatPair # @NatPair -> @NatPair
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_724_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658418b9a0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_724_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_724_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_724_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_724_3(t[0], t[1], t[2], this_rewriter); }


  // [724] if: Bool # @NatPair # @NatPair -> @NatPair
  static inline const data_expression& rewr_724_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658444f410);
  }

  static inline data_expression rewr_724_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_724_0(this_rewriter); }

  static inline data_expression rewr_724_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_724_0(this_rewriter); }


  // [723] !=: @NatPair # @NatPair -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_723_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_692_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658418b970))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_723_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_723_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_723_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_723_2(t[0], t[1], this_rewriter); }


  // [723] !=: @NatPair # @NatPair -> Bool
  static inline const data_expression& rewr_723_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565843bef60);
  }

  static inline data_expression rewr_723_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_723_0(this_rewriter); }

  static inline data_expression rewr_723_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_723_0(this_rewriter); }


  // [692] ==: @NatPair # @NatPair -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_692_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840ef0a0) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
        }
        else
        {
          if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840ef0a0) // F1
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
          return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584189bd0))), arg0, arg1);
  }

  static inline data_expression rewr_692_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_692_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_692_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_692_2(t[0], t[1], this_rewriter); }


  // [692] ==: @NatPair # @NatPair -> Bool
  static inline const data_expression& rewr_692_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565843bf020);
  }

  static inline data_expression rewr_692_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_692_0(this_rewriter); }

  static inline data_expression rewr_692_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_692_0(this_rewriter); }


  // [718] if: Bool # MarkingTrans # MarkingTrans -> MarkingTrans
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_718_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658418b670))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_718_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_718_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_718_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_718_3(t[0], t[1], t[2], this_rewriter); }


  // [718] if: Bool # MarkingTrans # MarkingTrans -> MarkingTrans
  static inline const data_expression& rewr_718_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565843bef00);
  }

  static inline data_expression rewr_718_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_718_0(this_rewriter); }

  static inline data_expression rewr_718_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_718_0(this_rewriter); }


  // [717] !=: MarkingTrans # MarkingTrans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_717_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_676_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658418b640))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_717_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_717_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_717_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_717_2(t[0], t[1], this_rewriter); }


  // [717] !=: MarkingTrans # MarkingTrans -> Bool
  static inline const data_expression& rewr_717_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658427ec30);
  }

  static inline data_expression rewr_717_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_717_0(this_rewriter); }

  static inline data_expression rewr_717_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_717_0(this_rewriter); }


  // [676] ==: MarkingTrans # MarkingTrans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_676_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

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
      if (rewr_331_2(delayed_rewr_808_1<data_expression>(var_0,  this_rewriter), delayed_rewr_808_1<data_expression>(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
      {
        return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
      }
      else
      {
        if (rewr_542_2(rewr_808_1(var_0,  this_rewriter), rewr_808_1(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
        {
          return rewr_809_2(var_0, var_1,  this_rewriter); // R1 @equal_arguments(@var_0, @var_1)
        }
        else
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415f7b0))), arg0, arg1);
  }

  static inline data_expression rewr_676_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_676_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_676_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_676_2(t[0], t[1], this_rewriter); }


  // [808] @to_pos: MarkingTrans -> Pos
  template < class DATA_EXPR0>
  class delayed_rewr_808_1
  {
    protected:
      const DATA_EXPR0& m_t0;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_808_1(const DATA_EXPR0& t0, RewriterCompilingJitty* tr)
        : m_t0(t0), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_808_1(m_t0, this_rewriter);
      }
  };
  
  // [676] ==: MarkingTrans # MarkingTrans -> Bool
  static inline const data_expression& rewr_676_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565844844a0);
  }

  static inline data_expression rewr_676_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_676_0(this_rewriter); }

  static inline data_expression rewr_676_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_676_0(this_rewriter); }


  // [713] if: Bool # Trans # Trans -> Trans
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_713_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658418b430))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_713_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_713_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_713_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_713_3(t[0], t[1], t[2], this_rewriter); }


  // [713] if: Bool # Trans # Trans -> Trans
  static inline const data_expression& rewr_713_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484810);
  }

  static inline data_expression rewr_713_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_713_0(this_rewriter); }

  static inline data_expression rewr_713_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_713_0(this_rewriter); }


  // [424] !=: Trans # Trans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_424_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_80_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584156120))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_424_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_424_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_424_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_424_2(t[0], t[1], this_rewriter); }


  // [424] !=: Trans # Trans -> Bool
  static inline const data_expression& rewr_424_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484840);
  }

  static inline data_expression rewr_424_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_424_0(this_rewriter); }

  static inline data_expression rewr_424_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_424_0(this_rewriter); }


  // [80] ==: Trans # Trans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_80_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

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
      if (rewr_331_2(delayed_rewr_768_1<data_expression>(var_0,  this_rewriter), delayed_rewr_768_1<data_expression>(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
      {
        return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
      }
      else
      {
        if (rewr_542_2(rewr_768_1(var_0,  this_rewriter), rewr_768_1(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
        {
          return rewr_769_2(var_0, var_1,  this_rewriter); // R1 @equal_arguments(@var_0, @var_1)
        }
        else
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840ed540))), arg0, arg1);
  }

  static inline data_expression rewr_80_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_80_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_80_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_80_2(t[0], t[1], this_rewriter); }


  // [768] @to_pos: Trans -> Pos
  template < class DATA_EXPR0>
  class delayed_rewr_768_1
  {
    protected:
      const DATA_EXPR0& m_t0;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_768_1(const DATA_EXPR0& t0, RewriterCompilingJitty* tr)
        : m_t0(t0), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_768_1(m_t0, this_rewriter);
      }
  };
  
  // [80] ==: Trans # Trans -> Bool
  static inline const data_expression& rewr_80_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584284670);
  }

  static inline data_expression rewr_80_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_80_0(this_rewriter); }

  static inline data_expression rewr_80_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_80_0(this_rewriter); }


  // [709] if: Bool # PlaceTokens # PlaceTokens -> PlaceTokens
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_709_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658418b220))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_709_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_709_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_709_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_709_3(t[0], t[1], t[2], this_rewriter); }


  // [709] if: Bool # PlaceTokens # PlaceTokens -> PlaceTokens
  static inline const data_expression& rewr_709_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484110);
  }

  static inline data_expression rewr_709_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_709_0(this_rewriter); }

  static inline data_expression rewr_709_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_709_0(this_rewriter); }


  // [361] !=: PlaceTokens # PlaceTokens -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_361_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_264_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f58b0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_361_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_361_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_361_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_361_2(t[0], t[1], this_rewriter); }


  // [361] !=: PlaceTokens # PlaceTokens -> Bool
  static inline const data_expression& rewr_361_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565844845d0);
  }

  static inline data_expression rewr_361_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_361_0(this_rewriter); }

  static inline data_expression rewr_361_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_361_0(this_rewriter); }


  // [264] ==: PlaceTokens # PlaceTokens -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_264_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

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
      if (rewr_331_2(delayed_rewr_788_1<data_expression>(var_0,  this_rewriter), delayed_rewr_788_1<data_expression>(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
      {
        return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
      }
      else
      {
        if (rewr_542_2(rewr_788_1(var_0,  this_rewriter), rewr_788_1(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
        {
          return rewr_789_2(var_0, var_1,  this_rewriter); // R1 @equal_arguments(@var_0, @var_1)
        }
        else
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f0e70))), arg0, arg1);
  }

  static inline data_expression rewr_264_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_264_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_264_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_264_2(t[0], t[1], this_rewriter); }


  // [788] @to_pos: PlaceTokens -> Pos
  template < class DATA_EXPR0>
  class delayed_rewr_788_1
  {
    protected:
      const DATA_EXPR0& m_t0;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_788_1(const DATA_EXPR0& t0, RewriterCompilingJitty* tr)
        : m_t0(t0), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_788_1(m_t0, this_rewriter);
      }
  };
  
  // [264] ==: PlaceTokens # PlaceTokens -> Bool
  static inline const data_expression& rewr_264_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484630);
  }

  static inline data_expression rewr_264_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_264_0(this_rewriter); }

  static inline data_expression rewr_264_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_264_0(this_rewriter); }


  // [704] if: Bool # Trans_name # Trans_name -> Trans_name
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_704_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658418af20))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_704_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_704_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_704_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_704_3(t[0], t[1], t[2], this_rewriter); }


  // [704] if: Bool # Trans_name # Trans_name -> Trans_name
  static inline const data_expression& rewr_704_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658444fae0);
  }

  static inline data_expression rewr_704_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_704_0(this_rewriter); }

  static inline data_expression rewr_704_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_704_0(this_rewriter); }


  // [703] !=: Trans_name # Trans_name -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_703_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_84_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658418aef0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_703_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_703_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_703_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_703_2(t[0], t[1], this_rewriter); }


  // [703] !=: Trans_name # Trans_name -> Bool
  static inline const data_expression& rewr_703_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565843beff0);
  }

  static inline data_expression rewr_703_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_703_0(this_rewriter); }

  static inline data_expression rewr_703_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_703_0(this_rewriter); }


  // [84] ==: Trans_name # Trans_name -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_84_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

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
      if (rewr_331_2(delayed_rewr_753_1<data_expression>(var_0,  this_rewriter), delayed_rewr_753_1<data_expression>(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
      {
        return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
      }
      else
      {
        if (rewr_542_2(rewr_753_1(var_0,  this_rewriter), rewr_753_1(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
        {
          return rewr_754_2(var_0, var_1,  this_rewriter); // R1 @equal_arguments(@var_0, @var_1)
        }
        else
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840eda50))), arg0, arg1);
  }

  static inline data_expression rewr_84_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_84_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_84_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_84_2(t[0], t[1], this_rewriter); }


  // [753] @to_pos: Trans_name -> Pos
  template < class DATA_EXPR0>
  class delayed_rewr_753_1
  {
    protected:
      const DATA_EXPR0& m_t0;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_753_1(const DATA_EXPR0& t0, RewriterCompilingJitty* tr)
        : m_t0(t0), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_753_1(m_t0, this_rewriter);
      }
  };
  
  // [84] ==: Trans_name # Trans_name -> Bool
  static inline const data_expression& rewr_84_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565844840e0);
  }

  static inline data_expression rewr_84_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_84_0(this_rewriter); }

  static inline data_expression rewr_84_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_84_0(this_rewriter); }


  // [699] if: Bool # Place # Place -> Place
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_699_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658418ace0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_699_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_699_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_699_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_699_3(t[0], t[1], t[2], this_rewriter); }


  // [699] if: Bool # Place # Place -> Place
  static inline const data_expression& rewr_699_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484530);
  }

  static inline data_expression rewr_699_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_699_0(this_rewriter); }

  static inline data_expression rewr_699_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_699_0(this_rewriter); }


  // [698] ==: Place # Place -> Bool
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
      if (rewr_331_2(delayed_rewr_738_1<data_expression>(var_0,  this_rewriter), delayed_rewr_738_1<data_expression>(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
      {
        return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
      }
      else
      {
        if (rewr_542_2(rewr_738_1(var_0,  this_rewriter), rewr_738_1(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
        {
          return rewr_739_2(var_0, var_1,  this_rewriter); // R1 @equal_arguments(@var_0, @var_1)
        }
        else
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658418acb0))), arg0, arg1);
  }

  static inline data_expression rewr_698_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_698_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_698_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_698_2(t[0], t[1], this_rewriter); }


  // [738] @to_pos: Place -> Pos
  template < class DATA_EXPR0>
  class delayed_rewr_738_1
  {
    protected:
      const DATA_EXPR0& m_t0;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_738_1(const DATA_EXPR0& t0, RewriterCompilingJitty* tr)
        : m_t0(t0), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_738_1(m_t0, this_rewriter);
      }
  };
  
  // [698] ==: Place # Place -> Bool
  static inline const data_expression& rewr_698_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484600);
  }

  static inline data_expression rewr_698_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_698_0(this_rewriter); }

  static inline data_expression rewr_698_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_698_0(this_rewriter); }


  // [313] !=: Place # Place -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_313_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_698_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f3b10))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_313_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_313_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_313_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_313_2(t[0], t[1], this_rewriter); }


  // [313] !=: Place # Place -> Bool
  static inline const data_expression& rewr_313_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565842e1400);
  }

  static inline data_expression rewr_313_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_313_0(this_rewriter); }

  static inline data_expression rewr_313_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_313_0(this_rewriter); }


  // [312] <: Place # Place -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_312_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

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
      if (rewr_697_2(delayed_rewr_738_1<data_expression>(var_0,  this_rewriter), delayed_rewr_738_1<data_expression>(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
      {
        return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
      }
      else
      {
        if (rewr_542_2(rewr_738_1(var_0,  this_rewriter), rewr_738_1(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
        {
          return rewr_740_2(var_0, var_1,  this_rewriter); // R1 @less_arguments(@var_0, @var_1)
        }
        else
        {
          if (rewr_101_2(delayed_rewr_738_1<data_expression>(var_0,  this_rewriter), rewr_738_1(var_1,  this_rewriter),  this_rewriter) == sort_bool::true_()) // C
          {
            return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
          }
          else
          {
            if (var_0 == arg1) // M
            {
              return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
            }
            else
            {
            }
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f3a80))), arg0, arg1);
  }

  static inline data_expression rewr_312_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_312_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_312_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_312_2(t[0], t[1], this_rewriter); }


  // [312] <: Place # Place -> Bool
  static inline const data_expression& rewr_312_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658444fbc0);
  }

  static inline data_expression rewr_312_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_312_0(this_rewriter); }

  static inline data_expression rewr_312_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_312_0(this_rewriter); }


  // [697] >: Pos # Pos -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_697_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(@var_1 < @var_0))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_101_2(var_1, local_rewrite(var_0, this_rewriter),  this_rewriter); // R1 @var_1 < @var_0
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658418ab30))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_697_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_697_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_697_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_697_2(t[0], t[1], this_rewriter); }


  // [697] >: Pos # Pos -> Bool
  static inline const data_expression& rewr_697_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565844847a0);
  }

  static inline data_expression rewr_697_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_697_0(this_rewriter); }

  static inline data_expression rewr_697_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_697_0(this_rewriter); }


  // [690] if: Bool # Pos # Pos -> Pos
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_690_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584188c10))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_690_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_690_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_690_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_690_3(t[0], t[1], t[2], this_rewriter); }


  // [690] if: Bool # Pos # Pos -> Pos
  static inline const data_expression& rewr_690_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484660);
  }

  static inline data_expression rewr_690_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_690_0(this_rewriter); }

  static inline data_expression rewr_690_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_690_0(this_rewriter); }


  // [685] <=: Pos # Pos -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_685_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(1, @@D(@@N(@@S(@var_0, @@R(true)))), @@X)
    {
      if (uint_address(arg0) == 0x5565840ed210) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840eecb0) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
        }
        else
        {
          if (uint_address(arg1) == 0x5565840ed210) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840ed270) // F1
            {
              const data_expression& var_2 = down_cast<data_expression>(arg1[1]); // S2
              const data_expression& var_3 = down_cast<data_expression>(arg1[2]); // S2
              return rewr_101_2(var_1, rewr_78_2(var_2, var_3,  this_rewriter),  this_rewriter); // R1 @var_1 < 2 * @var_3 + if(@var_2, 1, 0)
            }
            else
            {
            }
          }
        }
      }
      else
      {
        if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840ed270) // F1
        {
          const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
          const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840eecb0) // F1
            {
              const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
              return rewr_685_2(rewr_112_1(rewr_78_2(var_1, var_2,  this_rewriter),  this_rewriter), var_3,  this_rewriter); // R1 @pospred(2 * @var_2 + if(@var_1, 1, 0)) <= @var_3
            }
            else
            {
              if (uint_address(arg1) == 0x5565840ed210) // F1
              {
                return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
              }
              else
              {
                if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840ed270) // F1
                {
                  const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
                  const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
                  return rewr_97_3(rewr_44_2(var_1, var_3,  this_rewriter), delayed_rewr_685_2<data_expression, data_expression>(var_2, var_4,  this_rewriter), delayed_rewr_101_2<data_expression, data_expression>(var_2, var_4,  this_rewriter),  this_rewriter); // R1 if(@var_1 => @var_3, @var_2 <= @var_4, @var_2 < @var_4)
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
            return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584187e30))), arg0, arg1);
  }

  static inline data_expression rewr_685_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_685_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_685_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_685_2(t[0], t[1], this_rewriter); }


  // [101] <: Pos # Pos -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_101_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_101_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_101_2(m_t0, m_t1, this_rewriter);
      }
  };
  
  // [685] <=: Pos # Pos -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_685_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_685_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_685_2(m_t0, m_t1, this_rewriter);
      }
  };
  
  // [685] <=: Pos # Pos -> Bool
  static inline const data_expression& rewr_685_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565842e1340);
  }

  static inline data_expression rewr_685_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_685_0(this_rewriter); }

  static inline data_expression rewr_685_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_685_0(this_rewriter); }


  // [542] ==: Pos # Pos -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_542_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840ed270) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        if (uint_address(arg0[1]) == 0x5565840eb7a0) // F2a true
        {
          const data_expression& t1 = down_cast<data_expression>(arg0[1]);
          const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
          }
          else
          {
            if (uint_address(arg1) == 0x5565840ed210) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
            }
            else
            {
              if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840ed270) // F1
              {
                if (var_1 == arg1[1]) // M
                {
                  if (uint_address(arg1[1]) == 0x5565840ed240) // F2a false
                  {
                    const data_expression& t3 = down_cast<data_expression>(arg1[1]);
                    return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
                  }
                  else
                  {
                    const data_expression& var_3 = down_cast<data_expression>(arg1[2]); // S2
                    return rewr_542_2(var_2, var_3,  this_rewriter); // R1 @var_2 == @var_3
                  }
                }
                else
                {
                  if (uint_address(arg1[1]) == 0x5565840ed240) // F2a false
                  {
                    const data_expression& t3 = down_cast<data_expression>(arg1[1]);
                    return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
                  }
                  else
                  {
                  }
                }
              }
              else
              {
                if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840eecb0) // F1
                {
                  const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
                  return rewr_542_2(rewr_112_1(rewr_78_2(var_1, var_2,  this_rewriter),  this_rewriter), var_3,  this_rewriter); // R1 @pospred(2 * @var_2 + if(@var_1, 1, 0)) == @var_3
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
          if (uint_address(arg0[1]) == 0x5565840ed240) // F2a false
          {
            const data_expression& t1 = down_cast<data_expression>(arg0[1]);
            const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
            if (var_0 == arg1) // M
            {
              return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
            }
            else
            {
              if (uint_address(arg1) == 0x5565840ed210) // F1
              {
                return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
              }
              else
              {
                if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840ed270) // F1
                {
                  if (var_1 == arg1[1]) // M
                  {
                    if (uint_address(arg1[1]) == 0x5565840eb7a0) // F2a true
                    {
                      const data_expression& t3 = down_cast<data_expression>(arg1[1]);
                      return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
                    }
                    else
                    {
                      const data_expression& var_3 = down_cast<data_expression>(arg1[2]); // S2
                      return rewr_542_2(var_2, var_3,  this_rewriter); // R1 @var_2 == @var_3
                    }
                  }
                  else
                  {
                    if (uint_address(arg1[1]) == 0x5565840eb7a0) // F2a true
                    {
                      const data_expression& t3 = down_cast<data_expression>(arg1[1]);
                      return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
                    }
                    else
                    {
                    }
                  }
                }
                else
                {
                  if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840eecb0) // F1
                  {
                    const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
                    return rewr_542_2(rewr_112_1(rewr_78_2(var_1, var_2,  this_rewriter),  this_rewriter), var_3,  this_rewriter); // R1 @pospred(2 * @var_2 + if(@var_1, 1, 0)) == @var_3
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
              return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
            }
            else
            {
              if (uint_address(arg1) == 0x5565840ed210) // F1
              {
                return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
              }
              else
              {
                if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840eecb0) // F1
                {
                  const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
                  return rewr_542_2(rewr_112_1(rewr_78_2(var_1, var_2,  this_rewriter),  this_rewriter), var_3,  this_rewriter); // R1 @pospred(2 * @var_2 + if(@var_1, 1, 0)) == @var_3
                }
                else
                {
                  if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840ed270) // F1
                  {
                    if (var_1 == arg1[1]) // M
                    {
                      const data_expression& var_3 = down_cast<data_expression>(arg1[2]); // S2
                      return rewr_542_2(var_2, var_3,  this_rewriter); // R1 @var_2 == @var_3
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
        if (uint_address(arg0) == 0x5565840ed210) // F1
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840eecb0) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
            }
            else
            {
              if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840ed270) // F1
              {
                return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
              }
              else
              {
              }
            }
          }
        }
        else
        {
          if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840eecb0) // F1
          {
            const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
            if (var_0 == arg1) // M
            {
              return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
            }
            else
            {
              if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840ed270) // F1
              {
                const data_expression& var_2 = down_cast<data_expression>(arg1[1]); // S2
                const data_expression& var_3 = down_cast<data_expression>(arg1[2]); // S2
                return rewr_542_2(var_1, rewr_112_1(rewr_78_2(var_2, var_3,  this_rewriter),  this_rewriter),  this_rewriter); // R1 @var_1 == @pospred(2 * @var_3 + if(@var_2, 1, 0))
              }
              else
              {
                if (uint_address(arg1) == 0x5565840ed210) // F1
                {
                  return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
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
              return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
            }
            else
            {
            }
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415a950))), arg0, arg1);
  }

  static inline data_expression rewr_542_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_542_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_542_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_542_2(t[0], t[1], this_rewriter); }


  // [542] ==: Pos # Pos -> Bool
  static inline const data_expression& rewr_542_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565844844d0);
  }

  static inline data_expression rewr_542_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_542_0(this_rewriter); }

  static inline data_expression rewr_542_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_542_0(this_rewriter); }


  // [331] !=: Pos # Pos -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_331_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_542_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f46b0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_331_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_331_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_331_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_331_2(t[0], t[1], this_rewriter); }


  // [331] !=: Pos # Pos -> Bool
  static inline const data_expression& rewr_331_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565844841d0);
  }

  static inline data_expression rewr_331_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_331_0(this_rewriter); }

  static inline data_expression rewr_331_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_331_0(this_rewriter); }


  // [112] @pospred: Pos -> Pos
  template < class DATA_EXPR0>
  static inline data_expression rewr_112_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(@cDub, @@F(true, @@D(@@N(@@S(@var_0, @@R(2 * @var_0)))), @@F(false, @@D(@@N(@@F(@cDub, @@S(@var_0, @@N(@@S(@var_1, @@R(2 * @pospred(2 * @var_1 + if(@var_0, 1, 0)) + 1)))), @@F(1, @@R(1), @@D(@@X))))), @@D(@@X))), @@F(1, @@R(1), @@X))
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840ed270) // F1
      {
        if (uint_address(arg0[1]) == 0x5565840eb7a0) // F2a true
        {
          const data_expression& t1 = down_cast<data_expression>(arg0[1]);
          const data_expression& var_0 = down_cast<data_expression>(arg0[2]); // S2
          return rewr_78_2(*reinterpret_cast<const data_expression*>(0x55658444f320), var_0,  this_rewriter); // R1 2 * @var_0
        }
        else
        {
          if (uint_address(arg0[1]) == 0x5565840ed240) // F2a false
          {
            const data_expression& t1 = down_cast<data_expression>(arg0[1]);
            if (is_application_no_check(down_cast<data_expression>(arg0[2])) && uint_address(down_cast<data_expression>(arg0[2])[0]) == 0x5565840ed270) // F2b @cDub
            {
              const data_expression& t2 = down_cast<data_expression>(arg0[2]);
              const data_expression& var_0 = down_cast<data_expression>(t2[1]); // S2
              const data_expression& var_1 = down_cast<data_expression>(t2[2]); // S2
              return rewr_78_2(*reinterpret_cast<const data_expression*>(0x55658444fc10), rewr_112_1(rewr_78_2(var_0, var_1,  this_rewriter),  this_rewriter),  this_rewriter); // R1 2 * @pospred(2 * @var_1 + if(@var_0, 1, 0)) + 1
            }
            else
            {
              if (uint_address(arg0[2]) == 0x5565840ed210) // F2a @c1
              {
                const data_expression& t2 = down_cast<data_expression>(arg0[2]);
                return *reinterpret_cast<const data_expression*>(0x556584284750); // R1 1
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
        if (uint_address(arg0) == 0x5565840ed210) // F1
        {
          return *reinterpret_cast<const data_expression*>(0x556584284750); // R1 1
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840eefb0))), arg0);
  }

  static inline data_expression rewr_112_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_112_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_112_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_112_1(t[0], this_rewriter); }


  // [112] @pospred: Pos -> Pos
  static inline const data_expression& rewr_112_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484500);
  }

  static inline data_expression rewr_112_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_112_0(this_rewriter); }

  static inline data_expression rewr_112_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_112_0(this_rewriter); }


  // [101] <: Pos # Pos -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_101_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@N(@@F(1, @@R(false), @@X))
    {
      if (uint_address(arg1) == 0x5565840ed210) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
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
      if (uint_address(arg0) == 0x5565840ed210) // F1
      {
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
        }
        else
        {
          if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840ed270) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840eecb0) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
            }
            else
            {
            }
          }
        }
      }
      else
      {
        if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840ed270) // F1
        {
          const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
          const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840eecb0) // F1
            {
              const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
              return rewr_685_2(rewr_78_2(var_1, var_2,  this_rewriter), var_3,  this_rewriter); // R1 2 * @var_2 + if(@var_1, 1, 0) <= @var_3
            }
            else
            {
              if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840ed270) // F1
              {
                const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
                const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
                return rewr_97_3(rewr_44_2(var_3, var_1,  this_rewriter), delayed_rewr_101_2<data_expression, data_expression>(var_2, var_4,  this_rewriter), delayed_rewr_685_2<data_expression, data_expression>(var_2, var_4,  this_rewriter),  this_rewriter); // R1 if(@var_3 => @var_1, @var_2 < @var_4, @var_2 <= @var_4)
              }
              else
              {
              }
            }
          }
        }
        else
        {
          if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840eecb0) // F1
          {
            const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
            if (var_0 == arg1) // M
            {
              return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
            }
            else
            {
              if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840ed270) // F1
              {
                const data_expression& var_2 = down_cast<data_expression>(arg1[1]); // S2
                const data_expression& var_3 = down_cast<data_expression>(arg1[2]); // S2
                return rewr_101_2(var_1, rewr_112_1(rewr_78_2(var_2, var_3,  this_rewriter),  this_rewriter),  this_rewriter); // R1 @var_1 < @pospred(2 * @var_3 + if(@var_2, 1, 0))
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
              return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
            }
            else
            {
            }
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840eece0))), arg0, arg1);
  }

  static inline data_expression rewr_101_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_101_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_101_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_101_2(t[0], t[1], this_rewriter); }


  // [101] <: Pos # Pos -> Bool
  static inline const data_expression& rewr_101_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658444fa00);
  }

  static inline data_expression rewr_101_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_101_0(this_rewriter); }

  static inline data_expression rewr_101_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_101_0(this_rewriter); }


  // [100] succ: Pos -> Pos
  template < class DATA_EXPR0>
  static inline data_expression rewr_100_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(@cDub, @@F(true, @@D(@@N(@@S(@var_0, @@R(2 * succ(@var_0))))), @@F(false, @@D(@@N(@@S(@var_0, @@R(2 * @var_0 + 1)))), @@D(@@X))), @@F(1, @@R(2), @@X))
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840ed270) // F1
      {
        if (uint_address(arg0[1]) == 0x5565840eb7a0) // F2a true
        {
          const data_expression& t1 = down_cast<data_expression>(arg0[1]);
          const data_expression& var_0 = down_cast<data_expression>(arg0[2]); // S2
          return rewr_78_2(*reinterpret_cast<const data_expression*>(0x55658444f320), rewr_100_1(var_0,  this_rewriter),  this_rewriter); // R1 2 * succ(@var_0)
        }
        else
        {
          if (uint_address(arg0[1]) == 0x5565840ed240) // F2a false
          {
            const data_expression& t1 = down_cast<data_expression>(arg0[1]);
            const data_expression& var_0 = down_cast<data_expression>(arg0[2]); // S2
            return rewr_78_2(*reinterpret_cast<const data_expression*>(0x55658444fc10), var_0,  this_rewriter); // R1 2 * @var_0 + 1
          }
          else
          {
          }
        }
      }
      else
      {
        if (uint_address(arg0) == 0x5565840ed210) // F1
        {
          return *reinterpret_cast<const data_expression*>(0x55658427ecd0); // R1 2
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840eecb0))), arg0);
  }

  static inline data_expression rewr_100_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_100_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_100_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_100_1(t[0], this_rewriter); }


  // [100] succ: Pos -> Pos
  static inline const data_expression& rewr_100_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584450ec0);
  }

  static inline data_expression rewr_100_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_100_0(this_rewriter); }

  static inline data_expression rewr_100_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_100_0(this_rewriter); }


  // [686] if: Bool # Nat # Nat -> Nat
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_686_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584187fe0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_686_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_686_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_686_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_686_3(t[0], t[1], t[2], this_rewriter); }


  // [686] if: Bool # Nat # Nat -> Nat
  static inline const data_expression& rewr_686_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584450e90);
  }

  static inline data_expression rewr_686_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_686_0(this_rewriter); }

  static inline data_expression rewr_686_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_686_0(this_rewriter); }


  // [102] <: Nat # Nat -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_102_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@N(@@F(0, @@R(false), @@X))
    {
      if (uint_address(arg1) == 0x5565840ed510) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840eb9b0) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
        }
        else
        {
          if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840eb9b0) // F1
          {
            const data_expression& var_2 = down_cast<data_expression>(arg1[1]); // S2
            return rewr_101_2(var_1, var_2,  this_rewriter); // R1 @var_1 < @var_2
          }
          else
          {
          }
        }
      }
      else
      {
        if (uint_address(arg0) == 0x5565840ed510) // F1
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840eb9b0) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
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
            return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840eed70))), arg0, arg1);
  }

  static inline data_expression rewr_102_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_102_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_102_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_102_2(t[0], t[1], this_rewriter); }


  // [102] <: Nat # Nat -> Bool
  static inline const data_expression& rewr_102_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565844840b0);
  }

  static inline data_expression rewr_102_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_102_0(this_rewriter); }

  static inline data_expression rewr_102_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_102_0(this_rewriter); }


  // [98] succ: Nat -> Pos
  template < class DATA_EXPR0>
  static inline data_expression rewr_98_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(@cNat, @@S(@var_0, @@R(succ(@var_0))), @@F(0, @@R(1), @@X))
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840eb9b0) // F1
      {
        const data_expression& var_0 = down_cast<data_expression>(arg0[1]); // S2
        return rewr_100_1(var_0,  this_rewriter); // R1 succ(@var_0)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840ed510) // F1
        {
          return *reinterpret_cast<const data_expression*>(0x556584284750); // R1 1
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840eec50))), arg0);
  }

  static inline data_expression rewr_98_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_98_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_98_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_98_1(t[0], this_rewriter); }


  // [98] succ: Nat -> Pos
  static inline const data_expression& rewr_98_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584450f80);
  }

  static inline data_expression rewr_98_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_98_0(this_rewriter); }

  static inline data_expression rewr_98_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_98_0(this_rewriter); }


  // [61] !=: Nat # Nat -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_61_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_35_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840eca60))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_61_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_61_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_61_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_61_2(t[0], t[1], this_rewriter); }


  // [61] !=: Nat # Nat -> Bool
  static inline const data_expression& rewr_61_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584450ef0);
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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840eb9b0) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
        }
        else
        {
          if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840eb9b0) // F1
          {
            const data_expression& var_2 = down_cast<data_expression>(arg1[1]); // S2
            return rewr_542_2(var_1, var_2,  this_rewriter); // R1 @var_1 == @var_2
          }
          else
          {
            if (uint_address(arg1) == 0x5565840ed510) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
            }
            else
            {
            }
          }
        }
      }
      else
      {
        if (uint_address(arg0) == 0x5565840ed510) // F1
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840eb9b0) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
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
            return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840ebe60))), arg0, arg1);
  }

  static inline data_expression rewr_35_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_35_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_35_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_35_2(t[0], t[1], this_rewriter); }


  // [35] ==: Nat # Nat -> Bool
  static inline const data_expression& rewr_35_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658444fab0);
  }

  static inline data_expression rewr_35_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_35_0(this_rewriter); }

  static inline data_expression rewr_35_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_35_0(this_rewriter); }


  // [555] !=: Bool # Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_555_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_401_2(local_rewrite(var_0, this_rewriter), var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415b0d0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_555_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_555_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_555_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_555_2(t[0], t[1], this_rewriter); }


  // [555] !=: Bool # Bool -> Bool
  static inline const data_expression& rewr_555_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584284700);
  }

  static inline data_expression rewr_555_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_555_0(this_rewriter); }

  static inline data_expression rewr_555_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_555_0(this_rewriter); }


  // [401] ==: Bool # Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_401_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@S(@var_0, @@R(!@var_0)))), @@F(true, @@D(@@N(@@S(@var_0, @@R(@var_0)))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
        return rewr_82_1(local_rewrite(var_0, this_rewriter),  this_rewriter); // R1 !@var_0
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
        if (uint_address(arg1) == 0x5565840eb7a0) // F1
        {
          return var_0; // R1 @var_0
        }
        else
        {
          if (uint_address(arg1) == 0x5565840ed240) // F1
          {
            return rewr_82_1(var_0,  this_rewriter); // R1 !@var_0
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584155340))), arg0, arg1);
  }

  static inline data_expression rewr_401_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_401_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_401_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_401_2(t[0], t[1], this_rewriter); }


  // [401] ==: Bool # Bool -> Bool
  static inline const data_expression& rewr_401_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584450e60);
  }

  static inline data_expression rewr_401_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_401_0(this_rewriter); }

  static inline data_expression rewr_401_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_401_0(this_rewriter); }


  // [97] if: Bool # Bool # Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_97_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840eea10))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_97_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_97_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_97_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_97_3(t[0], t[1], t[2], this_rewriter); }


  // [97] if: Bool # Bool # Bool -> Bool
  static inline const data_expression& rewr_97_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658427ec00);
  }

  static inline data_expression rewr_97_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_97_0(this_rewriter); }

  static inline data_expression rewr_97_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_97_0(this_rewriter); }


  // [82] !: Bool -> Bool
  template < class DATA_EXPR0>
  static inline data_expression rewr_82_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(!, @@S(@var_0, @@R(@var_0)), @@F(true, @@R(false), @@F(false, @@R(true), @@X)))
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840ed960) // F1
      {
        const data_expression& var_0 = down_cast<data_expression>(arg0[1]); // S2
        return var_0; // R1 @var_0
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
        {
          return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
        }
        else
        {
          if (uint_address(arg0) == 0x5565840ed240) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840ed960))), arg0);
  }

  static inline data_expression rewr_82_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_82_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_82_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_82_1(t[0], this_rewriter); }


  // [82] !: Bool -> Bool
  static inline const data_expression& rewr_82_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584450cd0);
  }

  static inline data_expression rewr_82_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_82_0(this_rewriter); }

  static inline data_expression rewr_82_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_82_0(this_rewriter); }


  // [81] ||: Bool # Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_81_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@S(@var_0, @@R(@var_0)))), @@F(true, @@D(@@N(@@S(@var_0, @@R(true)))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR1& var_0 = arg_not_nf1; // S1b
        return local_rewrite(var_0, this_rewriter); // R1 @var_0
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
        {
          return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
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
      if (uint_address(arg1) == 0x5565840eb7a0) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
        if (uint_address(arg1) == 0x5565840ed240) // F1
        {
          return var_0; // R1 @var_0
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840ed660))), arg0, arg1);
  }

  static inline data_expression rewr_81_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_81_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_81_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_81_2(t[0], t[1], this_rewriter); }


  // [81] ||: Bool # Bool -> Bool
  static inline const data_expression& rewr_81_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584450f50);
  }

  static inline data_expression rewr_81_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_81_0(this_rewriter); }

  static inline data_expression rewr_81_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_81_0(this_rewriter); }


  // [45] &&: Bool # Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_45_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@S(@var_0, @@R(false)))), @@F(true, @@D(@@N(@@S(@var_0, @@R(@var_0)))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
      if (uint_address(arg1) == 0x5565840eb7a0) // F1
      {
        return var_0; // R1 @var_0
      }
      else
      {
        if (uint_address(arg1) == 0x5565840ed240) // F1
        {
          return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840ec1c0))), arg0, arg1);
  }

  static inline data_expression rewr_45_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_45_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_45_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_45_2(t[0], t[1], this_rewriter); }


  // [45] &&: Bool # Bool -> Bool
  static inline const data_expression& rewr_45_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484080);
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
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
      if (uint_address(arg1) == 0x5565840eb7a0) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
        if (uint_address(arg1) == 0x5565840ed240) // F1
        {
          return rewr_82_1(var_0,  this_rewriter); // R1 !@var_0
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840ec160))), arg0, arg1);
  }

  static inline data_expression rewr_44_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_44_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_44_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_44_2(t[0], t[1], this_rewriter); }


  // [44] =>: Bool # Bool -> Bool
  static inline const data_expression& rewr_44_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565842ffc10);
  }

  static inline data_expression rewr_44_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_44_0(this_rewriter); }

  static inline data_expression rewr_44_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_44_0(this_rewriter); }


  // [671] if: Bool # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) -> (Place -> List(Nat)) # Trans_name -> MarkingTrans
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_671_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415f3f0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_671_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_671_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_671_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_671_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [671] if: Bool # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) -> (Place -> List(Nat)) # Trans_name -> MarkingTrans
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_671_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415f3f0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_671_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_671_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_671_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_671_3(t[0], t[1], t[2], this_rewriter); }


  // [671] if: Bool # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) -> (Place -> List(Nat)) # Trans_name -> MarkingTrans
  static inline const data_expression& rewr_671_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565844501b0);
  }

  static inline data_expression rewr_671_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_671_0(this_rewriter); }

  static inline data_expression rewr_671_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_671_0(this_rewriter); }


  // [670] !=: ((Place -> List(Nat)) # Trans_name -> MarkingTrans) # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_670_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_669_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415f3c0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_670_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_670_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_670_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_670_2(t[0], t[1], this_rewriter); }


  // [670] !=: ((Place -> List(Nat)) # Trans_name -> MarkingTrans) # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) -> Bool
  static inline const data_expression& rewr_670_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584450b20);
  }

  static inline data_expression rewr_670_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_670_0(this_rewriter); }

  static inline data_expression rewr_670_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_670_0(this_rewriter); }


  // [669] ==: ((Place -> List(Nat)) # Trans_name -> MarkingTrans) # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_669_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Place -> List(Nat), x3: Trans_name. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(0), rewr_676_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(1))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(1))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Place -> List(Nat), x3: Trans_name. @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415f390))), arg0, arg1);
  }

  static inline data_expression rewr_669_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_669_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_669_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_669_2(t[0], t[1], this_rewriter); }


  // [669] ==: ((Place -> List(Nat)) # Trans_name -> MarkingTrans) # ((Place -> List(Nat)) # Trans_name -> MarkingTrans) -> Bool
  static inline const data_expression& rewr_669_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484870);
  }

  static inline data_expression rewr_669_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_669_0(this_rewriter); }

  static inline data_expression rewr_669_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_669_0(this_rewriter); }


  // [572] if: Bool # (Trans_name # Trans_name -> Bool) # (Trans_name # Trans_name -> Bool) -> Trans_name # Trans_name -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_572_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415ba90))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_572_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_572_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_572_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_572_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [572] if: Bool # (Trans_name # Trans_name -> Bool) # (Trans_name # Trans_name -> Bool) -> Trans_name # Trans_name -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_572_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415ba90))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_572_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_572_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_572_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_572_3(t[0], t[1], t[2], this_rewriter); }


  // [572] if: Bool # (Trans_name # Trans_name -> Bool) # (Trans_name # Trans_name -> Bool) -> Trans_name # Trans_name -> Bool
  static inline const data_expression& rewr_572_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565842e1430);
  }

  static inline data_expression rewr_572_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_572_0(this_rewriter); }

  static inline data_expression rewr_572_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_572_0(this_rewriter); }


  // [571] !=: (Trans_name # Trans_name -> Bool) # (Trans_name # Trans_name -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_571_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_570_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415ba60))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_571_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_571_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_571_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_571_2(t[0], t[1], this_rewriter); }


  // [571] !=: (Trans_name # Trans_name -> Bool) # (Trans_name # Trans_name -> Bool) -> Bool
  static inline const data_expression& rewr_571_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584450210);
  }

  static inline data_expression rewr_571_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_571_0(this_rewriter); }

  static inline data_expression rewr_571_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_571_0(this_rewriter); }


  // [570] ==: (Trans_name # Trans_name -> Bool) # (Trans_name # Trans_name -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_570_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: Trans_name. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(1), rewr_401_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(2)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(1))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(2)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(1)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: Trans_name. @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415ba30))), arg0, arg1);
  }

  static inline data_expression rewr_570_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_570_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_570_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_570_2(t[0], t[1], this_rewriter); }


  // [570] ==: (Trans_name # Trans_name -> Bool) # (Trans_name # Trans_name -> Bool) -> Bool
  static inline const data_expression& rewr_570_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584450240);
  }

  static inline data_expression rewr_570_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_570_0(this_rewriter); }

  static inline data_expression rewr_570_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_570_0(this_rewriter); }


  // [565] if: Bool # ((Place -> List(Nat)) # (Place -> List(Nat)) -> Bool) # ((Place -> List(Nat)) # (Place -> List(Nat)) -> Bool) -> (Place -> List(Nat)) # (Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_565_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415b5b0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_565_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_565_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_565_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_565_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [565] if: Bool # ((Place -> List(Nat)) # (Place -> List(Nat)) -> Bool) # ((Place -> List(Nat)) # (Place -> List(Nat)) -> Bool) -> (Place -> List(Nat)) # (Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_565_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415b5b0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_565_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_565_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_565_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_565_3(t[0], t[1], t[2], this_rewriter); }


  // [565] if: Bool # ((Place -> List(Nat)) # (Place -> List(Nat)) -> Bool) # ((Place -> List(Nat)) # (Place -> List(Nat)) -> Bool) -> (Place -> List(Nat)) # (Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_565_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484170);
  }

  static inline data_expression rewr_565_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_565_0(this_rewriter); }

  static inline data_expression rewr_565_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_565_0(this_rewriter); }


  // [564] !=: ((Place -> List(Nat)) # (Place -> List(Nat)) -> Bool) # ((Place -> List(Nat)) # (Place -> List(Nat)) -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_564_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_563_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415b580))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_564_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_564_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_564_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_564_2(t[0], t[1], this_rewriter); }


  // [564] !=: ((Place -> List(Nat)) # (Place -> List(Nat)) -> Bool) # ((Place -> List(Nat)) # (Place -> List(Nat)) -> Bool) -> Bool
  static inline const data_expression& rewr_564_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484970);
  }

  static inline data_expression rewr_564_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_564_0(this_rewriter); }

  static inline data_expression rewr_564_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_564_0(this_rewriter); }


  // [563] ==: ((Place -> List(Nat)) # (Place -> List(Nat)) -> Bool) # ((Place -> List(Nat)) # (Place -> List(Nat)) -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_563_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: Place -> List(Nat). @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(2), rewr_401_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(3))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(3)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: Place -> List(Nat). @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415b550))), arg0, arg1);
  }

  static inline data_expression rewr_563_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_563_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_563_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_563_2(t[0], t[1], this_rewriter); }


  // [563] ==: ((Place -> List(Nat)) # (Place -> List(Nat)) -> Bool) # ((Place -> List(Nat)) # (Place -> List(Nat)) -> Bool) -> Bool
  static inline const data_expression& rewr_563_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565842cab70);
  }

  static inline data_expression rewr_563_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_563_0(this_rewriter); }

  static inline data_expression rewr_563_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_563_0(this_rewriter); }


  // [558] if: Bool # (Bool -> Bool) # (Bool -> Bool) -> Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_558_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415b190))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_558_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_558_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_558_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_558_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [558] if: Bool # (Bool -> Bool) # (Bool -> Bool) -> Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_558_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415b190))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_558_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_558_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_558_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_558_3(t[0], t[1], t[2], this_rewriter); }


  // [558] if: Bool # (Bool -> Bool) # (Bool -> Bool) -> Bool -> Bool
  static inline const data_expression& rewr_558_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565842cab10);
  }

  static inline data_expression rewr_558_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_558_0(this_rewriter); }

  static inline data_expression rewr_558_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_558_0(this_rewriter); }


  // [557] !=: (Bool -> Bool) # (Bool -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_557_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_556_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415b160))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_557_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_557_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_557_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_557_2(t[0], t[1], this_rewriter); }


  // [557] !=: (Bool -> Bool) # (Bool -> Bool) -> Bool
  static inline const data_expression& rewr_557_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565842cab40);
  }

  static inline data_expression rewr_557_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_557_0(this_rewriter); }

  static inline data_expression rewr_557_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_557_0(this_rewriter); }


  // [556] ==: (Bool -> Bool) # (Bool -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_556_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Bool. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(3), rewr_401_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(4))), this_rewriter), delayed_application1<data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(4)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Bool. @var_0(x1) == @var_1(x1)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415b130))), arg0, arg1);
  }

  static inline data_expression rewr_556_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_556_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_556_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_556_2(t[0], t[1], this_rewriter); }


  // [556] ==: (Bool -> Bool) # (Bool -> Bool) -> Bool
  static inline const data_expression& rewr_556_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484140);
  }

  static inline data_expression rewr_556_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_556_0(this_rewriter); }

  static inline data_expression rewr_556_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_556_0(this_rewriter); }


  // [545] if: Bool # (Trans # Trans -> Bool) # (Trans # Trans -> Bool) -> Trans # Trans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_545_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415aa70))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_545_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_545_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_545_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_545_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [545] if: Bool # (Trans # Trans -> Bool) # (Trans # Trans -> Bool) -> Trans # Trans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_545_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415aa70))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_545_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_545_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_545_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_545_3(t[0], t[1], t[2], this_rewriter); }


  // [545] if: Bool # (Trans # Trans -> Bool) # (Trans # Trans -> Bool) -> Trans # Trans -> Bool
  static inline const data_expression& rewr_545_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565844849a0);
  }

  static inline data_expression rewr_545_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_545_0(this_rewriter); }

  static inline data_expression rewr_545_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_545_0(this_rewriter); }


  // [544] !=: (Trans # Trans -> Bool) # (Trans # Trans -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_544_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_543_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415aa40))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_544_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_544_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_544_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_544_2(t[0], t[1], this_rewriter); }


  // [544] !=: (Trans # Trans -> Bool) # (Trans # Trans -> Bool) -> Bool
  static inline const data_expression& rewr_544_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658424b420);
  }

  static inline data_expression rewr_544_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_544_0(this_rewriter); }

  static inline data_expression rewr_544_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_544_0(this_rewriter); }


  // [543] ==: (Trans # Trans -> Bool) # (Trans # Trans -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_543_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: Trans. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(4), rewr_401_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(5)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(6))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(5)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(6)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: Trans. @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415aa10))), arg0, arg1);
  }

  static inline data_expression rewr_543_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_543_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_543_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_543_2(t[0], t[1], this_rewriter); }


  // [543] ==: (Trans # Trans -> Bool) # (Trans # Trans -> Bool) -> Bool
  static inline const data_expression& rewr_543_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484e20);
  }

  static inline data_expression rewr_543_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_543_0(this_rewriter); }

  static inline data_expression rewr_543_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_543_0(this_rewriter); }


  // [537] if: Bool # (Bool # Pos -> Pos) # (Bool # Pos -> Pos) -> Bool # Pos -> Pos
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_537_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415a560))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_537_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_537_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_537_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_537_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [537] if: Bool # (Bool # Pos -> Pos) # (Bool # Pos -> Pos) -> Bool # Pos -> Pos
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_537_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415a560))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_537_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_537_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_537_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_537_3(t[0], t[1], t[2], this_rewriter); }


  // [537] if: Bool # (Bool # Pos -> Pos) # (Bool # Pos -> Pos) -> Bool # Pos -> Pos
  static inline const data_expression& rewr_537_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658424b3f0);
  }

  static inline data_expression rewr_537_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_537_0(this_rewriter); }

  static inline data_expression rewr_537_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_537_0(this_rewriter); }


  // [536] !=: (Bool # Pos -> Pos) # (Bool # Pos -> Pos) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_536_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_535_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415a530))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_536_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_536_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_536_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_536_2(t[0], t[1], this_rewriter); }


  // [536] !=: (Bool # Pos -> Pos) # (Bool # Pos -> Pos) -> Bool
  static inline const data_expression& rewr_536_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484fc0);
  }

  static inline data_expression rewr_536_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_536_0(this_rewriter); }

  static inline data_expression rewr_536_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_536_0(this_rewriter); }


  // [535] ==: (Bool # Pos -> Pos) # (Bool # Pos -> Pos) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_535_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Bool, x3: Pos. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(5), rewr_542_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(4)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(7))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(4)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(7))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Bool, x3: Pos. @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415a500))), arg0, arg1);
  }

  static inline data_expression rewr_535_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_535_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_535_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_535_2(t[0], t[1], this_rewriter); }


  // [535] ==: (Bool # Pos -> Pos) # (Bool # Pos -> Pos) -> Bool
  static inline const data_expression& rewr_535_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584463b00);
  }

  static inline data_expression rewr_535_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_535_0(this_rewriter); }

  static inline data_expression rewr_535_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_535_0(this_rewriter); }


  // [530] if: Bool # (Trans -> Trans_name) # (Trans -> Trans_name) -> Trans -> Trans_name
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_530_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415a140))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_530_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_530_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_530_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_530_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [530] if: Bool # (Trans -> Trans_name) # (Trans -> Trans_name) -> Trans -> Trans_name
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_530_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415a140))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_530_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_530_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_530_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_530_3(t[0], t[1], t[2], this_rewriter); }


  // [530] if: Bool # (Trans -> Trans_name) # (Trans -> Trans_name) -> Trans -> Trans_name
  static inline const data_expression& rewr_530_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484d10);
  }

  static inline data_expression rewr_530_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_530_0(this_rewriter); }

  static inline data_expression rewr_530_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_530_0(this_rewriter); }


  // [529] !=: (Trans -> Trans_name) # (Trans -> Trans_name) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_529_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_528_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415a110))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_529_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_529_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_529_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_529_2(t[0], t[1], this_rewriter); }


  // [529] !=: (Trans -> Trans_name) # (Trans -> Trans_name) -> Bool
  static inline const data_expression& rewr_529_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484eb0);
  }

  static inline data_expression rewr_529_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_529_0(this_rewriter); }

  static inline data_expression rewr_529_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_529_0(this_rewriter); }


  // [528] ==: (Trans -> Trans_name) # (Trans -> Trans_name) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_528_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Trans. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(6), rewr_84_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(5))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(5))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Trans. @var_0(x1) == @var_1(x1)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x55658415a0e0))), arg0, arg1);
  }

  static inline data_expression rewr_528_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_528_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_528_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_528_2(t[0], t[1], this_rewriter); }


  // [528] ==: (Trans -> Trans_name) # (Trans -> Trans_name) -> Bool
  static inline const data_expression& rewr_528_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484290);
  }

  static inline data_expression rewr_528_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_528_0(this_rewriter); }

  static inline data_expression rewr_528_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_528_0(this_rewriter); }


  // [519] if: Bool # (Nat # List(Nat) -> List(Nat)) # (Nat # List(Nat) -> List(Nat)) -> Nat # List(Nat) -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_519_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584159b40))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_519_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_519_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_519_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_519_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [519] if: Bool # (Nat # List(Nat) -> List(Nat)) # (Nat # List(Nat) -> List(Nat)) -> Nat # List(Nat) -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_519_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584159b40))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_519_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_519_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_519_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_519_3(t[0], t[1], t[2], this_rewriter); }


  // [519] if: Bool # (Nat # List(Nat) -> List(Nat)) # (Nat # List(Nat) -> List(Nat)) -> Nat # List(Nat) -> List(Nat)
  static inline const data_expression& rewr_519_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484320);
  }

  static inline data_expression rewr_519_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_519_0(this_rewriter); }

  static inline data_expression rewr_519_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_519_0(this_rewriter); }


  // [518] !=: (Nat # List(Nat) -> List(Nat)) # (Nat # List(Nat) -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_518_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_517_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584159b10))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_518_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_518_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_518_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_518_2(t[0], t[1], this_rewriter); }


  // [518] !=: (Nat # List(Nat) -> List(Nat)) # (Nat # List(Nat) -> List(Nat)) -> Bool
  static inline const data_expression& rewr_518_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484e50);
  }

  static inline data_expression rewr_518_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_518_0(this_rewriter); }

  static inline data_expression rewr_518_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_518_0(this_rewriter); }


  // [517] ==: (Nat # List(Nat) -> List(Nat)) # (Nat # List(Nat) -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_517_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Nat, x3: List(Nat). @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(7), rewr_297_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(8)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(9))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(8)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(9))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Nat, x3: List(Nat). @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584159ae0))), arg0, arg1);
  }

  static inline data_expression rewr_517_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_517_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_517_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_517_2(t[0], t[1], this_rewriter); }


  // [517] ==: (Nat # List(Nat) -> List(Nat)) # (Nat # List(Nat) -> List(Nat)) -> Bool
  static inline const data_expression& rewr_517_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584450970);
  }

  static inline data_expression rewr_517_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_517_0(this_rewriter); }

  static inline data_expression rewr_517_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_517_0(this_rewriter); }


  // [512] if: Bool # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) -> (Place -> List(Nat)) # Trans -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4, class DATA_EXPR5>
  static inline data_expression rewr_512_6(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, const DATA_EXPR5& arg_not_nf5, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_1(@var_2, @var_3)(@var_4)))))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_0(@var_2, @var_3)(@var_4)))))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
        return rewrite_with_arguments_in_normal_form(application(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), local_rewrite(var_4, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)(@var_4)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584159690))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter)), local_rewrite(arg_not_nf5,this_rewriter));
  }

  static inline data_expression rewr_512_6_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_512_6(term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[2], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_512_6_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_512_6(down_cast<application>(down_cast<application>(t.head()).head())[0], down_cast<application>(down_cast<application>(t.head()).head())[1], down_cast<application>(down_cast<application>(t.head()).head())[2], down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], t[0], this_rewriter); }


  // [512] if: Bool # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) -> (Place -> List(Nat)) # Trans -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_512_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584159690))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_512_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_512_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_512_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_512_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [512] if: Bool # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) -> (Place -> List(Nat)) # Trans -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_512_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584159690))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_512_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_512_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_512_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_512_3(t[0], t[1], t[2], this_rewriter); }


  // [512] if: Bool # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) -> (Place -> List(Nat)) # Trans -> Place -> List(Nat)
  static inline const data_expression& rewr_512_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484420);
  }

  static inline data_expression rewr_512_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_512_0(this_rewriter); }

  static inline data_expression rewr_512_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_512_0(this_rewriter); }


  // [511] !=: ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_511_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_510_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584159660))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_511_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_511_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_511_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_511_2(t[0], t[1], this_rewriter); }


  // [511] !=: ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_511_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584463470);
  }

  static inline data_expression rewr_511_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_511_0(this_rewriter); }

  static inline data_expression rewr_511_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_511_0(this_rewriter); }


  // [510] ==: ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_510_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Place -> List(Nat), x3: Trans. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(8), rewr_83_2(delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_0, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(6)), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(6)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Place -> List(Nat), x3: Trans. @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584159630))), arg0, arg1);
  }

  static inline data_expression rewr_510_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_510_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_510_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_510_2(t[0], t[1], this_rewriter); }


  // [510] ==: ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) # ((Place -> List(Nat)) # Trans -> Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_510_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484da0);
  }

  static inline data_expression rewr_510_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_510_0(this_rewriter); }

  static inline data_expression rewr_510_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_510_0(this_rewriter); }


  // [505] if: Bool # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) -> PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_505_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565841591e0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_505_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_505_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_505_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_505_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [505] if: Bool # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) -> PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_505_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565841591e0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_505_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_505_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_505_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_505_3(t[0], t[1], t[2], this_rewriter); }


  // [505] if: Bool # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) -> PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)
  static inline const data_expression& rewr_505_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565844855b0);
  }

  static inline data_expression rewr_505_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_505_0(this_rewriter); }

  static inline data_expression rewr_505_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_505_0(this_rewriter); }


  // [504] !=: (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_504_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_503_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565841591b0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_504_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_504_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_504_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_504_2(t[0], t[1], this_rewriter); }


  // [504] !=: (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) -> Bool
  static inline const data_expression& rewr_504_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565844633c0);
  }

  static inline data_expression rewr_504_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_504_0(this_rewriter); }

  static inline data_expression rewr_504_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_504_0(this_rewriter); }


  // [503] ==: (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_503_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: PlaceTokens, x3: List(PlaceTokens). @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(9), rewr_263_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(10)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(11))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(10)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(11))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: PlaceTokens, x3: List(PlaceTokens). @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584159180))), arg0, arg1);
  }

  static inline data_expression rewr_503_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_503_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_503_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_503_2(t[0], t[1], this_rewriter); }


  // [503] ==: (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) # (PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)) -> Bool
  static inline const data_expression& rewr_503_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658444ffa0);
  }

  static inline data_expression rewr_503_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_503_0(this_rewriter); }

  static inline data_expression rewr_503_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_503_0(this_rewriter); }


  // [498] if: Bool # (List(Nat) # List(Nat) -> List(Nat)) # (List(Nat) # List(Nat) -> List(Nat)) -> List(Nat) # List(Nat) -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_498_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584158d30))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_498_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_498_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_498_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_498_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [498] if: Bool # (List(Nat) # List(Nat) -> List(Nat)) # (List(Nat) # List(Nat) -> List(Nat)) -> List(Nat) # List(Nat) -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_498_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584158d30))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_498_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_498_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_498_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_498_3(t[0], t[1], t[2], this_rewriter); }


  // [498] if: Bool # (List(Nat) # List(Nat) -> List(Nat)) # (List(Nat) # List(Nat) -> List(Nat)) -> List(Nat) # List(Nat) -> List(Nat)
  static inline const data_expression& rewr_498_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658444ff70);
  }

  static inline data_expression rewr_498_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_498_0(this_rewriter); }

  static inline data_expression rewr_498_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_498_0(this_rewriter); }


  // [497] !=: (List(Nat) # List(Nat) -> List(Nat)) # (List(Nat) # List(Nat) -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_497_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_496_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584158d00))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_497_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_497_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_497_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_497_2(t[0], t[1], this_rewriter); }


  // [497] !=: (List(Nat) # List(Nat) -> List(Nat)) # (List(Nat) # List(Nat) -> List(Nat)) -> Bool
  static inline const data_expression& rewr_497_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565844500a0);
  }

  static inline data_expression rewr_497_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_497_0(this_rewriter); }

  static inline data_expression rewr_497_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_497_0(this_rewriter); }


  // [496] ==: (List(Nat) # List(Nat) -> List(Nat)) # (List(Nat) # List(Nat) -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_496_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: List(Nat). @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(10), rewr_297_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(12)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(9))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(12)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(9))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: List(Nat). @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584158cd0))), arg0, arg1);
  }

  static inline data_expression rewr_496_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_496_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_496_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_496_2(t[0], t[1], this_rewriter); }


  // [496] ==: (List(Nat) # List(Nat) -> List(Nat)) # (List(Nat) # List(Nat) -> List(Nat)) -> Bool
  static inline const data_expression& rewr_496_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565844850a0);
  }

  static inline data_expression rewr_496_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_496_0(this_rewriter); }

  static inline data_expression rewr_496_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_496_0(this_rewriter); }


  // [491] if: Bool # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) -> (Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4, class DATA_EXPR5>
  static inline data_expression rewr_491_6(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, const DATA_EXPR5& arg_not_nf5, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_1(@var_2, @var_3)(@var_4)))))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_0(@var_2, @var_3)(@var_4)))))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
        return rewrite_with_arguments_in_normal_form(application(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), local_rewrite(var_4, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)(@var_4)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584158880))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter)), local_rewrite(arg_not_nf5,this_rewriter));
  }

  static inline data_expression rewr_491_6_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_491_6(term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[2], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_491_6_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_491_6(down_cast<application>(down_cast<application>(t.head()).head())[0], down_cast<application>(down_cast<application>(t.head()).head())[1], down_cast<application>(down_cast<application>(t.head()).head())[2], down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], t[0], this_rewriter); }


  // [491] if: Bool # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) -> (Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_491_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584158880))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_491_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_491_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_491_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_491_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [491] if: Bool # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) -> (Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_491_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584158880))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_491_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_491_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_491_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_491_3(t[0], t[1], t[2], this_rewriter); }


  // [491] if: Bool # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) -> (Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)
  static inline const data_expression& rewr_491_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565844634a0);
  }

  static inline data_expression rewr_491_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_491_0(this_rewriter); }

  static inline data_expression rewr_491_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_491_0(this_rewriter); }


  // [490] !=: ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_490_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_489_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584158850))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_490_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_490_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_490_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_490_2(t[0], t[1], this_rewriter); }


  // [490] !=: ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_490_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484350);
  }

  static inline data_expression rewr_490_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_490_0(this_rewriter); }

  static inline data_expression rewr_490_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_490_0(this_rewriter); }


  // [489] ==: ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_489_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Place -> List(Nat), x3: List(PlaceTokens). @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(11), rewr_83_2(delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_0, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(11)), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(11)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Place -> List(Nat), x3: List(PlaceTokens). @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584158820))), arg0, arg1);
  }

  static inline data_expression rewr_489_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_489_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_489_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_489_2(t[0], t[1], this_rewriter); }


  // [489] ==: ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) # ((Place -> List(Nat)) # List(PlaceTokens) -> Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_489_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584450030);
  }

  static inline data_expression rewr_489_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_489_0(this_rewriter); }

  static inline data_expression rewr_489_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_489_0(this_rewriter); }


  // [484] if: Bool # (Trans # List(Trans) -> Bool) # (Trans # List(Trans) -> Bool) -> Trans # List(Trans) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_484_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565841583a0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_484_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_484_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_484_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_484_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [484] if: Bool # (Trans # List(Trans) -> Bool) # (Trans # List(Trans) -> Bool) -> Trans # List(Trans) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_484_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565841583a0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_484_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_484_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_484_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_484_3(t[0], t[1], t[2], this_rewriter); }


  // [484] if: Bool # (Trans # List(Trans) -> Bool) # (Trans # List(Trans) -> Bool) -> Trans # List(Trans) -> Bool
  static inline const data_expression& rewr_484_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584485bf0);
  }

  static inline data_expression rewr_484_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_484_0(this_rewriter); }

  static inline data_expression rewr_484_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_484_0(this_rewriter); }


  // [483] !=: (Trans # List(Trans) -> Bool) # (Trans # List(Trans) -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_483_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_482_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584158370))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_483_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_483_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_483_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_483_2(t[0], t[1], this_rewriter); }


  // [483] !=: (Trans # List(Trans) -> Bool) # (Trans # List(Trans) -> Bool) -> Bool
  static inline const data_expression& rewr_483_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584485b30);
  }

  static inline data_expression rewr_483_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_483_0(this_rewriter); }

  static inline data_expression rewr_483_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_483_0(this_rewriter); }


  // [482] ==: (Trans # List(Trans) -> Bool) # (Trans # List(Trans) -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_482_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Trans, x3: List(Trans). @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(12), rewr_401_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(5)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(13))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(5)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(13)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Trans, x3: List(Trans). @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584158340))), arg0, arg1);
  }

  static inline data_expression rewr_482_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_482_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_482_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_482_2(t[0], t[1], this_rewriter); }


  // [482] ==: (Trans # List(Trans) -> Bool) # (Trans # List(Trans) -> Bool) -> Bool
  static inline const data_expression& rewr_482_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584485210);
  }

  static inline data_expression rewr_482_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_482_0(this_rewriter); }

  static inline data_expression rewr_482_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_482_0(this_rewriter); }


  // [477] if: Bool # (Trans -> Nat) # (Trans -> Nat) -> Trans -> Nat
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_477_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584157f80))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_477_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_477_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_477_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_477_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [477] if: Bool # (Trans -> Nat) # (Trans -> Nat) -> Trans -> Nat
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_477_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584157f80))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_477_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_477_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_477_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_477_3(t[0], t[1], t[2], this_rewriter); }


  // [477] if: Bool # (Trans -> Nat) # (Trans -> Nat) -> Trans -> Nat
  static inline const data_expression& rewr_477_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584463530);
  }

  static inline data_expression rewr_477_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_477_0(this_rewriter); }

  static inline data_expression rewr_477_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_477_0(this_rewriter); }


  // [476] !=: (Trans -> Nat) # (Trans -> Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_476_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_475_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584157f50))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_476_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_476_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_476_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_476_2(t[0], t[1], this_rewriter); }


  // [476] !=: (Trans -> Nat) # (Trans -> Nat) -> Bool
  static inline const data_expression& rewr_476_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584462540);
  }

  static inline data_expression rewr_476_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_476_0(this_rewriter); }

  static inline data_expression rewr_476_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_476_0(this_rewriter); }


  // [475] ==: (Trans -> Nat) # (Trans -> Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_475_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Trans. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(6), rewr_35_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(5))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(5))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Trans. @var_0(x1) == @var_1(x1)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584157f20))), arg0, arg1);
  }

  static inline data_expression rewr_475_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_475_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_475_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_475_2(t[0], t[1], this_rewriter); }


  // [475] ==: (Trans -> Nat) # (Trans -> Nat) -> Bool
  static inline const data_expression& rewr_475_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565844625d0);
  }

  static inline data_expression rewr_475_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_475_0(this_rewriter); }

  static inline data_expression rewr_475_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_475_0(this_rewriter); }


  // [466] if: Bool # ((Place -> List(Nat)) # Trans -> Bool) # ((Place -> List(Nat)) # Trans -> Bool) -> (Place -> List(Nat)) # Trans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_466_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565841579b0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_466_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_466_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_466_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_466_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [466] if: Bool # ((Place -> List(Nat)) # Trans -> Bool) # ((Place -> List(Nat)) # Trans -> Bool) -> (Place -> List(Nat)) # Trans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_466_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565841579b0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_466_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_466_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_466_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_466_3(t[0], t[1], t[2], this_rewriter); }


  // [466] if: Bool # ((Place -> List(Nat)) # Trans -> Bool) # ((Place -> List(Nat)) # Trans -> Bool) -> (Place -> List(Nat)) # Trans -> Bool
  static inline const data_expression& rewr_466_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584462660);
  }

  static inline data_expression rewr_466_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_466_0(this_rewriter); }

  static inline data_expression rewr_466_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_466_0(this_rewriter); }


  // [465] !=: ((Place -> List(Nat)) # Trans -> Bool) # ((Place -> List(Nat)) # Trans -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_465_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_464_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584157980))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_465_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_465_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_465_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_465_2(t[0], t[1], this_rewriter); }


  // [465] !=: ((Place -> List(Nat)) # Trans -> Bool) # ((Place -> List(Nat)) # Trans -> Bool) -> Bool
  static inline const data_expression& rewr_465_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565844625a0);
  }

  static inline data_expression rewr_465_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_465_0(this_rewriter); }

  static inline data_expression rewr_465_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_465_0(this_rewriter); }


  // [464] ==: ((Place -> List(Nat)) # Trans -> Bool) # ((Place -> List(Nat)) # Trans -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_464_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Place -> List(Nat), x3: Trans. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(8), rewr_401_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(6))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(6)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Place -> List(Nat), x3: Trans. @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584157950))), arg0, arg1);
  }

  static inline data_expression rewr_464_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_464_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_464_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_464_2(t[0], t[1], this_rewriter); }


  // [464] ==: ((Place -> List(Nat)) # Trans -> Bool) # ((Place -> List(Nat)) # Trans -> Bool) -> Bool
  static inline const data_expression& rewr_464_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584462690);
  }

  static inline data_expression rewr_464_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_464_0(this_rewriter); }

  static inline data_expression rewr_464_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_464_0(this_rewriter); }


  // [459] if: Bool # (Bool # Bool -> Bool) # (Bool # Bool -> Bool) -> Bool # Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_459_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565841574d0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_459_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_459_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_459_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_459_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [459] if: Bool # (Bool # Bool -> Bool) # (Bool # Bool -> Bool) -> Bool # Bool -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_459_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565841574d0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_459_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_459_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_459_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_459_3(t[0], t[1], t[2], this_rewriter); }


  // [459] if: Bool # (Bool # Bool -> Bool) # (Bool # Bool -> Bool) -> Bool # Bool -> Bool
  static inline const data_expression& rewr_459_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584485d70);
  }

  static inline data_expression rewr_459_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_459_0(this_rewriter); }

  static inline data_expression rewr_459_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_459_0(this_rewriter); }


  // [458] !=: (Bool # Bool -> Bool) # (Bool # Bool -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_458_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_457_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565841574a0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_458_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_458_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_458_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_458_2(t[0], t[1], this_rewriter); }


  // [458] !=: (Bool # Bool -> Bool) # (Bool # Bool -> Bool) -> Bool
  static inline const data_expression& rewr_458_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584485cb0);
  }

  static inline data_expression rewr_458_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_458_0(this_rewriter); }

  static inline data_expression rewr_458_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_458_0(this_rewriter); }


  // [457] ==: (Bool # Bool -> Bool) # (Bool # Bool -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_457_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: Bool. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(13), rewr_401_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(4)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(14))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(4)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(14)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: Bool. @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584157470))), arg0, arg1);
  }

  static inline data_expression rewr_457_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_457_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_457_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_457_2(t[0], t[1], this_rewriter); }


  // [457] ==: (Bool # Bool -> Bool) # (Bool # Bool -> Bool) -> Bool
  static inline const data_expression& rewr_457_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584485da0);
  }

  static inline data_expression rewr_457_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_457_0(this_rewriter); }

  static inline data_expression rewr_457_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_457_0(this_rewriter); }


  // [452] if: Bool # (PlaceTokens # List(PlaceTokens) -> Bool) # (PlaceTokens # List(PlaceTokens) -> Bool) -> PlaceTokens # List(PlaceTokens) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_452_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584156ff0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_452_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_452_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_452_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_452_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [452] if: Bool # (PlaceTokens # List(PlaceTokens) -> Bool) # (PlaceTokens # List(PlaceTokens) -> Bool) -> PlaceTokens # List(PlaceTokens) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_452_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584156ff0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_452_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_452_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_452_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_452_3(t[0], t[1], t[2], this_rewriter); }


  // [452] if: Bool # (PlaceTokens # List(PlaceTokens) -> Bool) # (PlaceTokens # List(PlaceTokens) -> Bool) -> PlaceTokens # List(PlaceTokens) -> Bool
  static inline const data_expression& rewr_452_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584485d40);
  }

  static inline data_expression rewr_452_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_452_0(this_rewriter); }

  static inline data_expression rewr_452_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_452_0(this_rewriter); }


  // [451] !=: (PlaceTokens # List(PlaceTokens) -> Bool) # (PlaceTokens # List(PlaceTokens) -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_451_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_450_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584156fc0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_451_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_451_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_451_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_451_2(t[0], t[1], this_rewriter); }


  // [451] !=: (PlaceTokens # List(PlaceTokens) -> Bool) # (PlaceTokens # List(PlaceTokens) -> Bool) -> Bool
  static inline const data_expression& rewr_451_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584134950);
  }

  static inline data_expression rewr_451_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_451_0(this_rewriter); }

  static inline data_expression rewr_451_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_451_0(this_rewriter); }


  // [450] ==: (PlaceTokens # List(PlaceTokens) -> Bool) # (PlaceTokens # List(PlaceTokens) -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_450_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: PlaceTokens, x3: List(PlaceTokens). @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(9), rewr_401_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(10)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(11))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(10)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(11)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: PlaceTokens, x3: List(PlaceTokens). @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584156f90))), arg0, arg1);
  }

  static inline data_expression rewr_450_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_450_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_450_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_450_2(t[0], t[1], this_rewriter); }


  // [450] ==: (PlaceTokens # List(PlaceTokens) -> Bool) # (PlaceTokens # List(PlaceTokens) -> Bool) -> Bool
  static inline const data_expression& rewr_450_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584134a60);
  }

  static inline data_expression rewr_450_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_450_0(this_rewriter); }

  static inline data_expression rewr_450_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_450_0(this_rewriter); }


  // [445] if: Bool # (Trans -> List(PlaceTokens)) # (Trans -> List(PlaceTokens)) -> Trans -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_445_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584156bd0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_445_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_445_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_445_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_445_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [445] if: Bool # (Trans -> List(PlaceTokens)) # (Trans -> List(PlaceTokens)) -> Trans -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_445_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584156bd0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_445_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_445_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_445_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_445_3(t[0], t[1], t[2], this_rewriter); }


  // [445] if: Bool # (Trans -> List(PlaceTokens)) # (Trans -> List(PlaceTokens)) -> Trans -> List(PlaceTokens)
  static inline const data_expression& rewr_445_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484380);
  }

  static inline data_expression rewr_445_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_445_0(this_rewriter); }

  static inline data_expression rewr_445_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_445_0(this_rewriter); }


  // [444] !=: (Trans -> List(PlaceTokens)) # (Trans -> List(PlaceTokens)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_444_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_443_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584156ba0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_444_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_444_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_444_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_444_2(t[0], t[1], this_rewriter); }


  // [444] !=: (Trans -> List(PlaceTokens)) # (Trans -> List(PlaceTokens)) -> Bool
  static inline const data_expression& rewr_444_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584485450);
  }

  static inline data_expression rewr_444_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_444_0(this_rewriter); }

  static inline data_expression rewr_444_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_444_0(this_rewriter); }


  // [443] ==: (Trans -> List(PlaceTokens)) # (Trans -> List(PlaceTokens)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_443_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Trans. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(6), rewr_263_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(5))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(5))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Trans. @var_0(x1) == @var_1(x1)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584156b70))), arg0, arg1);
  }

  static inline data_expression rewr_443_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_443_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_443_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_443_2(t[0], t[1], this_rewriter); }


  // [443] ==: (Trans -> List(PlaceTokens)) # (Trans -> List(PlaceTokens)) -> Bool
  static inline const data_expression& rewr_443_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584485960);
  }

  static inline data_expression rewr_443_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_443_0(this_rewriter); }

  static inline data_expression rewr_443_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_443_0(this_rewriter); }


  // [434] if: Bool # (List(Nat) # List(Nat) -> Bool) # (List(Nat) # List(Nat) -> Bool) -> List(Nat) # List(Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_434_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584156600))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_434_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_434_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_434_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_434_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [434] if: Bool # (List(Nat) # List(Nat) -> Bool) # (List(Nat) # List(Nat) -> Bool) -> List(Nat) # List(Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_434_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584156600))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_434_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_434_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_434_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_434_3(t[0], t[1], t[2], this_rewriter); }


  // [434] if: Bool # (List(Nat) # List(Nat) -> Bool) # (List(Nat) # List(Nat) -> Bool) -> List(Nat) # List(Nat) -> Bool
  static inline const data_expression& rewr_434_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584485990);
  }

  static inline data_expression rewr_434_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_434_0(this_rewriter); }

  static inline data_expression rewr_434_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_434_0(this_rewriter); }


  // [433] !=: (List(Nat) # List(Nat) -> Bool) # (List(Nat) # List(Nat) -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_433_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_432_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565841565d0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_433_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_433_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_433_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_433_2(t[0], t[1], this_rewriter); }


  // [433] !=: (List(Nat) # List(Nat) -> Bool) # (List(Nat) # List(Nat) -> Bool) -> Bool
  static inline const data_expression& rewr_433_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584485900);
  }

  static inline data_expression rewr_433_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_433_0(this_rewriter); }

  static inline data_expression rewr_433_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_433_0(this_rewriter); }


  // [432] ==: (List(Nat) # List(Nat) -> Bool) # (List(Nat) # List(Nat) -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_432_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: List(Nat). @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(10), rewr_401_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(12)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(9))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(12)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(9)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: List(Nat). @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565841565a0))), arg0, arg1);
  }

  static inline data_expression rewr_432_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_432_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_432_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_432_2(t[0], t[1], this_rewriter); }


  // [432] ==: (List(Nat) # List(Nat) -> Bool) # (List(Nat) # List(Nat) -> Bool) -> Bool
  static inline const data_expression& rewr_432_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584462c80);
  }

  static inline data_expression rewr_432_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_432_0(this_rewriter); }

  static inline data_expression rewr_432_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_432_0(this_rewriter); }


  // [427] if: Bool # (Trans -> Bool) # (Trans -> Bool) -> Trans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_427_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565841561e0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_427_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_427_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_427_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_427_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [427] if: Bool # (Trans -> Bool) # (Trans -> Bool) -> Trans -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_427_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565841561e0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_427_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_427_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_427_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_427_3(t[0], t[1], t[2], this_rewriter); }


  // [427] if: Bool # (Trans -> Bool) # (Trans -> Bool) -> Trans -> Bool
  static inline const data_expression& rewr_427_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584462510);
  }

  static inline data_expression rewr_427_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_427_0(this_rewriter); }

  static inline data_expression rewr_427_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_427_0(this_rewriter); }


  // [426] !=: (Trans -> Bool) # (Trans -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_426_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_425_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565841561b0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_426_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_426_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_426_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_426_2(t[0], t[1], this_rewriter); }


  // [426] !=: (Trans -> Bool) # (Trans -> Bool) -> Bool
  static inline const data_expression& rewr_426_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584461f50);
  }

  static inline data_expression rewr_426_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_426_0(this_rewriter); }

  static inline data_expression rewr_426_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_426_0(this_rewriter); }


  // [425] ==: (Trans -> Bool) # (Trans -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_425_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Trans. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(6), rewr_401_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(5))), this_rewriter), delayed_application1<data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(5)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Trans. @var_0(x1) == @var_1(x1)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584156180))), arg0, arg1);
  }

  static inline data_expression rewr_425_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_425_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_425_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_425_2(t[0], t[1], this_rewriter); }


  // [425] ==: (Trans -> Bool) # (Trans -> Bool) -> Bool
  static inline const data_expression& rewr_425_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484a30);
  }

  static inline data_expression rewr_425_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_425_0(this_rewriter); }

  static inline data_expression rewr_425_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_425_0(this_rewriter); }


  // [415] if: Bool # ((Place -> List(Nat)) -> List(Trans)) # ((Place -> List(Nat)) -> List(Trans)) -> (Place -> List(Nat)) -> List(Trans)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_415_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584155b20))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_415_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_415_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_415_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_415_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [415] if: Bool # ((Place -> List(Nat)) -> List(Trans)) # ((Place -> List(Nat)) -> List(Trans)) -> (Place -> List(Nat)) -> List(Trans)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_415_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584155b20))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_415_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_415_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_415_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_415_3(t[0], t[1], t[2], this_rewriter); }


  // [415] if: Bool # ((Place -> List(Nat)) -> List(Trans)) # ((Place -> List(Nat)) -> List(Trans)) -> (Place -> List(Nat)) -> List(Trans)
  static inline const data_expression& rewr_415_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484a60);
  }

  static inline data_expression rewr_415_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_415_0(this_rewriter); }

  static inline data_expression rewr_415_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_415_0(this_rewriter); }


  // [414] !=: ((Place -> List(Nat)) -> List(Trans)) # ((Place -> List(Nat)) -> List(Trans)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_414_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_413_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584155af0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_414_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_414_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_414_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_414_2(t[0], t[1], this_rewriter); }


  // [414] !=: ((Place -> List(Nat)) -> List(Trans)) # ((Place -> List(Nat)) -> List(Trans)) -> Bool
  static inline const data_expression& rewr_414_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584486050);
  }

  static inline data_expression rewr_414_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_414_0(this_rewriter); }

  static inline data_expression rewr_414_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_414_0(this_rewriter); }


  // [413] ==: ((Place -> List(Nat)) -> List(Trans)) # ((Place -> List(Nat)) -> List(Trans)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_413_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Place -> List(Nat). @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(14), rewr_282_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(0))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(0))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Place -> List(Nat). @var_0(x1) == @var_1(x1)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584155ac0))), arg0, arg1);
  }

  static inline data_expression rewr_413_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_413_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_413_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_413_2(t[0], t[1], this_rewriter); }


  // [413] ==: ((Place -> List(Nat)) -> List(Trans)) # ((Place -> List(Nat)) -> List(Trans)) -> Bool
  static inline const data_expression& rewr_413_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584486170);
  }

  static inline data_expression rewr_413_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_413_0(this_rewriter); }

  static inline data_expression rewr_413_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_413_0(this_rewriter); }


  // [404] if: Bool # (Trans # Trans # Trans # Trans -> List(Trans)) # (Trans # Trans # Trans # Trans -> List(Trans)) -> Trans # Trans # Trans # Trans -> List(Trans)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4, class DATA_EXPR5, class DATA_EXPR6>
  static inline data_expression rewr_404_7(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, const DATA_EXPR5& arg_not_nf5, const DATA_EXPR6& arg_not_nf6, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@N(@@S(@var_5, @@R(@var_1(@var_2, @var_3, @var_4, @var_5)))))))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@N(@@S(@var_5, @@R(@var_0(@var_2, @var_3, @var_4, @var_5)))))))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
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
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584155460))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter), local_rewrite(arg_not_nf5,this_rewriter), local_rewrite(arg_not_nf6,this_rewriter));
  }

  static inline data_expression rewr_404_7_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_404_7(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), term_not_in_normal_form(t[3], this_rewriter), this_rewriter); }

  static inline data_expression rewr_404_7_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_404_7(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], t[2], t[3], this_rewriter); }


  // [404] if: Bool # (Trans # Trans # Trans # Trans -> List(Trans)) # (Trans # Trans # Trans # Trans -> List(Trans)) -> Trans # Trans # Trans # Trans -> List(Trans)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_404_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584155460))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_404_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_404_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_404_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_404_3(t[0], t[1], t[2], this_rewriter); }


  // [404] if: Bool # (Trans # Trans # Trans # Trans -> List(Trans)) # (Trans # Trans # Trans # Trans -> List(Trans)) -> Trans # Trans # Trans # Trans -> List(Trans)
  static inline const data_expression& rewr_404_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565842ffdb0);
  }

  static inline data_expression rewr_404_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_404_0(this_rewriter); }

  static inline data_expression rewr_404_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_404_0(this_rewriter); }


  // [403] !=: (Trans # Trans # Trans # Trans -> List(Trans)) # (Trans # Trans # Trans # Trans -> List(Trans)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_403_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_402_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584155430))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_403_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_403_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_403_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_403_2(t[0], t[1], this_rewriter); }


  // [403] !=: (Trans # Trans # Trans # Trans -> List(Trans)) # (Trans # Trans # Trans # Trans -> List(Trans)) -> Bool
  static inline const data_expression& rewr_403_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584461e00);
  }

  static inline data_expression rewr_403_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_403_0(this_rewriter); }

  static inline data_expression rewr_403_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_403_0(this_rewriter); }


  // [402] ==: (Trans # Trans # Trans # Trans -> List(Trans)) # (Trans # Trans # Trans # Trans -> List(Trans)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_402_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x2,x3,x7: Trans. @var_0(x1, x2, x3, x7) == @var_1(x1, x2, x3, x7)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(15), rewr_282_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(5)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(15)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(6)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(16))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(5)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(15)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(6)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(16))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x2,x3,x7: Trans. @var_0(x1, x2, x3, x7) == @var_1(x1, x2, x3, x7)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x556584155400))), arg0, arg1);
  }

  static inline data_expression rewr_402_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_402_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_402_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_402_2(t[0], t[1], this_rewriter); }


  // [402] ==: (Trans # Trans # Trans # Trans -> List(Trans)) # (Trans # Trans # Trans # Trans -> List(Trans)) -> Bool
  static inline const data_expression& rewr_402_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484b20);
  }

  static inline data_expression rewr_402_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_402_0(this_rewriter); }

  static inline data_expression rewr_402_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_402_0(this_rewriter); }


  // [396] if: Bool # (Nat # Nat -> Bool) # (Nat # Nat -> Bool) -> Nat # Nat -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_396_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f6d80))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_396_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_396_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_396_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_396_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [396] if: Bool # (Nat # Nat -> Bool) # (Nat # Nat -> Bool) -> Nat # Nat -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_396_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f6d80))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_396_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_396_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_396_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_396_3(t[0], t[1], t[2], this_rewriter); }


  // [396] if: Bool # (Nat # Nat -> Bool) # (Nat # Nat -> Bool) -> Nat # Nat -> Bool
  static inline const data_expression& rewr_396_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584485800);
  }

  static inline data_expression rewr_396_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_396_0(this_rewriter); }

  static inline data_expression rewr_396_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_396_0(this_rewriter); }


  // [395] !=: (Nat # Nat -> Bool) # (Nat # Nat -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_395_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_394_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f6d50))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_395_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_395_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_395_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_395_2(t[0], t[1], this_rewriter); }


  // [395] !=: (Nat # Nat -> Bool) # (Nat # Nat -> Bool) -> Bool
  static inline const data_expression& rewr_395_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584486f60);
  }

  static inline data_expression rewr_395_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_395_0(this_rewriter); }

  static inline data_expression rewr_395_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_395_0(this_rewriter); }


  // [394] ==: (Nat # Nat -> Bool) # (Nat # Nat -> Bool) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_394_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: Nat. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(16), rewr_401_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(8)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(17))), this_rewriter), delayed_application2<data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(8)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(17)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: Nat. @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f6d20))), arg0, arg1);
  }

  static inline data_expression rewr_394_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_394_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_394_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_394_2(t[0], t[1], this_rewriter); }


  // [394] ==: (Nat # Nat -> Bool) # (Nat # Nat -> Bool) -> Bool
  static inline const data_expression& rewr_394_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584486ed0);
  }

  static inline data_expression rewr_394_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_394_0(this_rewriter); }

  static inline data_expression rewr_394_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_394_0(this_rewriter); }


  // [389] if: Bool # (List(Nat) -> Nat) # (List(Nat) -> Nat) -> List(Nat) -> Nat
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_389_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f6930))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_389_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_389_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_389_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_389_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [389] if: Bool # (List(Nat) -> Nat) # (List(Nat) -> Nat) -> List(Nat) -> Nat
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_389_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f6930))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_389_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_389_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_389_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_389_3(t[0], t[1], t[2], this_rewriter); }


  // [389] if: Bool # (List(Nat) -> Nat) # (List(Nat) -> Nat) -> List(Nat) -> Nat
  static inline const data_expression& rewr_389_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584461f20);
  }

  static inline data_expression rewr_389_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_389_0(this_rewriter); }

  static inline data_expression rewr_389_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_389_0(this_rewriter); }


  // [388] !=: (List(Nat) -> Nat) # (List(Nat) -> Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_388_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_387_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f6900))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_388_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_388_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_388_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_388_2(t[0], t[1], this_rewriter); }


  // [388] !=: (List(Nat) -> Nat) # (List(Nat) -> Nat) -> Bool
  static inline const data_expression& rewr_388_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484b80);
  }

  static inline data_expression rewr_388_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_388_0(this_rewriter); }

  static inline data_expression rewr_388_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_388_0(this_rewriter); }


  // [387] ==: (List(Nat) -> Nat) # (List(Nat) -> Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_387_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: List(Nat). @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(17), rewr_35_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(12))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(12))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: List(Nat). @var_0(x1) == @var_1(x1)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f68d0))), arg0, arg1);
  }

  static inline data_expression rewr_387_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_387_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_387_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_387_2(t[0], t[1], this_rewriter); }


  // [387] ==: (List(Nat) -> Nat) # (List(Nat) -> Nat) -> Bool
  static inline const data_expression& rewr_387_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584484be0);
  }

  static inline data_expression rewr_387_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_387_0(this_rewriter); }

  static inline data_expression rewr_387_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_387_0(this_rewriter); }


  // [378] if: Bool # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) -> Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4, class DATA_EXPR5, class DATA_EXPR6, class DATA_EXPR7>
  static inline data_expression rewr_378_8(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, const DATA_EXPR5& arg_not_nf5, const DATA_EXPR6& arg_not_nf6, const DATA_EXPR7& arg_not_nf7, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@N(@@S(@var_5, @@N(@@S(@var_6, @@R(@var_1(@var_2, @var_3, @var_4, @var_5, @var_6)))))))))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@N(@@S(@var_5, @@N(@@S(@var_6, @@R(@var_0(@var_2, @var_3, @var_4, @var_5, @var_6)))))))))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
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
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f62a0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter), local_rewrite(arg_not_nf5,this_rewriter), local_rewrite(arg_not_nf6,this_rewriter), local_rewrite(arg_not_nf7,this_rewriter));
  }

  static inline data_expression rewr_378_8_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_378_8(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), term_not_in_normal_form(t[3], this_rewriter), term_not_in_normal_form(t[4], this_rewriter), this_rewriter); }

  static inline data_expression rewr_378_8_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_378_8(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], t[2], t[3], t[4], this_rewriter); }


  // [378] if: Bool # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) -> Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_378_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f62a0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_378_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_378_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_378_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_378_3(t[0], t[1], t[2], this_rewriter); }


  // [378] if: Bool # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) -> Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans
  static inline const data_expression& rewr_378_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584486740);
  }

  static inline data_expression rewr_378_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_378_0(this_rewriter); }

  static inline data_expression rewr_378_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_378_0(this_rewriter); }


  // [377] !=: (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_377_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_376_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f6270))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_377_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_377_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_377_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_377_2(t[0], t[1], this_rewriter); }


  // [377] !=: (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) -> Bool
  static inline const data_expression& rewr_377_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584461020);
  }

  static inline data_expression rewr_377_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_377_0(this_rewriter); }

  static inline data_expression rewr_377_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_377_0(this_rewriter); }


  // [376] ==: (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_376_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Trans_name, x2: Bool, x3: Nat, x4,x9: List(PlaceTokens). @var_0(x1, x2, x3, x4, x9) == @var_1(x1, x2, x3, x4, x9)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(18), rewr_80_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(2)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(18)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(17)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(19)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(20))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(2)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(18)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(17)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(19)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(20))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Trans_name, x2: Bool, x3: Nat, x4,x9: List(PlaceTokens). @var_0(x1, x2, x3, x4, x9) == @var_1(x1, x2, x3, x4, x9)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f6240))), arg0, arg1);
  }

  static inline data_expression rewr_376_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_376_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_376_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_376_2(t[0], t[1], this_rewriter); }


  // [376] ==: (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) # (Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans) -> Bool
  static inline const data_expression& rewr_376_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565844867a0);
  }

  static inline data_expression rewr_376_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_376_0(this_rewriter); }

  static inline data_expression rewr_376_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_376_0(this_rewriter); }


  // [371] if: Bool # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) -> PlaceTokens # PlaceTokens -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_371_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f5dc0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_371_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_371_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_371_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_371_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [371] if: Bool # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) -> PlaceTokens # PlaceTokens -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_371_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f5dc0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_371_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_371_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_371_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_371_3(t[0], t[1], t[2], this_rewriter); }


  // [371] if: Bool # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) -> PlaceTokens # PlaceTokens -> List(PlaceTokens)
  static inline const data_expression& rewr_371_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584486440);
  }

  static inline data_expression rewr_371_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_371_0(this_rewriter); }

  static inline data_expression rewr_371_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_371_0(this_rewriter); }


  // [370] !=: (PlaceTokens # PlaceTokens -> List(PlaceTokens)) # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_370_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_369_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f5d90))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_370_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_370_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_370_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_370_2(t[0], t[1], this_rewriter); }


  // [370] !=: (PlaceTokens # PlaceTokens -> List(PlaceTokens)) # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) -> Bool
  static inline const data_expression& rewr_370_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565844874d0);
  }

  static inline data_expression rewr_370_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_370_0(this_rewriter); }

  static inline data_expression rewr_370_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_370_0(this_rewriter); }


  // [369] ==: (PlaceTokens # PlaceTokens -> List(PlaceTokens)) # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_369_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: PlaceTokens. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(19), rewr_263_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(10)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(21))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(10)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(21))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: PlaceTokens. @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f5d60))), arg0, arg1);
  }

  static inline data_expression rewr_369_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_369_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_369_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_369_2(t[0], t[1], this_rewriter); }


  // [369] ==: (PlaceTokens # PlaceTokens -> List(PlaceTokens)) # (PlaceTokens # PlaceTokens -> List(PlaceTokens)) -> Bool
  static inline const data_expression& rewr_369_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584486770);
  }

  static inline data_expression rewr_369_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_369_0(this_rewriter); }

  static inline data_expression rewr_369_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_369_0(this_rewriter); }


  // [364] if: Bool # (PlaceTokens -> List(PlaceTokens)) # (PlaceTokens -> List(PlaceTokens)) -> PlaceTokens -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_364_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f5970))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_364_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_364_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_364_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_364_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [364] if: Bool # (PlaceTokens -> List(PlaceTokens)) # (PlaceTokens -> List(PlaceTokens)) -> PlaceTokens -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_364_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f5970))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_364_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_364_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_364_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_364_3(t[0], t[1], t[2], this_rewriter); }


  // [364] if: Bool # (PlaceTokens -> List(PlaceTokens)) # (PlaceTokens -> List(PlaceTokens)) -> PlaceTokens -> List(PlaceTokens)
  static inline const data_expression& rewr_364_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584486e70);
  }

  static inline data_expression rewr_364_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_364_0(this_rewriter); }

  static inline data_expression rewr_364_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_364_0(this_rewriter); }


  // [363] !=: (PlaceTokens -> List(PlaceTokens)) # (PlaceTokens -> List(PlaceTokens)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_363_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_362_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f5940))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_363_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_363_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_363_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_363_2(t[0], t[1], this_rewriter); }


  // [363] !=: (PlaceTokens -> List(PlaceTokens)) # (PlaceTokens -> List(PlaceTokens)) -> Bool
  static inline const data_expression& rewr_363_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584487560);
  }

  static inline data_expression rewr_363_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_363_0(this_rewriter); }

  static inline data_expression rewr_363_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_363_0(this_rewriter); }


  // [362] ==: (PlaceTokens -> List(PlaceTokens)) # (PlaceTokens -> List(PlaceTokens)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_362_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: PlaceTokens. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(20), rewr_263_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(10))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(10))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: PlaceTokens. @var_0(x1) == @var_1(x1)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f5910))), arg0, arg1);
  }

  static inline data_expression rewr_362_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_362_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_362_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_362_2(t[0], t[1], this_rewriter); }


  // [362] ==: (PlaceTokens -> List(PlaceTokens)) # (PlaceTokens -> List(PlaceTokens)) -> Bool
  static inline const data_expression& rewr_362_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584486560);
  }

  static inline data_expression rewr_362_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_362_0(this_rewriter); }

  static inline data_expression rewr_362_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_362_0(this_rewriter); }


  // [352] if: Bool # (Place # List(Nat) -> PlaceTokens) # (Place # List(Nat) -> PlaceTokens) -> Place # List(Nat) -> PlaceTokens
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_352_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f51f0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_352_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_352_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_352_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_352_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [352] if: Bool # (Place # List(Nat) -> PlaceTokens) # (Place # List(Nat) -> PlaceTokens) -> Place # List(Nat) -> PlaceTokens
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_352_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f51f0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_352_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_352_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_352_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_352_3(t[0], t[1], t[2], this_rewriter); }


  // [352] if: Bool # (Place # List(Nat) -> PlaceTokens) # (Place # List(Nat) -> PlaceTokens) -> Place # List(Nat) -> PlaceTokens
  static inline const data_expression& rewr_352_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584486680);
  }

  static inline data_expression rewr_352_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_352_0(this_rewriter); }

  static inline data_expression rewr_352_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_352_0(this_rewriter); }


  // [351] !=: (Place # List(Nat) -> PlaceTokens) # (Place # List(Nat) -> PlaceTokens) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_351_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_350_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f51c0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_351_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_351_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_351_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_351_2(t[0], t[1], this_rewriter); }


  // [351] !=: (Place # List(Nat) -> PlaceTokens) # (Place # List(Nat) -> PlaceTokens) -> Bool
  static inline const data_expression& rewr_351_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565844876b0);
  }

  static inline data_expression rewr_351_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_351_0(this_rewriter); }

  static inline data_expression rewr_351_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_351_0(this_rewriter); }


  // [350] ==: (Place # List(Nat) -> PlaceTokens) # (Place # List(Nat) -> PlaceTokens) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_350_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Place, x3: List(Nat). @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(21), rewr_264_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(22)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(9))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(22)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(9))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Place, x3: List(Nat). @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f5190))), arg0, arg1);
  }

  static inline data_expression rewr_350_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_350_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_350_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_350_2(t[0], t[1], this_rewriter); }


  // [350] ==: (Place # List(Nat) -> PlaceTokens) # (Place # List(Nat) -> PlaceTokens) -> Bool
  static inline const data_expression& rewr_350_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584486500);
  }

  static inline data_expression rewr_350_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_350_0(this_rewriter); }

  static inline data_expression rewr_350_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_350_0(this_rewriter); }


  // [345] if: Bool # (Nat -> List(Nat)) # (Nat -> List(Nat)) -> Nat -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_345_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f4dd0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_345_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_345_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_345_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_345_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [345] if: Bool # (Nat -> List(Nat)) # (Nat -> List(Nat)) -> Nat -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_345_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f4dd0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_345_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_345_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_345_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_345_3(t[0], t[1], t[2], this_rewriter); }


  // [345] if: Bool # (Nat -> List(Nat)) # (Nat -> List(Nat)) -> Nat -> List(Nat)
  static inline const data_expression& rewr_345_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565844875f0);
  }

  static inline data_expression rewr_345_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_345_0(this_rewriter); }

  static inline data_expression rewr_345_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_345_0(this_rewriter); }


  // [344] !=: (Nat -> List(Nat)) # (Nat -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_344_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_343_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f4da0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_344_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_344_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_344_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_344_2(t[0], t[1], this_rewriter); }


  // [344] !=: (Nat -> List(Nat)) # (Nat -> List(Nat)) -> Bool
  static inline const data_expression& rewr_344_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584487770);
  }

  static inline data_expression rewr_344_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_344_0(this_rewriter); }

  static inline data_expression rewr_344_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_344_0(this_rewriter); }


  // [343] ==: (Nat -> List(Nat)) # (Nat -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_343_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Nat. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(22), rewr_297_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(8))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(8))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Nat. @var_0(x1) == @var_1(x1)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f4d70))), arg0, arg1);
  }

  static inline data_expression rewr_343_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_343_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_343_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_343_2(t[0], t[1], this_rewriter); }


  // [343] ==: (Nat -> List(Nat)) # (Nat -> List(Nat)) -> Bool
  static inline const data_expression& rewr_343_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565844864d0);
  }

  static inline data_expression rewr_343_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_343_0(this_rewriter); }

  static inline data_expression rewr_343_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_343_0(this_rewriter); }


  // [334] if: Bool # (Pos -> Nat) # (Pos -> Nat) -> Pos -> Nat
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_334_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f4770))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_334_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_334_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_334_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_334_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [334] if: Bool # (Pos -> Nat) # (Pos -> Nat) -> Pos -> Nat
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_334_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f4770))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_334_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_334_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_334_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_334_3(t[0], t[1], t[2], this_rewriter); }


  // [334] if: Bool # (Pos -> Nat) # (Pos -> Nat) -> Pos -> Nat
  static inline const data_expression& rewr_334_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584486590);
  }

  static inline data_expression rewr_334_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_334_0(this_rewriter); }

  static inline data_expression rewr_334_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_334_0(this_rewriter); }


  // [333] !=: (Pos -> Nat) # (Pos -> Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_333_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_332_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f4740))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_333_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_333_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_333_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_333_2(t[0], t[1], this_rewriter); }


  // [333] !=: (Pos -> Nat) # (Pos -> Nat) -> Bool
  static inline const data_expression& rewr_333_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584460950);
  }

  static inline data_expression rewr_333_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_333_0(this_rewriter); }

  static inline data_expression rewr_333_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_333_0(this_rewriter); }


  // [332] ==: (Pos -> Nat) # (Pos -> Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_332_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Pos. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(23), rewr_35_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(23))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(23))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Pos. @var_0(x1) == @var_1(x1)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f4710))), arg0, arg1);
  }

  static inline data_expression rewr_332_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_332_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_332_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_332_2(t[0], t[1], this_rewriter); }


  // [332] ==: (Pos -> Nat) # (Pos -> Nat) -> Bool
  static inline const data_expression& rewr_332_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584460270);
  }

  static inline data_expression rewr_332_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_332_0(this_rewriter); }

  static inline data_expression rewr_332_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_332_0(this_rewriter); }


  // [322] if: Bool # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) -> (Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4, class DATA_EXPR5, class DATA_EXPR6>
  static inline data_expression rewr_322_7(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, const DATA_EXPR5& arg_not_nf5, const DATA_EXPR6& arg_not_nf6, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@N(@@S(@var_5, @@R(@var_1(@var_2, @var_3, @var_4)(@var_5)))))))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@N(@@S(@var_5, @@R(@var_0(@var_2, @var_3, @var_4)(@var_5)))))))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
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
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f3ff0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter), local_rewrite(arg_not_nf5,this_rewriter)), local_rewrite(arg_not_nf6,this_rewriter));
  }

  static inline data_expression rewr_322_7_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_322_7(term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(down_cast<application>(t.head()).head())[2], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_322_7_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_322_7(down_cast<application>(down_cast<application>(t.head()).head())[0], down_cast<application>(down_cast<application>(t.head()).head())[1], down_cast<application>(down_cast<application>(t.head()).head())[2], down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [322] if: Bool # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) -> (Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4, class DATA_EXPR5>
  static inline data_expression rewr_322_6(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, const DATA_EXPR5& arg_not_nf5, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_1(@var_2, @var_3, @var_4)))))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@N(@@S(@var_4, @@R(@var_0(@var_2, @var_3, @var_4)))))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        const DATA_EXPR5& var_4 = arg_not_nf5; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter), local_rewrite(var_4, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3, @var_4)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f3ff0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter), local_rewrite(arg_not_nf5,this_rewriter));
  }

  static inline data_expression rewr_322_6_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_322_6(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_322_6_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_322_6(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], t[2], this_rewriter); }


  // [322] if: Bool # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) -> (Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_322_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f3ff0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_322_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_322_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_322_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_322_3(t[0], t[1], t[2], this_rewriter); }


  // [322] if: Bool # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) -> (Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)
  static inline const data_expression& rewr_322_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584487a40);
  }

  static inline data_expression rewr_322_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_322_0(this_rewriter); }

  static inline data_expression rewr_322_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_322_0(this_rewriter); }


  // [321] !=: ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_321_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_320_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f3fc0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_321_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_321_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_321_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_321_2(t[0], t[1], this_rewriter); }


  // [321] !=: ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_321_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584487bc0);
  }

  static inline data_expression rewr_321_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_321_0(this_rewriter); }

  static inline data_expression rewr_321_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_321_0(this_rewriter); }


  // [320] ==: ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_320_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Place -> List(Nat), x2: Place, x5: List(Nat). @var_0(x1, x2, x5) == @var_1(x1, x2, x5)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(24), rewr_83_2(delayed_application3<data_expression,data_expression,data_expression,data_expression>(local_rewrite(var_0, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(24)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(25)), this_rewriter), delayed_application3<data_expression,data_expression,data_expression,data_expression>(local_rewrite(var_1, this_rewriter),static_cast<const data_expression&>(this_rewriter->bound_variable_get(0)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(24)),static_cast<const data_expression&>(this_rewriter->bound_variable_get(25)), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Place -> List(Nat), x2: Place, x5: List(Nat). @var_0(x1, x2, x5) == @var_1(x1, x2, x5)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f3f90))), arg0, arg1);
  }

  static inline data_expression rewr_320_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_320_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_320_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_320_2(t[0], t[1], this_rewriter); }


  // [320] ==: ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) # ((Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_320_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584487b00);
  }

  static inline data_expression rewr_320_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_320_0(this_rewriter); }

  static inline data_expression rewr_320_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_320_0(this_rewriter); }


  // [315] if: Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_315_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@R(@var_1(@var_2)))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@R(@var_0(@var_2)))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter)), this_rewriter); // R1 @var_1(@var_2)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f3ba0))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter));
  }

  static inline data_expression rewr_315_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_315_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_315_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_315_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [315] if: Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_315_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f3ba0))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_315_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_315_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_315_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_315_3(t[0], t[1], t[2], this_rewriter); }


  // [315] if: Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)
  static inline const data_expression& rewr_315_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584486d40);
  }

  static inline data_expression rewr_315_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_315_0(this_rewriter); }

  static inline data_expression rewr_315_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_315_0(this_rewriter); }


  // [314] !=: (Place -> List(Nat)) # (Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_314_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_83_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f3b70))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_314_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_314_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_314_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_314_2(t[0], t[1], this_rewriter); }


  // [314] !=: (Place -> List(Nat)) # (Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_314_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584487b30);
  }

  static inline data_expression rewr_314_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_314_0(this_rewriter); }

  static inline data_expression rewr_314_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_314_0(this_rewriter); }


  // [311] @if_always_else: Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_311_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

  {
    // Implement function @if_always_else by calling a user defined rewrite function.
    return rewrite_aux(application(if_always_else_manual_implementation(local_rewrite(arg_not_nf0,this_rewriter),local_rewrite(arg_not_nf1,this_rewriter),local_rewrite(arg_not_nf2,this_rewriter)), local_rewrite(arg_not_nf3,this_rewriter)),true,this_rewriter);  }

  static inline data_expression rewr_311_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_311_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_311_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_311_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [311] @if_always_else: Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_311_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // Implement function @if_always_else by calling a user defined rewrite function.
    return if_always_else_manual_implementation(local_rewrite(arg_not_nf0,this_rewriter),local_rewrite(arg_not_nf1,this_rewriter),local_rewrite(arg_not_nf2,this_rewriter));  }

  static inline data_expression rewr_311_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_311_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_311_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_311_3(t[0], t[1], t[2], this_rewriter); }


  // [311] @if_always_else: Bool # (Place -> List(Nat)) # (Place -> List(Nat)) -> Place -> List(Nat)
  static inline const data_expression& rewr_311_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584486d70);
  }

  static inline data_expression rewr_311_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_311_0(this_rewriter); }

  static inline data_expression rewr_311_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_311_0(this_rewriter); }


  // [310] @is_not_an_update: (Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0>
  static inline data_expression rewr_310_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    // Implement function @is_not_an_update by calling a user defined rewrite function.
    return is_not_a_function_update_manual_implementation(local_rewrite(arg_not_nf0,this_rewriter));  }

  static inline data_expression rewr_310_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_310_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_310_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_310_1(t[0], this_rewriter); }


  // [310] @is_not_an_update: (Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_310_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584487030);
  }

  static inline data_expression rewr_310_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_310_0(this_rewriter); }

  static inline data_expression rewr_310_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_310_0(this_rewriter); }


  // [85] @func_update_stable: (Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3>
  static inline data_expression rewr_85_4(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, RewriterCompilingJitty* this_rewriter)

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
      if (rewr_313_2(var_1, var_3,  this_rewriter) == sort_bool::true_()) // C
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840edc00))), local_rewrite(arg_not_nf0,this_rewriter), arg1, local_rewrite(arg_not_nf2,this_rewriter)), arg3);
  }

  static inline data_expression rewr_85_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_85_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_85_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_85_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [85] @func_update_stable: (Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_85_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840edc00))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter), local_rewrite(arg_not_nf2,this_rewriter));
  }

  static inline data_expression rewr_85_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_85_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_85_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_85_3(t[0], t[1], t[2], this_rewriter); }


  // [85] @func_update_stable: (Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)
  static inline const data_expression& rewr_85_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584487cb0);
  }

  static inline data_expression rewr_85_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_85_0(this_rewriter); }

  static inline data_expression rewr_85_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_85_0(this_rewriter); }


  // [83] ==: (Place -> List(Nat)) # (Place -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_83_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1: Place. @var_0(x1) == @var_1(x1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(25), rewr_297_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(22))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(22))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1: Place. @var_0(x1) == @var_1(x1)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840ed990))), arg0, arg1);
  }

  static inline data_expression rewr_83_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_83_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_83_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_83_2(t[0], t[1], this_rewriter); }


  // [83] ==: (Place -> List(Nat)) # (Place -> List(Nat)) -> Bool
  static inline const data_expression& rewr_83_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584487a70);
  }

  static inline data_expression rewr_83_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_83_0(this_rewriter); }

  static inline data_expression rewr_83_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_83_0(this_rewriter); }


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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840edc00) // F1
      {
        const data_expression& var_0 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_1 = down_cast<data_expression>(arg0[2]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[3]); // S2
        const data_expression& var_3 = arg1; // S1a
        const DATA_EXPR2& var_4 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_5 = arg_not_nf3; // S1b
        if (rewr_312_2(var_1, var_3,  this_rewriter) == sort_bool::true_()) // C
        {
          return rewr_85_4(delayed_rewr_13_3<data_expression, data_expression, DATA_EXPR2>(var_0, var_3, var_4,  this_rewriter), var_1, var_2, local_rewrite(var_5, this_rewriter),  this_rewriter); // R1 @var_0[@var_3 -> @var_4][@var_1 -> @var_2](@var_5)
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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840edc00) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        const data_expression& var_3 = down_cast<data_expression>(arg0[3]); // S2
        const data_expression& var_4 = arg1; // S1a
        if (var_2 == arg1) // M
        {
          const data_expression& var_5 = arg2; // S1a
          const DATA_EXPR3& var_6 = arg_not_nf3; // S1b
          return rewr_311_4(rewr_297_2(rewrite_with_arguments_in_normal_form(application(var_1, var_2), this_rewriter), var_5,  this_rewriter), var_1, rewr_85_3(var_1, var_2, var_5,  this_rewriter), local_rewrite(var_6, this_rewriter),  this_rewriter); // R1 @if_always_else(@var_1(@var_2) == @var_5, @var_1, @var_1[@var_2 -> @var_5])(@var_6)
        }
        else
        {
          const data_expression& var_5 = arg2; // S1a
          const DATA_EXPR3& var_6 = arg_not_nf3; // S1b
          if (rewr_312_2(var_4, var_2,  this_rewriter) == sort_bool::true_()) // C
          {
            return rewr_311_4(rewr_297_2(rewrite_with_arguments_in_normal_form(application(var_1, var_4), this_rewriter), var_5,  this_rewriter), rewr_85_3(var_1, var_2, var_3,  this_rewriter), rewr_85_3(delayed_rewr_85_3<data_expression, data_expression, data_expression>(var_1, var_2, var_3,  this_rewriter), var_4, var_5,  this_rewriter), local_rewrite(var_6, this_rewriter),  this_rewriter); // R1 @if_always_else(@var_1(@var_4) == @var_5, @var_1[@var_2 -> @var_3], @var_1[@var_2 -> @var_3][@var_4 -> @var_5])(@var_6)
          }
          else
          {
            if (rewr_310_1(var_0,  this_rewriter) == sort_bool::true_()) // C
            {
              return rewr_311_4(rewr_297_2(rewrite_with_arguments_in_normal_form(application(var_0, var_4), this_rewriter), var_5,  this_rewriter), var_0, rewr_85_3(var_0, var_4, var_5,  this_rewriter), local_rewrite(var_6, this_rewriter),  this_rewriter); // R1 @if_always_else(@var_0(@var_4) == @var_5, @var_0, @var_0[@var_4 -> @var_5])(@var_6)
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
        if (rewr_310_1(var_0,  this_rewriter) == sort_bool::true_()) // C
        {
          return rewr_311_4(rewr_297_2(rewrite_with_arguments_in_normal_form(application(var_0, var_1), this_rewriter), var_2,  this_rewriter), var_0, rewr_85_3(var_0, var_1, var_2,  this_rewriter), local_rewrite(var_3, this_rewriter),  this_rewriter); // R1 @if_always_else(@var_0(@var_1) == @var_2, @var_0, @var_0[@var_1 -> @var_2])(@var_3)
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
      if (rewr_313_2(var_1, var_3,  this_rewriter) == sort_bool::true_()) // C
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840eb740))), arg0, arg1, arg2), arg3);
  }

  static inline data_expression rewr_13_4_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_13_4(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_13_4_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_13_4(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], this_rewriter); }


  // [85] @func_update_stable: (Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  class delayed_rewr_85_3
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      const DATA_EXPR2& m_t2;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_85_3(const DATA_EXPR0& t0, const DATA_EXPR1& t1, const DATA_EXPR2& t2, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), m_t2(t2), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_85_3(m_t0, m_t1, m_t2, this_rewriter);
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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840edc00) // F1
      {
        const data_expression& var_0 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_1 = down_cast<data_expression>(arg0[2]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[3]); // S2
        const data_expression& var_3 = arg1; // S1a
        const DATA_EXPR2& var_4 = arg_not_nf2; // S1b
        if (rewr_312_2(var_1, var_3,  this_rewriter) == sort_bool::true_()) // C
        {
          return rewr_85_3(delayed_rewr_13_3<data_expression, data_expression, DATA_EXPR2>(var_0, var_3, var_4,  this_rewriter), var_1, var_2,  this_rewriter); // R1 @var_0[@var_3 -> @var_4][@var_1 -> @var_2]
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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840edc00) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        const data_expression& var_3 = down_cast<data_expression>(arg0[3]); // S2
        const data_expression& var_4 = arg1; // S1a
        if (var_2 == arg1) // M
        {
          const data_expression& var_5 = arg2; // S1a
          return rewr_311_3(rewr_297_2(rewrite_with_arguments_in_normal_form(application(var_1, var_2), this_rewriter), var_5,  this_rewriter), var_1, rewr_85_3(var_1, var_2, var_5,  this_rewriter),  this_rewriter); // R1 @if_always_else(@var_1(@var_2) == @var_5, @var_1, @var_1[@var_2 -> @var_5])
        }
        else
        {
          const data_expression& var_5 = arg2; // S1a
          if (rewr_310_1(var_0,  this_rewriter) == sort_bool::true_()) // C
          {
            return rewr_311_3(rewr_297_2(rewrite_with_arguments_in_normal_form(application(var_0, var_4), this_rewriter), var_5,  this_rewriter), var_0, rewr_85_3(var_0, var_4, var_5,  this_rewriter),  this_rewriter); // R1 @if_always_else(@var_0(@var_4) == @var_5, @var_0, @var_0[@var_4 -> @var_5])
          }
          else
          {
            if (rewr_312_2(var_4, var_2,  this_rewriter) == sort_bool::true_()) // C
            {
              return rewr_311_3(rewr_297_2(rewrite_with_arguments_in_normal_form(application(var_1, var_4), this_rewriter), var_5,  this_rewriter), rewr_85_3(var_1, var_2, var_3,  this_rewriter), rewr_85_3(delayed_rewr_85_3<data_expression, data_expression, data_expression>(var_1, var_2, var_3,  this_rewriter), var_4, var_5,  this_rewriter),  this_rewriter); // R1 @if_always_else(@var_1(@var_4) == @var_5, @var_1[@var_2 -> @var_3], @var_1[@var_2 -> @var_3][@var_4 -> @var_5])
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
        if (rewr_310_1(var_0,  this_rewriter) == sort_bool::true_()) // C
        {
          return rewr_311_3(rewr_297_2(rewrite_with_arguments_in_normal_form(application(var_0, var_1), this_rewriter), var_2,  this_rewriter), var_0, rewr_85_3(var_0, var_1, var_2,  this_rewriter),  this_rewriter); // R1 @if_always_else(@var_0(@var_1) == @var_2, @var_0, @var_0[@var_1 -> @var_2])
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840eb740))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_13_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_13_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_13_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_13_3(t[0], t[1], t[2], this_rewriter); }


  // [13] @func_update: (Place -> List(Nat)) # Place # List(Nat) -> Place -> List(Nat)
  static inline const data_expression& rewr_13_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658445fb00);
  }

  static inline data_expression rewr_13_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_13_0(this_rewriter); }

  static inline data_expression rewr_13_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_13_0(this_rewriter); }


  // [305] if: Bool # (Nat # Nat -> List(Nat)) # (Nat # Nat -> List(Nat)) -> Nat # Nat -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_305_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_1(@var_2, @var_3)))))))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@N(@@S(@var_2, @@N(@@S(@var_3, @@R(@var_0(@var_2, @var_3)))))))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        const DATA_EXPR3& var_2 = arg_not_nf3; // S1b
        const DATA_EXPR4& var_3 = arg_not_nf4; // S1b
        return rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), local_rewrite(var_2, this_rewriter), local_rewrite(var_3, this_rewriter)), this_rewriter); // R1 @var_1(@var_2, @var_3)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f3450))), arg0, arg1, arg2), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_305_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_305_5(term_not_in_normal_form(down_cast<application>(t.head())[0], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[1], this_rewriter), term_not_in_normal_form(down_cast<application>(t.head())[2], this_rewriter), term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_305_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_305_5(down_cast<application>(t.head())[0], down_cast<application>(t.head())[1], down_cast<application>(t.head())[2], t[0], t[1], this_rewriter); }


  // [305] if: Bool # (Nat # Nat -> List(Nat)) # (Nat # Nat -> List(Nat)) -> Nat # Nat -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_305_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f3450))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_305_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_305_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_305_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_305_3(t[0], t[1], t[2], this_rewriter); }


  // [305] if: Bool # (Nat # Nat -> List(Nat)) # (Nat # Nat -> List(Nat)) -> Nat # Nat -> List(Nat)
  static inline const data_expression& rewr_305_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584487260);
  }

  static inline data_expression rewr_305_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_305_0(this_rewriter); }

  static inline data_expression rewr_305_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_305_0(this_rewriter); }


  // [304] !=: (Nat # Nat -> List(Nat)) # (Nat # Nat -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_304_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_303_2(var_0, var_1,  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f3420))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_304_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_304_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_304_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_304_2(t[0], t[1], this_rewriter); }


  // [304] !=: (Nat # Nat -> List(Nat)) # (Nat # Nat -> List(Nat)) -> Bool
  static inline const data_expression& rewr_304_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584488200);
  }

  static inline data_expression rewr_304_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_304_0(this_rewriter); }

  static inline data_expression rewr_304_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_304_0(this_rewriter); }


  // [303] ==: (Nat # Nat -> List(Nat)) # (Nat # Nat -> List(Nat)) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_303_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(forall x1,x3: Nat. @var_0(x1, x3) == @var_1(x1, x3)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return static_cast<const data_expression&>(this_rewriter->universal_quantifier_enumeration(this_rewriter->binding_variable_list_get(16), rewr_297_2(rewrite_with_arguments_in_normal_form(application(local_rewrite(var_0, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(8)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(17))), this_rewriter), rewrite_with_arguments_in_normal_form(application(local_rewrite(var_1, this_rewriter), static_cast<const data_expression&>(this_rewriter->bound_variable_get(8)), static_cast<const data_expression&>(this_rewriter->bound_variable_get(17))), this_rewriter),  this_rewriter), true, sigma(this_rewriter))); // R1 forall x1,x3: Nat. @var_0(x1, x3) == @var_1(x1, x3)
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
        return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f33f0))), arg0, arg1);
  }

  static inline data_expression rewr_303_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_303_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_303_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_303_2(t[0], t[1], this_rewriter); }


  // [303] ==: (Nat # Nat -> List(Nat)) # (Nat # Nat -> List(Nat)) -> Bool
  static inline const data_expression& rewr_303_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584487aa0);
  }

  static inline data_expression rewr_303_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_303_0(this_rewriter); }

  static inline data_expression rewr_303_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_303_0(this_rewriter); }


  // [300] if: Bool # List(Nat) # List(Nat) -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_300_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f3150))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_300_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_300_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_300_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_300_3(t[0], t[1], t[2], this_rewriter); }


  // [300] if: Bool # List(Nat) # List(Nat) -> List(Nat)
  static inline const data_expression& rewr_300_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584488230);
  }

  static inline data_expression rewr_300_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_300_0(this_rewriter); }

  static inline data_expression rewr_300_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_300_0(this_rewriter); }


  // [299] !=: List(Nat) # List(Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_299_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_297_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f3120))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_299_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_299_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_299_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_299_2(t[0], t[1], this_rewriter); }


  // [299] !=: List(Nat) # List(Nat) -> Bool
  static inline const data_expression& rewr_299_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658421f2d0);
  }

  static inline data_expression rewr_299_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_299_0(this_rewriter); }

  static inline data_expression rewr_299_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_299_0(this_rewriter); }


  // [297] ==: List(Nat) # List(Nat) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_297_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840ec970) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
        }
        else
        {
          if (uint_address(arg1) == 0x5565840eb6b0) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840ec970) // F1
            {
              const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
              const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
              return rewr_45_2(rewr_35_2(var_1, var_3,  this_rewriter), delayed_rewr_297_2<data_expression, data_expression>(var_2, var_4,  this_rewriter),  this_rewriter); // R1 @var_1 == @var_3 && @var_2 == @var_4
            }
            else
            {
            }
          }
        }
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb6b0) // F1
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840ec970) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
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
            return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f2940))), arg0, arg1);
  }

  static inline data_expression rewr_297_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_297_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_297_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_297_2(t[0], t[1], this_rewriter); }


  // [297] ==: List(Nat) # List(Nat) -> Bool
  static inline const data_expression& rewr_297_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658421f300);
  }

  static inline data_expression rewr_297_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_297_0(this_rewriter); }

  static inline data_expression rewr_297_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_297_0(this_rewriter); }


  // [56] ++: List(Nat) # List(Nat) -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_56_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(|>, @@S(@var_0, @@N(@@S(@var_1, @@D(@@N(@@S(@var_2, @@R(@var_0 |> @var_1 ++ @var_2))))))), @@F([], @@D(@@N(@@S(@var_0, @@R(@var_0)))), @@X))
    {
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840ec970) // F1
      {
        const data_expression& var_0 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_1 = down_cast<data_expression>(arg0[2]); // S2
        const DATA_EXPR1& var_2 = arg_not_nf1; // S1b
        return rewr_60_2(var_0, rewr_56_2(var_1, var_2,  this_rewriter),  this_rewriter); // R1 @var_0 |> @var_1 ++ @var_2
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb6b0) // F1
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
      if (uint_address(arg1) == 0x5565840eb6b0) // F1
      {
        return var_0; // R1 @var_0
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840ec700))), arg0, arg1);
  }

  static inline data_expression rewr_56_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_56_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_56_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_56_2(t[0], t[1], this_rewriter); }


  // [56] ++: List(Nat) # List(Nat) -> List(Nat)
  static inline const data_expression& rewr_56_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584487a10);
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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840ec970) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
        }
        else
        {
          if (uint_address(arg1) == 0x5565840eb6b0) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840ec970) // F1
            {
              const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
              const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
              return rewr_81_2(rewr_45_2(rewr_35_2(var_1, var_3,  this_rewriter), delayed_rewr_41_2<data_expression, data_expression>(var_2, var_4,  this_rewriter),  this_rewriter), delayed_rewr_102_2<data_expression, data_expression>(var_1, var_3,  this_rewriter),  this_rewriter); // R1 @var_1 == @var_3 && @var_2 <= @var_4 || @var_1 < @var_3
            }
            else
            {
            }
          }
        }
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb6b0) // F1
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840ec970) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
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
            return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840ec040))), arg0, arg1);
  }

  static inline data_expression rewr_41_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_41_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_41_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_41_2(t[0], t[1], this_rewriter); }


  // [102] <: Nat # Nat -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_102_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_102_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_102_2(m_t0, m_t1, this_rewriter);
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
    return *reinterpret_cast<const data_expression*>(0x55658445fa70);
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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840ec970) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[2]); // S2
        return rewr_17_1(rewr_98_1(rewr_34_1(var_1,  this_rewriter),  this_rewriter),  this_rewriter); // R1 succ(#@var_1)
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb6b0) // F1
        {
          return *reinterpret_cast<const data_expression*>(0x55658445faa0); // R1 0
        }
        else
        {
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840ebe30))), arg0);
  }

  static inline data_expression rewr_34_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_34_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_34_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_34_1(t[0], this_rewriter); }


  // [34] #: List(Nat) -> Nat
  static inline const data_expression& rewr_34_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584487290);
  }

  static inline data_expression rewr_34_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_34_0(this_rewriter); }

  static inline data_expression rewr_34_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_34_0(this_rewriter); }


  // [287] if: Bool # List(Trans) # List(Trans) -> List(Trans)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_287_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f2460))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_287_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_287_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_287_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_287_3(t[0], t[1], t[2], this_rewriter); }


  // [287] if: Bool # List(Trans) # List(Trans) -> List(Trans)
  static inline const data_expression& rewr_287_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584486900);
  }

  static inline data_expression rewr_287_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_287_0(this_rewriter); }

  static inline data_expression rewr_287_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_287_0(this_rewriter); }


  // [286] !=: List(Trans) # List(Trans) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_286_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_282_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f2430))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_286_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_286_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_286_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_286_2(t[0], t[1], this_rewriter); }


  // [286] !=: List(Trans) # List(Trans) -> Bool
  static inline const data_expression& rewr_286_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584486930);
  }

  static inline data_expression rewr_286_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_286_0(this_rewriter); }

  static inline data_expression rewr_286_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_286_0(this_rewriter); }


  // [282] ==: List(Trans) # List(Trans) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_282_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840f1950) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
        }
        else
        {
          if (uint_address(arg1) == 0x5565840f1920) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840f1950) // F1
            {
              const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
              const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
              return rewr_45_2(rewr_80_2(var_1, var_3,  this_rewriter), delayed_rewr_282_2<data_expression, data_expression>(var_2, var_4,  this_rewriter),  this_rewriter); // R1 @var_1 == @var_3 && @var_2 == @var_4
            }
            else
            {
            }
          }
        }
      }
      else
      {
        if (uint_address(arg0) == 0x5565840f1920) // F1
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840f1950) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
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
            return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f1bf0))), arg0, arg1);
  }

  static inline data_expression rewr_282_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_282_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_282_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_282_2(t[0], t[1], this_rewriter); }


  // [282] ==: List(Trans) # List(Trans) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  class delayed_rewr_282_2
  {
    protected:
      const DATA_EXPR0& m_t0;
      const DATA_EXPR1& m_t1;
      RewriterCompilingJitty* this_rewriter;
    public:
      delayed_rewr_282_2(const DATA_EXPR0& t0, const DATA_EXPR1& t1, RewriterCompilingJitty* tr)
        : m_t0(t0), m_t1(t1), this_rewriter(tr)
      {}

      data_expression normal_form() const
      {
        return rewr_282_2(m_t0, m_t1, this_rewriter);
      }
  };
  
  // [282] ==: List(Trans) # List(Trans) -> Bool
  static inline const data_expression& rewr_282_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584487ad0);
  }

  static inline data_expression rewr_282_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_282_0(this_rewriter); }

  static inline data_expression rewr_282_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_282_0(this_rewriter); }


  // [269] if: Bool # List(PlaceTokens) # List(PlaceTokens) -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2>
  static inline data_expression rewr_269_3(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(0)
    const data_expression& arg0 = local_rewrite(arg_not_nf0,this_rewriter);
    // Considering argument 0
    // @@F(false, @@D(@@N(@@N(@@S(@var_1, @@R(@var_1))))), @@F(true, @@D(@@N(@@S(@var_0, @@N(@@R(@var_0))))), @@X))
    {
      if (uint_address(arg0) == 0x5565840ed240) // F1
      {
        const DATA_EXPR2& var_1 = arg_not_nf2; // S1b
        return local_rewrite(var_1, this_rewriter); // R1 @var_1
      }
      else
      {
        if (uint_address(arg0) == 0x5565840eb7a0) // F1
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
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f1650))), arg0, arg1, arg2);
  }

  static inline data_expression rewr_269_3_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_269_3(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), this_rewriter); }

  static inline data_expression rewr_269_3_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_269_3(t[0], t[1], t[2], this_rewriter); }


  // [269] if: Bool # List(PlaceTokens) # List(PlaceTokens) -> List(PlaceTokens)
  static inline const data_expression& rewr_269_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658421f3e0);
  }

  static inline data_expression rewr_269_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_269_0(this_rewriter); }

  static inline data_expression rewr_269_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_269_0(this_rewriter); }


  // [268] !=: List(PlaceTokens) # List(PlaceTokens) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_268_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@S(@var_0, @@N(@@S(@var_1, @@R(!(@var_0 == @var_1)))))
    {
      const DATA_EXPR0& var_0 = arg_not_nf0; // S1b
      const DATA_EXPR1& var_1 = arg_not_nf1; // S1b
      return rewr_82_1(rewr_263_2(local_rewrite(var_0, this_rewriter), local_rewrite(var_1, this_rewriter),  this_rewriter),  this_rewriter); // R1 !(@var_0 == @var_1)
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f1620))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_268_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_268_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_268_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_268_2(t[0], t[1], this_rewriter); }


  // [268] !=: List(PlaceTokens) # List(PlaceTokens) -> Bool
  static inline const data_expression& rewr_268_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658421f360);
  }

  static inline data_expression rewr_268_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_268_0(this_rewriter); }

  static inline data_expression rewr_268_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_268_0(this_rewriter); }


  // [263] ==: List(PlaceTokens) # List(PlaceTokens) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_263_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

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
      if (uint_address((is_function_symbol(arg0) ? arg0 : arg0[0])) == 0x5565840ec610) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg0[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg0[2]); // S2
        if (var_0 == arg1) // M
        {
          return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
        }
        else
        {
          if (uint_address(arg1) == 0x5565840ec4f0) // F1
          {
            return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840ec610) // F1
            {
              const data_expression& var_3 = down_cast<data_expression>(arg1[1]); // S2
              const data_expression& var_4 = down_cast<data_expression>(arg1[2]); // S2
              return rewr_45_2(rewr_264_2(var_1, var_3,  this_rewriter), delayed_rewr_263_2<data_expression, data_expression>(var_2, var_4,  this_rewriter),  this_rewriter); // R1 @var_1 == @var_3 && @var_2 == @var_4
            }
            else
            {
            }
          }
        }
      }
      else
      {
        if (uint_address(arg0) == 0x5565840ec4f0) // F1
        {
          if (var_0 == arg1) // M
          {
            return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
          }
          else
          {
            if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840ec610) // F1
            {
              return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
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
            return *reinterpret_cast<const data_expression*>(0x55658444fc10); // R1 true
          }
          else
          {
          }
        }
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f0db0))), arg0, arg1);
  }

  static inline data_expression rewr_263_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_263_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_263_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_263_2(t[0], t[1], this_rewriter); }


  // [263] ==: List(PlaceTokens) # List(PlaceTokens) -> Bool
  static inline const data_expression& rewr_263_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584487060);
  }

  static inline data_expression rewr_263_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_263_0(this_rewriter); }

  static inline data_expression rewr_263_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_263_0(this_rewriter); }


  // [43] in: PlaceTokens # List(PlaceTokens) -> Bool
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_43_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    // @@A(1)
    const data_expression& arg1 = local_rewrite(arg_not_nf1,this_rewriter);
    // Considering argument 1
    // @@N(@@F([], @@R(false), @@X))
    {
      if (uint_address(arg1) == 0x5565840ec4f0) // F1
      {
        return *reinterpret_cast<const data_expression*>(0x55658444f320); // R1 false
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
      if (uint_address((is_function_symbol(arg1) ? arg1 : arg1[0])) == 0x5565840ec610) // F1
      {
        const data_expression& var_1 = down_cast<data_expression>(arg1[1]); // S2
        const data_expression& var_2 = down_cast<data_expression>(arg1[2]); // S2
        return rewr_81_2(rewr_264_2(var_0, var_1,  this_rewriter), delayed_rewr_43_2<data_expression, data_expression>(var_0, var_2,  this_rewriter),  this_rewriter); // R1 @var_0 == @var_1 || @var_0 in @var_2
      }
      else
      {
      }
    }
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840ec100))), arg0, arg1);
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
    return *reinterpret_cast<const data_expression*>(0x5565844873e0);
  }

  static inline data_expression rewr_43_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_43_0(this_rewriter); }

  static inline data_expression rewr_43_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_43_0(this_rewriter); }


  // [805] marking_trans: (Place -> List(Nat)) # Trans_name -> MarkingTrans
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_805_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565841904a0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_805_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_805_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_805_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_805_2(t[0], t[1], this_rewriter); }


  // [805] marking_trans: (Place -> List(Nat)) # Trans_name -> MarkingTrans
  static inline const data_expression& rewr_805_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658421f470);
  }

  static inline data_expression rewr_805_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_805_0(this_rewriter); }

  static inline data_expression rewr_805_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_805_0(this_rewriter); }


  // [20] place_tokens: Place # List(Nat) -> PlaceTokens
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_20_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840eba40))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_20_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_20_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_20_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_20_2(t[0], t[1], this_rewriter); }


  // [20] place_tokens: Place # List(Nat) -> PlaceTokens
  static inline const data_expression& rewr_20_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565844881d0);
  }

  static inline data_expression rewr_20_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_20_0(this_rewriter); }

  static inline data_expression rewr_20_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_20_0(this_rewriter); }


  // [28] trans: Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans
  template < class DATA_EXPR0, class DATA_EXPR1, class DATA_EXPR2, class DATA_EXPR3, class DATA_EXPR4>
  static inline data_expression rewr_28_5(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, const DATA_EXPR2& arg_not_nf2, const DATA_EXPR3& arg_not_nf3, const DATA_EXPR4& arg_not_nf4, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840ebc80))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter), local_rewrite(arg_not_nf2,this_rewriter), local_rewrite(arg_not_nf3,this_rewriter), local_rewrite(arg_not_nf4,this_rewriter));
  }

  static inline data_expression rewr_28_5_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_28_5(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), term_not_in_normal_form(t[2], this_rewriter), term_not_in_normal_form(t[3], this_rewriter), term_not_in_normal_form(t[4], this_rewriter), this_rewriter); }

  static inline data_expression rewr_28_5_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_28_5(t[0], t[1], t[2], t[3], t[4], this_rewriter); }


  // [28] trans: Trans_name # Bool # Nat # List(PlaceTokens) # List(PlaceTokens) -> Trans
  static inline const data_expression& rewr_28_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658421f410);
  }

  static inline data_expression rewr_28_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_28_0(this_rewriter); }

  static inline data_expression rewr_28_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_28_0(this_rewriter); }


  // [27] t3: Trans_name
  static inline const data_expression& rewr_27_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565844873b0);
  }

  static inline data_expression rewr_27_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_27_0(this_rewriter); }

  static inline data_expression rewr_27_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_27_0(this_rewriter); }


  // [31] t2: Trans_name
  static inline const data_expression& rewr_31_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584487200);
  }

  static inline data_expression rewr_31_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_31_0(this_rewriter); }

  static inline data_expression rewr_31_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_31_0(this_rewriter); }


  // [36] t1: Trans_name
  static inline const data_expression& rewr_36_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584487170);
  }

  static inline data_expression rewr_36_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_36_0(this_rewriter); }

  static inline data_expression rewr_36_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_36_0(this_rewriter); }


  // [37] t0: Trans_name
  static inline const data_expression& rewr_37_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584487c20);
  }

  static inline data_expression rewr_37_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_37_0(this_rewriter); }

  static inline data_expression rewr_37_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_37_0(this_rewriter); }


  // [19] p5: Place
  static inline const data_expression& rewr_19_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584487b60);
  }

  static inline data_expression rewr_19_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_19_0(this_rewriter); }

  static inline data_expression rewr_19_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_19_0(this_rewriter); }


  // [23] p4: Place
  static inline const data_expression& rewr_23_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584487440);
  }

  static inline data_expression rewr_23_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_23_0(this_rewriter); }

  static inline data_expression rewr_23_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_23_0(this_rewriter); }


  // [25] p3: Place
  static inline const data_expression& rewr_25_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584487410);
  }

  static inline data_expression rewr_25_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_25_0(this_rewriter); }

  static inline data_expression rewr_25_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_25_0(this_rewriter); }


  // [30] p2: Place
  static inline const data_expression& rewr_30_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584487230);
  }

  static inline data_expression rewr_30_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_30_0(this_rewriter); }

  static inline data_expression rewr_30_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_30_0(this_rewriter); }


  // [33] p1: Place
  static inline const data_expression& rewr_33_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658421f440);
  }

  static inline data_expression rewr_33_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_33_0(this_rewriter); }

  static inline data_expression rewr_33_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_33_0(this_rewriter); }


  // [11] p0: Place
  static inline const data_expression& rewr_11_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584487bf0);
  }

  static inline data_expression rewr_11_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_11_0(this_rewriter); }

  static inline data_expression rewr_11_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_11_0(this_rewriter); }


  // [78] @cDub: Bool # Pos -> Pos
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_78_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840ed270))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_78_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_78_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_78_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_78_2(t[0], t[1], this_rewriter); }


  // [78] @cDub: Bool # Pos -> Pos
  static inline const data_expression& rewr_78_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658421f330);
  }

  static inline data_expression rewr_78_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_78_0(this_rewriter); }

  static inline data_expression rewr_78_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_78_0(this_rewriter); }


  // [76] 1: Pos
  static inline const data_expression& rewr_76_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584284750);
  }

  static inline data_expression rewr_76_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_76_0(this_rewriter); }

  static inline data_expression rewr_76_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_76_0(this_rewriter); }


  // [117] @cPair: Nat # Nat -> @NatPair
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_117_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840ef0a0))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_117_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_117_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_117_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_117_2(t[0], t[1], this_rewriter); }


  // [117] @cPair: Nat # Nat -> @NatPair
  static inline const data_expression& rewr_117_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658421f4a0);
  }

  static inline data_expression rewr_117_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_117_0(this_rewriter); }

  static inline data_expression rewr_117_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_117_0(this_rewriter); }


  // [79] 0: Nat
  static inline const data_expression& rewr_79_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658445faa0);
  }

  static inline data_expression rewr_79_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_79_0(this_rewriter); }

  static inline data_expression rewr_79_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_79_0(this_rewriter); }


  // [17] @cNat: Pos -> Nat
  template < class DATA_EXPR0>
  static inline data_expression rewr_17_1(const DATA_EXPR0& arg_not_nf0, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840eb9b0))), local_rewrite(arg_not_nf0,this_rewriter));
  }

  static inline data_expression rewr_17_1_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_17_1(term_not_in_normal_form(t[0], this_rewriter), this_rewriter); }

  static inline data_expression rewr_17_1_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_17_1(t[0], this_rewriter); }


  // [17] @cNat: Pos -> Nat
  static inline const data_expression& rewr_17_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x5565844872c0);
  }

  static inline data_expression rewr_17_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_17_0(this_rewriter); }

  static inline data_expression rewr_17_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_17_0(this_rewriter); }


  // [77] false: Bool
  static inline const data_expression& rewr_77_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658444f320);
  }

  static inline data_expression rewr_77_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_77_0(this_rewriter); }

  static inline data_expression rewr_77_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_77_0(this_rewriter); }


  // [15] true: Bool
  static inline const data_expression& rewr_15_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658444fc10);
  }

  static inline data_expression rewr_15_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_15_0(this_rewriter); }

  static inline data_expression rewr_15_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_15_0(this_rewriter); }


  // [60] |>: Nat # List(Nat) -> List(Nat)
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_60_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840ec970))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_60_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_60_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_60_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_60_2(t[0], t[1], this_rewriter); }


  // [60] |>: Nat # List(Nat) -> List(Nat)
  static inline const data_expression& rewr_60_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584487470);
  }

  static inline data_expression rewr_60_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_60_0(this_rewriter); }

  static inline data_expression rewr_60_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_60_0(this_rewriter); }


  // [12] []: List(Nat)
  static inline const data_expression& rewr_12_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658444fb90);
  }

  static inline data_expression rewr_12_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_12_0(this_rewriter); }

  static inline data_expression rewr_12_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_12_0(this_rewriter); }


  // [273] |>: Trans # List(Trans) -> List(Trans)
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_273_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840f1950))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_273_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_273_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_273_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_273_2(t[0], t[1], this_rewriter); }


  // [273] |>: Trans # List(Trans) -> List(Trans)
  static inline const data_expression& rewr_273_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x55658421e550);
  }

  static inline data_expression rewr_273_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_273_0(this_rewriter); }

  static inline data_expression rewr_273_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_273_0(this_rewriter); }


  // [272] []: List(Trans)
  static inline const data_expression& rewr_272_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584488710);
  }

  static inline data_expression rewr_272_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_272_0(this_rewriter); }

  static inline data_expression rewr_272_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_272_0(this_rewriter); }


  // [54] |>: PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)
  template < class DATA_EXPR0, class DATA_EXPR1>
  static inline data_expression rewr_54_2(const DATA_EXPR0& arg_not_nf0, const DATA_EXPR1& arg_not_nf1, RewriterCompilingJitty* this_rewriter)

  {
    return application(atermpp::down_cast<data_expression>(atermpp::aterm(reinterpret_cast<atermpp::detail::_aterm*>(0x5565840ec610))), local_rewrite(arg_not_nf0,this_rewriter), local_rewrite(arg_not_nf1,this_rewriter));
  }

  static inline data_expression rewr_54_2_term(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_54_2(term_not_in_normal_form(t[0], this_rewriter), term_not_in_normal_form(t[1], this_rewriter), this_rewriter); }

  static inline data_expression rewr_54_2_term_arg_in_normal_form(const application& t, RewriterCompilingJitty* this_rewriter) { return rewr_54_2(t[0], t[1], this_rewriter); }


  // [54] |>: PlaceTokens # List(PlaceTokens) -> List(PlaceTokens)
  static inline const data_expression& rewr_54_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584488800);
  }

  static inline data_expression rewr_54_0_term(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_54_0(this_rewriter); }

  static inline data_expression rewr_54_0_term_arg_in_normal_form(const application&, RewriterCompilingJitty* this_rewriter) { return rewr_54_0(this_rewriter); }


  // [51] []: List(PlaceTokens)
  static inline const data_expression& rewr_51_0(RewriterCompilingJitty* this_rewriter)

  {
    return *reinterpret_cast<const data_expression*>(0x556584488830);
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
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 59 + 2] = rewr_functions::rewr_59_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 59 + 2] = rewr_functions::rewr_59_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 60 + 2] = rewr_functions::rewr_60_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 60 + 2] = rewr_functions::rewr_60_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 61 + 2] = rewr_functions::rewr_61_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 61 + 2] = rewr_functions::rewr_61_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 75 + 1] = rewr_functions::rewr_75_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 75 + 1] = rewr_functions::rewr_75_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 78 + 2] = rewr_functions::rewr_78_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 78 + 2] = rewr_functions::rewr_78_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 80 + 2] = rewr_functions::rewr_80_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 80 + 2] = rewr_functions::rewr_80_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 81 + 2] = rewr_functions::rewr_81_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 81 + 2] = rewr_functions::rewr_81_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 82 + 1] = rewr_functions::rewr_82_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 82 + 1] = rewr_functions::rewr_82_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 83 + 2] = rewr_functions::rewr_83_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 83 + 2] = rewr_functions::rewr_83_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 84 + 2] = rewr_functions::rewr_84_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 84 + 2] = rewr_functions::rewr_84_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 85 + 3] = rewr_functions::rewr_85_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 85 + 3] = rewr_functions::rewr_85_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 85 + 4] = rewr_functions::rewr_85_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 85 + 4] = rewr_functions::rewr_85_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 97 + 3] = rewr_functions::rewr_97_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 97 + 3] = rewr_functions::rewr_97_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 98 + 1] = rewr_functions::rewr_98_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 98 + 1] = rewr_functions::rewr_98_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 100 + 1] = rewr_functions::rewr_100_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 100 + 1] = rewr_functions::rewr_100_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 101 + 2] = rewr_functions::rewr_101_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 101 + 2] = rewr_functions::rewr_101_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 102 + 2] = rewr_functions::rewr_102_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 102 + 2] = rewr_functions::rewr_102_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 112 + 1] = rewr_functions::rewr_112_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 112 + 1] = rewr_functions::rewr_112_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 117 + 2] = rewr_functions::rewr_117_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 117 + 2] = rewr_functions::rewr_117_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 263 + 2] = rewr_functions::rewr_263_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 263 + 2] = rewr_functions::rewr_263_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 264 + 2] = rewr_functions::rewr_264_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 264 + 2] = rewr_functions::rewr_264_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 268 + 2] = rewr_functions::rewr_268_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 268 + 2] = rewr_functions::rewr_268_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 269 + 3] = rewr_functions::rewr_269_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 269 + 3] = rewr_functions::rewr_269_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 273 + 2] = rewr_functions::rewr_273_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 273 + 2] = rewr_functions::rewr_273_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 282 + 2] = rewr_functions::rewr_282_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 282 + 2] = rewr_functions::rewr_282_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 286 + 2] = rewr_functions::rewr_286_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 286 + 2] = rewr_functions::rewr_286_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 287 + 3] = rewr_functions::rewr_287_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 287 + 3] = rewr_functions::rewr_287_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 297 + 2] = rewr_functions::rewr_297_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 297 + 2] = rewr_functions::rewr_297_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 299 + 2] = rewr_functions::rewr_299_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 299 + 2] = rewr_functions::rewr_299_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 300 + 3] = rewr_functions::rewr_300_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 300 + 3] = rewr_functions::rewr_300_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 303 + 2] = rewr_functions::rewr_303_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 303 + 2] = rewr_functions::rewr_303_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 304 + 2] = rewr_functions::rewr_304_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 304 + 2] = rewr_functions::rewr_304_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 305 + 3] = rewr_functions::rewr_305_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 305 + 3] = rewr_functions::rewr_305_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 305 + 5] = rewr_functions::rewr_305_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 305 + 5] = rewr_functions::rewr_305_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 310 + 1] = rewr_functions::rewr_310_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 310 + 1] = rewr_functions::rewr_310_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 311 + 3] = rewr_functions::rewr_311_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 311 + 3] = rewr_functions::rewr_311_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 311 + 4] = rewr_functions::rewr_311_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 311 + 4] = rewr_functions::rewr_311_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 312 + 2] = rewr_functions::rewr_312_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 312 + 2] = rewr_functions::rewr_312_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 313 + 2] = rewr_functions::rewr_313_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 313 + 2] = rewr_functions::rewr_313_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 314 + 2] = rewr_functions::rewr_314_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 314 + 2] = rewr_functions::rewr_314_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 315 + 3] = rewr_functions::rewr_315_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 315 + 3] = rewr_functions::rewr_315_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 315 + 4] = rewr_functions::rewr_315_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 315 + 4] = rewr_functions::rewr_315_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 320 + 2] = rewr_functions::rewr_320_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 320 + 2] = rewr_functions::rewr_320_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 321 + 2] = rewr_functions::rewr_321_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 321 + 2] = rewr_functions::rewr_321_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 322 + 3] = rewr_functions::rewr_322_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 322 + 3] = rewr_functions::rewr_322_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 322 + 6] = rewr_functions::rewr_322_6_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 322 + 6] = rewr_functions::rewr_322_6_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 322 + 7] = rewr_functions::rewr_322_7_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 322 + 7] = rewr_functions::rewr_322_7_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 331 + 2] = rewr_functions::rewr_331_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 331 + 2] = rewr_functions::rewr_331_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 332 + 2] = rewr_functions::rewr_332_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 332 + 2] = rewr_functions::rewr_332_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 333 + 2] = rewr_functions::rewr_333_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 333 + 2] = rewr_functions::rewr_333_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 334 + 3] = rewr_functions::rewr_334_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 334 + 3] = rewr_functions::rewr_334_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 334 + 4] = rewr_functions::rewr_334_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 334 + 4] = rewr_functions::rewr_334_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 343 + 2] = rewr_functions::rewr_343_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 343 + 2] = rewr_functions::rewr_343_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 344 + 2] = rewr_functions::rewr_344_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 344 + 2] = rewr_functions::rewr_344_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 345 + 3] = rewr_functions::rewr_345_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 345 + 3] = rewr_functions::rewr_345_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 345 + 4] = rewr_functions::rewr_345_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 345 + 4] = rewr_functions::rewr_345_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 350 + 2] = rewr_functions::rewr_350_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 350 + 2] = rewr_functions::rewr_350_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 351 + 2] = rewr_functions::rewr_351_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 351 + 2] = rewr_functions::rewr_351_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 352 + 3] = rewr_functions::rewr_352_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 352 + 3] = rewr_functions::rewr_352_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 352 + 5] = rewr_functions::rewr_352_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 352 + 5] = rewr_functions::rewr_352_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 361 + 2] = rewr_functions::rewr_361_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 361 + 2] = rewr_functions::rewr_361_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 362 + 2] = rewr_functions::rewr_362_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 362 + 2] = rewr_functions::rewr_362_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 363 + 2] = rewr_functions::rewr_363_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 363 + 2] = rewr_functions::rewr_363_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 364 + 3] = rewr_functions::rewr_364_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 364 + 3] = rewr_functions::rewr_364_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 364 + 4] = rewr_functions::rewr_364_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 364 + 4] = rewr_functions::rewr_364_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 369 + 2] = rewr_functions::rewr_369_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 369 + 2] = rewr_functions::rewr_369_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 370 + 2] = rewr_functions::rewr_370_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 370 + 2] = rewr_functions::rewr_370_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 371 + 3] = rewr_functions::rewr_371_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 371 + 3] = rewr_functions::rewr_371_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 371 + 5] = rewr_functions::rewr_371_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 371 + 5] = rewr_functions::rewr_371_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 376 + 2] = rewr_functions::rewr_376_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 376 + 2] = rewr_functions::rewr_376_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 377 + 2] = rewr_functions::rewr_377_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 377 + 2] = rewr_functions::rewr_377_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 378 + 3] = rewr_functions::rewr_378_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 378 + 3] = rewr_functions::rewr_378_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 378 + 8] = rewr_functions::rewr_378_8_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 378 + 8] = rewr_functions::rewr_378_8_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 387 + 2] = rewr_functions::rewr_387_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 387 + 2] = rewr_functions::rewr_387_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 388 + 2] = rewr_functions::rewr_388_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 388 + 2] = rewr_functions::rewr_388_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 389 + 3] = rewr_functions::rewr_389_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 389 + 3] = rewr_functions::rewr_389_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 389 + 4] = rewr_functions::rewr_389_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 389 + 4] = rewr_functions::rewr_389_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 394 + 2] = rewr_functions::rewr_394_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 394 + 2] = rewr_functions::rewr_394_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 395 + 2] = rewr_functions::rewr_395_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 395 + 2] = rewr_functions::rewr_395_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 396 + 3] = rewr_functions::rewr_396_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 396 + 3] = rewr_functions::rewr_396_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 396 + 5] = rewr_functions::rewr_396_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 396 + 5] = rewr_functions::rewr_396_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 401 + 2] = rewr_functions::rewr_401_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 401 + 2] = rewr_functions::rewr_401_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 402 + 2] = rewr_functions::rewr_402_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 402 + 2] = rewr_functions::rewr_402_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 403 + 2] = rewr_functions::rewr_403_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 403 + 2] = rewr_functions::rewr_403_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 404 + 3] = rewr_functions::rewr_404_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 404 + 3] = rewr_functions::rewr_404_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 404 + 7] = rewr_functions::rewr_404_7_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 404 + 7] = rewr_functions::rewr_404_7_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 413 + 2] = rewr_functions::rewr_413_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 413 + 2] = rewr_functions::rewr_413_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 414 + 2] = rewr_functions::rewr_414_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 414 + 2] = rewr_functions::rewr_414_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 415 + 3] = rewr_functions::rewr_415_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 415 + 3] = rewr_functions::rewr_415_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 415 + 4] = rewr_functions::rewr_415_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 415 + 4] = rewr_functions::rewr_415_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 424 + 2] = rewr_functions::rewr_424_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 424 + 2] = rewr_functions::rewr_424_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 425 + 2] = rewr_functions::rewr_425_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 425 + 2] = rewr_functions::rewr_425_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 426 + 2] = rewr_functions::rewr_426_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 426 + 2] = rewr_functions::rewr_426_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 427 + 3] = rewr_functions::rewr_427_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 427 + 3] = rewr_functions::rewr_427_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 427 + 4] = rewr_functions::rewr_427_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 427 + 4] = rewr_functions::rewr_427_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 432 + 2] = rewr_functions::rewr_432_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 432 + 2] = rewr_functions::rewr_432_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 433 + 2] = rewr_functions::rewr_433_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 433 + 2] = rewr_functions::rewr_433_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 434 + 3] = rewr_functions::rewr_434_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 434 + 3] = rewr_functions::rewr_434_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 434 + 5] = rewr_functions::rewr_434_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 434 + 5] = rewr_functions::rewr_434_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 443 + 2] = rewr_functions::rewr_443_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 443 + 2] = rewr_functions::rewr_443_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 444 + 2] = rewr_functions::rewr_444_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 444 + 2] = rewr_functions::rewr_444_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 445 + 3] = rewr_functions::rewr_445_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 445 + 3] = rewr_functions::rewr_445_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 445 + 4] = rewr_functions::rewr_445_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 445 + 4] = rewr_functions::rewr_445_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 450 + 2] = rewr_functions::rewr_450_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 450 + 2] = rewr_functions::rewr_450_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 451 + 2] = rewr_functions::rewr_451_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 451 + 2] = rewr_functions::rewr_451_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 452 + 3] = rewr_functions::rewr_452_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 452 + 3] = rewr_functions::rewr_452_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 452 + 5] = rewr_functions::rewr_452_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 452 + 5] = rewr_functions::rewr_452_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 457 + 2] = rewr_functions::rewr_457_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 457 + 2] = rewr_functions::rewr_457_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 458 + 2] = rewr_functions::rewr_458_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 458 + 2] = rewr_functions::rewr_458_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 459 + 3] = rewr_functions::rewr_459_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 459 + 3] = rewr_functions::rewr_459_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 459 + 5] = rewr_functions::rewr_459_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 459 + 5] = rewr_functions::rewr_459_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 464 + 2] = rewr_functions::rewr_464_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 464 + 2] = rewr_functions::rewr_464_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 465 + 2] = rewr_functions::rewr_465_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 465 + 2] = rewr_functions::rewr_465_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 466 + 3] = rewr_functions::rewr_466_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 466 + 3] = rewr_functions::rewr_466_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 466 + 5] = rewr_functions::rewr_466_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 466 + 5] = rewr_functions::rewr_466_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 475 + 2] = rewr_functions::rewr_475_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 475 + 2] = rewr_functions::rewr_475_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 476 + 2] = rewr_functions::rewr_476_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 476 + 2] = rewr_functions::rewr_476_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 477 + 3] = rewr_functions::rewr_477_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 477 + 3] = rewr_functions::rewr_477_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 477 + 4] = rewr_functions::rewr_477_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 477 + 4] = rewr_functions::rewr_477_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 482 + 2] = rewr_functions::rewr_482_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 482 + 2] = rewr_functions::rewr_482_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 483 + 2] = rewr_functions::rewr_483_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 483 + 2] = rewr_functions::rewr_483_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 484 + 3] = rewr_functions::rewr_484_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 484 + 3] = rewr_functions::rewr_484_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 484 + 5] = rewr_functions::rewr_484_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 484 + 5] = rewr_functions::rewr_484_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 489 + 2] = rewr_functions::rewr_489_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 489 + 2] = rewr_functions::rewr_489_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 490 + 2] = rewr_functions::rewr_490_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 490 + 2] = rewr_functions::rewr_490_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 491 + 3] = rewr_functions::rewr_491_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 491 + 3] = rewr_functions::rewr_491_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 491 + 5] = rewr_functions::rewr_491_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 491 + 5] = rewr_functions::rewr_491_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 491 + 6] = rewr_functions::rewr_491_6_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 491 + 6] = rewr_functions::rewr_491_6_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 496 + 2] = rewr_functions::rewr_496_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 496 + 2] = rewr_functions::rewr_496_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 497 + 2] = rewr_functions::rewr_497_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 497 + 2] = rewr_functions::rewr_497_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 498 + 3] = rewr_functions::rewr_498_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 498 + 3] = rewr_functions::rewr_498_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 498 + 5] = rewr_functions::rewr_498_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 498 + 5] = rewr_functions::rewr_498_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 503 + 2] = rewr_functions::rewr_503_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 503 + 2] = rewr_functions::rewr_503_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 504 + 2] = rewr_functions::rewr_504_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 504 + 2] = rewr_functions::rewr_504_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 505 + 3] = rewr_functions::rewr_505_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 505 + 3] = rewr_functions::rewr_505_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 505 + 5] = rewr_functions::rewr_505_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 505 + 5] = rewr_functions::rewr_505_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 510 + 2] = rewr_functions::rewr_510_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 510 + 2] = rewr_functions::rewr_510_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 511 + 2] = rewr_functions::rewr_511_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 511 + 2] = rewr_functions::rewr_511_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 512 + 3] = rewr_functions::rewr_512_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 512 + 3] = rewr_functions::rewr_512_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 512 + 5] = rewr_functions::rewr_512_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 512 + 5] = rewr_functions::rewr_512_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 512 + 6] = rewr_functions::rewr_512_6_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 512 + 6] = rewr_functions::rewr_512_6_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 517 + 2] = rewr_functions::rewr_517_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 517 + 2] = rewr_functions::rewr_517_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 518 + 2] = rewr_functions::rewr_518_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 518 + 2] = rewr_functions::rewr_518_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 519 + 3] = rewr_functions::rewr_519_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 519 + 3] = rewr_functions::rewr_519_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 519 + 5] = rewr_functions::rewr_519_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 519 + 5] = rewr_functions::rewr_519_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 528 + 2] = rewr_functions::rewr_528_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 528 + 2] = rewr_functions::rewr_528_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 529 + 2] = rewr_functions::rewr_529_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 529 + 2] = rewr_functions::rewr_529_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 530 + 3] = rewr_functions::rewr_530_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 530 + 3] = rewr_functions::rewr_530_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 530 + 4] = rewr_functions::rewr_530_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 530 + 4] = rewr_functions::rewr_530_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 535 + 2] = rewr_functions::rewr_535_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 535 + 2] = rewr_functions::rewr_535_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 536 + 2] = rewr_functions::rewr_536_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 536 + 2] = rewr_functions::rewr_536_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 537 + 3] = rewr_functions::rewr_537_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 537 + 3] = rewr_functions::rewr_537_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 537 + 5] = rewr_functions::rewr_537_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 537 + 5] = rewr_functions::rewr_537_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 542 + 2] = rewr_functions::rewr_542_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 542 + 2] = rewr_functions::rewr_542_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 543 + 2] = rewr_functions::rewr_543_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 543 + 2] = rewr_functions::rewr_543_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 544 + 2] = rewr_functions::rewr_544_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 544 + 2] = rewr_functions::rewr_544_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 545 + 3] = rewr_functions::rewr_545_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 545 + 3] = rewr_functions::rewr_545_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 545 + 5] = rewr_functions::rewr_545_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 545 + 5] = rewr_functions::rewr_545_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 555 + 2] = rewr_functions::rewr_555_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 555 + 2] = rewr_functions::rewr_555_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 556 + 2] = rewr_functions::rewr_556_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 556 + 2] = rewr_functions::rewr_556_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 557 + 2] = rewr_functions::rewr_557_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 557 + 2] = rewr_functions::rewr_557_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 558 + 3] = rewr_functions::rewr_558_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 558 + 3] = rewr_functions::rewr_558_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 558 + 4] = rewr_functions::rewr_558_4_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 558 + 4] = rewr_functions::rewr_558_4_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 563 + 2] = rewr_functions::rewr_563_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 563 + 2] = rewr_functions::rewr_563_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 564 + 2] = rewr_functions::rewr_564_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 564 + 2] = rewr_functions::rewr_564_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 565 + 3] = rewr_functions::rewr_565_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 565 + 3] = rewr_functions::rewr_565_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 565 + 5] = rewr_functions::rewr_565_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 565 + 5] = rewr_functions::rewr_565_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 570 + 2] = rewr_functions::rewr_570_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 570 + 2] = rewr_functions::rewr_570_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 571 + 2] = rewr_functions::rewr_571_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 571 + 2] = rewr_functions::rewr_571_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 572 + 3] = rewr_functions::rewr_572_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 572 + 3] = rewr_functions::rewr_572_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 572 + 5] = rewr_functions::rewr_572_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 572 + 5] = rewr_functions::rewr_572_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 669 + 2] = rewr_functions::rewr_669_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 669 + 2] = rewr_functions::rewr_669_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 670 + 2] = rewr_functions::rewr_670_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 670 + 2] = rewr_functions::rewr_670_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 671 + 3] = rewr_functions::rewr_671_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 671 + 3] = rewr_functions::rewr_671_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 671 + 5] = rewr_functions::rewr_671_5_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 671 + 5] = rewr_functions::rewr_671_5_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 676 + 2] = rewr_functions::rewr_676_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 676 + 2] = rewr_functions::rewr_676_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 685 + 2] = rewr_functions::rewr_685_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 685 + 2] = rewr_functions::rewr_685_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 686 + 3] = rewr_functions::rewr_686_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 686 + 3] = rewr_functions::rewr_686_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 690 + 3] = rewr_functions::rewr_690_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 690 + 3] = rewr_functions::rewr_690_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 692 + 2] = rewr_functions::rewr_692_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 692 + 2] = rewr_functions::rewr_692_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 697 + 2] = rewr_functions::rewr_697_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 697 + 2] = rewr_functions::rewr_697_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 698 + 2] = rewr_functions::rewr_698_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 698 + 2] = rewr_functions::rewr_698_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 699 + 3] = rewr_functions::rewr_699_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 699 + 3] = rewr_functions::rewr_699_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 703 + 2] = rewr_functions::rewr_703_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 703 + 2] = rewr_functions::rewr_703_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 704 + 3] = rewr_functions::rewr_704_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 704 + 3] = rewr_functions::rewr_704_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 709 + 3] = rewr_functions::rewr_709_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 709 + 3] = rewr_functions::rewr_709_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 713 + 3] = rewr_functions::rewr_713_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 713 + 3] = rewr_functions::rewr_713_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 717 + 2] = rewr_functions::rewr_717_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 717 + 2] = rewr_functions::rewr_717_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 718 + 3] = rewr_functions::rewr_718_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 718 + 3] = rewr_functions::rewr_718_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 723 + 2] = rewr_functions::rewr_723_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 723 + 2] = rewr_functions::rewr_723_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 724 + 3] = rewr_functions::rewr_724_3_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 724 + 3] = rewr_functions::rewr_724_3_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 738 + 1] = rewr_functions::rewr_738_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 738 + 1] = rewr_functions::rewr_738_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 739 + 2] = rewr_functions::rewr_739_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 739 + 2] = rewr_functions::rewr_739_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 740 + 2] = rewr_functions::rewr_740_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 740 + 2] = rewr_functions::rewr_740_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 753 + 1] = rewr_functions::rewr_753_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 753 + 1] = rewr_functions::rewr_753_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 754 + 2] = rewr_functions::rewr_754_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 754 + 2] = rewr_functions::rewr_754_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 768 + 1] = rewr_functions::rewr_768_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 768 + 1] = rewr_functions::rewr_768_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 769 + 2] = rewr_functions::rewr_769_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 769 + 2] = rewr_functions::rewr_769_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 788 + 1] = rewr_functions::rewr_788_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 788 + 1] = rewr_functions::rewr_788_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 789 + 2] = rewr_functions::rewr_789_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 789 + 2] = rewr_functions::rewr_789_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 805 + 2] = rewr_functions::rewr_805_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 805 + 2] = rewr_functions::rewr_805_2_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 808 + 1] = rewr_functions::rewr_808_1_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 808 + 1] = rewr_functions::rewr_808_1_term_arg_in_normal_form;
  this_rewriter->functions_when_arguments_are_not_in_normal_form[this_rewriter->arity_bound * 809 + 2] = rewr_functions::rewr_809_2_term;
  this_rewriter->functions_when_arguments_are_in_normal_form[this_rewriter->arity_bound * 809 + 2] = rewr_functions::rewr_809_2_term_arg_in_normal_form;
}

Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E360D2A6B92
	for <lists+samba-technical@lfdr.de>; Wed,  4 Nov 2020 18:23:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=otSphskaQI0sr+r7K94/XPyML/m5eCZikVb3YSuwcAs=; b=BGrttLP3p6U/TK/fculP7d7Csg
	ulK1a0dYL4rgvJEJz2/NSlZkMfS7GilAUknBuhJsOg0DYfsgEuz9BIE8/YlJgSDfH3XWZi21EcDGa
	PZxzxe+WieqSttRMK9WuspNCEuAqJGjueBOWXcLBdmO1Y8/1rJ0lAJAWuhYCb76vHVwwNhLk5E9AB
	UezBvOHBXkcvTJgBcQO7PodbYCt9OzR9eBT63guWAs6znImrpV/uo21rph5s1qdrgGBv3bZTaLdrT
	YK14MI8dmGk1DU1lB/EHLO8mKCgEzN+KipMTlbP3XcEWMWvlhkZHfBU7wk1mhWl7tKib4qjEbpOaw
	L/ShlMAQ==;
Received: from ip6-localhost ([::1]:52508 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kaMVP-00HTkm-Pf; Wed, 04 Nov 2020 17:23:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58970) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kaMVH-00HTkc-FF; Wed, 04 Nov 2020 17:23:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=otSphskaQI0sr+r7K94/XPyML/m5eCZikVb3YSuwcAs=; b=AuamVRxbE86e7IqC29ZaYzcg7J
 MC7hwOLNcIxsRwGIKxTfXc4N1uGJZncAErHG/W+j+mDH0tOMywvT2+pXWfq4dpJ49EYU6fEM1vrFK
 0Bi1HYYYV8Jumle0ORIgAM/JAYd9r4QV+4yW+bnbo840LQQNT1KzLdHoHiRciS8ImtlqBFL0vJcli
 00Rnk3rU8+/uRu1R9qyW6CYnnVyQ9nkabqXu+7TZdiKNcJpsQXNxDMj1GBuY4VwXHww8wIZjjv5Qe
 qfxR/19Vdl+xjCYhziB6fR5gKK1CWqkk8k5DEpfXszQs9l7GfYOejiE4/SDJrvmgvhaESNqVNH3OD
 Tx+KcVZoyW7kF4uiIDbScKH09s1xDGV+LpLDKust2ME+Ce5hAYHqxHbuLrJ8tAnMGge6tITnohGS4
 UwMmpnpEoZOXZDW3UXknGcfGCXqFl/uIw2oSUHfqy+nt5QIXlpTAQeuCdesDpC3GVpTl1C57q9TGn
 2VeaJaQ/9O+89nB3tvti2NeO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kaMVG-0000ek-85; Wed, 04 Nov 2020 17:23:22 +0000
Date: Wed, 4 Nov 2020 19:23:20 +0200
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: cli_credentials_parse_name... (Re: [SCM] Samba Shared Repository
 - branch master updated)
Message-ID: <20201104172320.GA571436@pinega.vda.li>
References: <20201104162403.E338C14012A@sn.samba.org>
 <4a335431-8128-36d8-5d6c-463cc7632c66@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a335431-8128-36d8-5d6c-463cc7632c66@samba.org>
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org,
 samba-cvs@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ke, 04 marras 2020, Stefan Metzmacher wrote:
> Am 04.11.20 um 17:24 schrieb Alexander Bokovoy:
> > The branch, master has been updated
> >        via  f9016912098 lookup_name: allow lookup for own realm
> >        via  00f4262ed0b cli_credentials: add a helper to parse user or group names
> >        via  eb0474d27ba cli_credentials_parse_string: fix parsing of principals
> >       from  a1b021200e3 selftest: add test for new "samba-tool user unlock" command
> > 
> > https://git.samba.org/?p=samba.git;a=shortlog;h=master
> > 
> > 
> > - Log -----------------------------------------------------------------
> > commit f901691209867b32c2d7c5c9274eee196f541654
> > Author: Alexander Bokovoy <ab@samba.org>
> > Date:   Wed Nov 4 14:21:33 2020 +0200
> > 
> >     lookup_name: allow lookup for own realm
> >     
> >     When using a security tab in Windows Explorer, a lookup over a trusted
> >     forest might come as realm\name instead of NetBIOS domain name:
> >     
> >     --------------------------------------------------------------------
> >     [2020/01/13 11:12:39.859134,  1, pid=33253, effective(1732401004, 1732401004), real(1732401004, 0), class=rpc_parse] ../../librpc/ndr/ndr.c:471(ndr_print_function_debug)
> >            lsa_LookupNames3: struct lsa_LookupNames3
> >               in: struct lsa_LookupNames3
> >                   handle                   : *
> >                       handle: struct policy_handle
> >                           handle_type              : 0x00000000 (0)
> >                           uuid                     : 0000000e-0000-0000-1c5e-a750e5810000
> >                   num_names                : 0x00000001 (1)
> >                   names: ARRAY(1)
> >                       names: struct lsa_String
> >                           length                   : 0x001e (30)
> >                           size                     : 0x0020 (32)
> >                           string                   : *
> >                               string                   : 'ipa.test\admins'
> >                   sids                     : *
> >                       sids: struct lsa_TransSidArray3
> >                           count                    : 0x00000000 (0)
> >                           sids                     : NULL
> >                   level                    : LSA_LOOKUP_NAMES_UPLEVEL_TRUSTS_ONLY2 (6)
> >                   count                    : *
> >                       count                    : 0x00000000 (0)
> >                   lookup_options           : LSA_LOOKUP_OPTION_SEARCH_ISOLATED_NAMES (0)
> >                   client_revision          : LSA_CLIENT_REVISION_2 (2)
> >
> > ...
> >
> > diff --git a/auth/credentials/tests/test_creds.c b/auth/credentials/tests/test_creds.c
> > index d2d3d30d73d..38550d6ecf9 100644
> > --- a/auth/credentials/tests/test_creds.c
> > +++ b/auth/credentials/tests/test_creds.c
> > @@ -187,7 +187,7 @@ static void torture_creds_parse_string(void **state)
> >  	assert_string_equal(creds->domain, "");
> >  	assert_int_equal(creds->domain_obtained, CRED_SPECIFIED);
> >  
> > -	assert_string_equal(creds->username, "wurst@brot.realm");
> > +	assert_string_equal(creds->username, "wurst");
> 
> I'm sorry but this is wrong!
> I'm wondering why this wasn't covered by any high level test.
> 
> This needs to result in domain="" and username="wurst@brot.realm"
> and that's exactly what we need to use for NTLMSSP.
> Also note that "brot.realm" may not be a realm and "wurst" may not
> be a sAMAccountName. A userPrincipalName can be anything@anydomain-of-msDS-SPNSuffixes.
> 
> I fear we need to revert these changes.
> From the merge request (https://gitlab.com/samba-team/samba/-/merge_requests/1658)
> I didn't really look at the whole patchset (with behavior change)
> I only focused on CRED_NO_PASSWORD.
> 
> I think we need to logic we have in wb_irpc_lsa_LookupNames4_call() and/or parse_domain_user() here.

I'm pushing a revert for now and will look at those.


-- 
/ Alexander Bokovoy


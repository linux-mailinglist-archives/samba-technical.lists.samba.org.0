Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 337062A6CBB
	for <lists+samba-technical@lfdr.de>; Wed,  4 Nov 2020 19:34:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Xwaul0mQc+YU6VQM+8THqS22mzlhT3CQeaWzvWXFxrk=; b=DLiV0KNCnHaXB7njzwIgWYM26I
	mArHH7wIj1YfSO4hDfzRgPNIRuYeKJMbgmTkXWmeyuGqEn5nEaSzckRnyVm8gE3kudw9tMP9V3rAm
	Kr4TeB8oTGa77GxsYUcbRGtN+3oMFuGLFN3JwRMQUrcXlwskdxdpruiDknFdIOPMEulTl6bqvfFXw
	6ccKUtrgdmyNzFsYxzlG+vp9/8KeEU9PPJNbSvzUwVW2wjKJQaw2z0QMC3FAeK1gwX9gaXerLcIlA
	o5BmEunPYBBTHGsqJydh9A3TtQ+Zwa/VL9n7U5FnShpEBx5T3qUH4Wj6MElpb0GSe4KoneHT/+f1m
	GwZa7hoQ==;
Received: from ip6-localhost ([::1]:58698 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kaNbp-00HUeZ-94; Wed, 04 Nov 2020 18:34:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30936) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kaNbj-00HUeP-Fc; Wed, 04 Nov 2020 18:34:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=Xwaul0mQc+YU6VQM+8THqS22mzlhT3CQeaWzvWXFxrk=; b=MHYgU80SO7g7RucrvgkrcIPg0c
 sVvHoFNTfqhHUc7rLXaGHzKUV9whR0Zz9OFw7SmJqKz20MEMOksN5NuNrK6Nj7vsAV2n+x5EP+5Bw
 4USlVaDcbBeTvcmCVeCKuL8nOcg+K+ybH6Bl/9o3l9qzjPt51/aM7GZsyEKt5fY3mF14WW33WWVsA
 jlEnML+ozlNyWFG9m7u5dIxoAHDsSGxH43iB2ut45YDlSHn+i0VzuCyfn+qkolEe9rBeBKuDBoQjC
 +eC53lFbnlzGNkkbP5rmtqLRL+m7zw2EetjCEc31hO6C7atI0eqBN9Bshdjp9GVLAX8AB9rvQri37
 0bMySU1L13e8tgsrELtybgLVopaLeMd3np5kuZZ3U2dASMc4F5aL2CDGpmofcEbegab9X3zv+sWEx
 5UCFj6vTIa7CA2MCL940IOoe4gj79K/yVExIz+Bvq0PclOGR6ag0QmmMzDvnHLMdnXa1VF8AOpw8i
 +OImI0Vl14PuA+ZNu3PAj5dO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kaNbi-0001P9-3P; Wed, 04 Nov 2020 18:34:06 +0000
Date: Wed, 4 Nov 2020 20:34:03 +0200
To: samba-technical@lists.samba.org
Subject: Re: cli_credentials_parse_name... (Re: [SCM] Samba Shared Repository
 - branch master updated)
Message-ID: <20201104183403.GA7355@pinega.vda.li>
References: <20201104162403.E338C14012A@sn.samba.org>
 <4a335431-8128-36d8-5d6c-463cc7632c66@samba.org>
 <20201104172320.GA571436@pinega.vda.li>
 <a0015fc8e58211b1885b2fd515f9321296d17d76.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0015fc8e58211b1885b2fd515f9321296d17d76.camel@samba.org>
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
Cc: Stefan Metzmacher <metze@samba.org>, Andreas Schneider <asn@samba.org>,
 samba-cvs@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On to, 05 marras 2020, Andrew Bartlett wrote:
> On Wed, 2020-11-04 at 19:23 +0200, Alexander Bokovoy wrote:
> > On ke, 04 marras 2020, Stefan Metzmacher wrote:
> > > Am 04.11.20 um 17:24 schrieb Alexander Bokovoy:
> > > > The branch, master has been updated
> > > >        via  f9016912098 lookup_name: allow lookup for own realm
> > > >        via  00f4262ed0b cli_credentials: add a helper to parse
> > > > user or group names
> > > >        via  eb0474d27ba cli_credentials_parse_string: fix parsing
> > > > of principals
> > > >       from  a1b021200e3 selftest: add test for new "samba-tool
> > > > user unlock" command
> > > > 
> > > > https://git.samba.org/?p=samba.git;a=shortlog;h=master
> > > > 
> > > > 
> > > > - Log ---------------------------------------------------------
> > > > --------
> > > > commit f901691209867b32c2d7c5c9274eee196f541654
> > > > Author: Alexander Bokovoy <ab@samba.org>
> > > > Date:   Wed Nov 4 14:21:33 2020 +0200
> > > > 
> > > >     lookup_name: allow lookup for own realm
> > > >     
> > > >     When using a security tab in Windows Explorer, a lookup over
> > > > a trusted
> > > >     forest might come as realm\name instead of NetBIOS domain
> > > > name:
> > > >     
> > > >     -------------------------------------------------------------
> > > > -------
> > > >     [2020/01/13 11:12:39.859134,  1, pid=33253,
> > > > effective(1732401004, 1732401004), real(1732401004, 0),
> > > > class=rpc_parse]
> > > > ../../librpc/ndr/ndr.c:471(ndr_print_function_debug)
> > > >            lsa_LookupNames3: struct lsa_LookupNames3
> > > >               in: struct lsa_LookupNames3
> > > >                   handle                   : *
> > > >                       handle: struct policy_handle
> > > >                           handle_type              : 0x00000000
> > > > (0)
> > > >                           uuid                     : 0000000e-
> > > > 0000-0000-1c5e-a750e5810000
> > > >                   num_names                : 0x00000001 (1)
> > > >                   names: ARRAY(1)
> > > >                       names: struct lsa_String
> > > >                           length                   : 0x001e (30)
> > > >                           size                     : 0x0020 (32)
> > > >                           string                   : *
> > > >                               string                   :
> > > > 'ipa.test\admins'
> > > >                   sids                     : *
> > > >                       sids: struct lsa_TransSidArray3
> > > >                           count                    : 0x00000000
> > > > (0)
> > > >                           sids                     : NULL
> > > >                   level                    :
> > > > LSA_LOOKUP_NAMES_UPLEVEL_TRUSTS_ONLY2 (6)
> > > >                   count                    : *
> > > >                       count                    : 0x00000000 (0)
> > > >                   lookup_options           :
> > > > LSA_LOOKUP_OPTION_SEARCH_ISOLATED_NAMES (0)
> > > >                   client_revision          :
> > > > LSA_CLIENT_REVISION_2 (2)
> > > > 
> > > > ...
> > > > 
> > > > diff --git a/auth/credentials/tests/test_creds.c
> > > > b/auth/credentials/tests/test_creds.c
> > > > index d2d3d30d73d..38550d6ecf9 100644
> > > > --- a/auth/credentials/tests/test_creds.c
> > > > +++ b/auth/credentials/tests/test_creds.c
> > > > @@ -187,7 +187,7 @@ static void torture_creds_parse_string(void
> > > > **state)
> > > >  	assert_string_equal(creds->domain, "");
> > > >  	assert_int_equal(creds->domain_obtained, CRED_SPECIFIED);
> > > >  
> > > > -	assert_string_equal(creds->username, "wurst@brot.realm");
> > > > +	assert_string_equal(creds->username, "wurst");
> > > 
> > > I'm sorry but this is wrong!
> > > I'm wondering why this wasn't covered by any high level test.
> > > 
> > > This needs to result in domain="" and username="wurst@brot.realm"
> > > and that's exactly what we need to use for NTLMSSP.
> > > Also note that "brot.realm" may not be a realm and "wurst" may not
> > > be a sAMAccountName. A userPrincipalName can be 
> > > anything@anydomain-of-msDS-SPNSuffixes.
> 
> cli_credentials_get_ntlm_username_domain() does this already.
> 
> > > I fear we need to revert these changes.
> > > From the merge request (
> > > https://gitlab.com/samba-team/samba/-/merge_requests/1658)
> > > I didn't really look at the whole patchset (with behavior change)
> > > I only focused on CRED_NO_PASSWORD.
> > > 
> > > I think we need to logic we have in wb_irpc_lsa_LookupNames4_call()
> > > and/or parse_domain_user() here.

One thing I need for lookup_name() is to be able to lookup those
realm/NetBIOS-qualified requests along with UPN-based queries through
passdb when they are done with LookupNames3 using
LSA_LOOKUP_NAMES_UPLEVEL_TRUSTS_ONLY2 level. We don't see the level
passed, as lookup_name() operates on own flags only.  Without
lookup_name() on DC (FreeIPA DC) being able to lookup UPNs against
passdb, we don't even get the request sent to ipasam. As a result,
Windows UI doesn't resolve IPA users and groups found in Global Catalog.

> > 
> > I'm pushing a revert for now and will look at those.
> 
> I'm not so sure this is totally wrong.  Can I have a look over these
> paths at the office?  I need any possible distraction from US election
> results anyway...

My autobuild failed in 
UNEXPECTED(failure): samba3.smbtorture_s3.plain.OPLOCK-CANCEL.smbtorture(nt4_dc)

Please share your findings on the list or on the MR. I'm going to pick
this up tomorrow and see what could be done. If we all decide it has to
completely reverted then, I'll resubmit the revert in the morning.

-- 
/ Alexander Bokovoy


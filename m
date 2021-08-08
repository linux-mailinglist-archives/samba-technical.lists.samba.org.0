Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 134243E3D24
	for <lists+samba-technical@lfdr.de>; Mon,  9 Aug 2021 01:13:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=okzZPS8sdks5cvVogbWsYBA8i8PiFXncgnMr+q98tyY=; b=MSiQ3xt1XftZpNMdLLlsPJGKz7
	MR5hlhguSuIZ3kYPYFMFWcsBw5LBKgUO3lN6WwJrp4KoE3ReLAKQGBcYhYCCH9vAbhU09PNsiiN3y
	f61gth7XLwE46Jq3nhtM8SsbopzaNh/TM2lYQ3jE76UgnaU+PozVkY8s2ksz3rf13KVSLvghEfYTl
	rVclgOeTH1sPysyXyO0f671nWJsyyWglJFqi6urykBOUDst1AN/oUdNChtgkYyBOS5H+NCHIBF4rL
	F2med58l+1pL0yUOPtVjv5cUaHTv2uq+SylpmfxUsABr6CuZCpwK5EImSYeQ9OscMhwXPbqnlxufm
	uorOxdTQ==;
Received: from ip6-localhost ([::1]:29514 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mCryj-005EU8-Dw; Sun, 08 Aug 2021 23:13:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10998) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mCryd-005ET9-Uj
 for samba-technical@lists.samba.org; Sun, 08 Aug 2021 23:13:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=okzZPS8sdks5cvVogbWsYBA8i8PiFXncgnMr+q98tyY=; b=xaowwyCJWpWEyxAeubnURle5wW
 sGWJQek6UwFdBpaHwlcREBL/QOTX23P7YSixBL4TfpmwccJNTYW1trVda6bcvepgAE+StrKvHQCZ9
 Nko4vLjWhbE5kyCjilRoeFW7Cx7aSrjvSGONZu/vjjkHaJcUcs9g5bFNmg4KNam0613KtPQQDh7j5
 3rLouOk+NlGUpDfm9N0JfnI/4cgmMEz8uF4ddDAAIfmZt+PIjkf2EN1vxMxcJQ0r3toE3DDCLsCBc
 MiQQg7I5lEtSXZA3Dzw2vz3lmGlyEPB/4V9UNy6KAFodi68Dtm64snNdPkHZQTCNLo86nz+PA+jZF
 HeYrokT0HXCzTFtd0OASQBl+/70YicCj479AYwdtq5A/3xAEWhKKt0kNzfJmMuGHyZokHvw2o6cKJ
 roJNSJMFk9qUNWejYOBCMyrP7T9aLBN9h384KFfYTqa9CXB4x9d1pmQ8+kVmIsj0mUt6+Ep33dmE7
 WE9pVAojospYay0J7/oV8oA4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mCryc-000GFQ-B4; Sun, 08 Aug 2021 23:13:07 +0000
Message-ID: <0a68b013c3d1d6988d54ef5473a47e50973d0892.camel@samba.org>
Subject: Re: Heimdal upgrade, really happening this time
To: Stefan Metzmacher <metze@samba.org>, Upstream Samba Technical Mailing
 list <samba-technical@lists.samba.org>, Isaac Boukris <iboukris@gmail.com>
Date: Mon, 09 Aug 2021 11:12:59 +1200
In-Reply-To: <a78f79643b03b31afbe505b932df2cc46fb0254d.camel@samba.org>
References: <b2cb195314281883e378c908784ac6f9f841584d.camel@samba.org>
 <26713d5cdcc47d0d9fb017b6a1e546d9501d8efe.camel@samba.org>
 <c328766b-d894-517f-966c-fa5305558633@samba.org>
 <a78f79643b03b31afbe505b932df2cc46fb0254d.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2021-07-09 at 22:29 +1200, Andrew Bartlett via samba-technical
wrote:
> 
> We now have a mostly-working branch of current Heimdal on current
> Samba, compiling on all our supported system, which is pretty
> impressive.

I just wanted to wrap back to the list with an update.  Thanks to some
great work with Luke Howard recently, host of our pull requests with
Heimdal have either been merged or will be shortly (as in, I made the
requested changes and expect them to be accepted).

This means that we are actually fairly close to upstream Heimdal,
closer than we ever have been I dare to suggest.

The remaining changes outstanding are:

(these will go in shortly)
405e9d62c4f1785b565477c14b234455e42f5a00 (lorikeet-heimdal-202108082250) Reintroduce krb5_addlog_func() as as supported API
758336ede39858c173818474ad5622fca74977ef Allow KDC to always return the salt in the PA-ETYPE-INFO[2]

(these need to be submitted, improved or removed, ideally)
ba8d4f87c1ac2ade8457c71ed7596c857ed327ee tgs-rep: always return canonical realm
dadc77a5aa8a5554c424bf564e7c43f561f90296 TODO: auth: For NTLM and KDC authentication, log the authentication duration
4745180e75403b02a6c76c72ef50827baf0bbc80 lib/krb5 correctly follow KRB5_KDC_ERR_WRONG_REALM client referrals
f64d59550727a1cdcd38faf71e608af2fc82575f TODO CHECK heimdal: Fix loss of information in _gsskrb5_canon_name() from call to krb5_sname_to_principal()
9343a315524bae25ae29307fbc27ae5ad24c1747 heimdal: Honour KRB5_CTX_F_DNS_CANONICALIZE_HOSTNAME in parse_name_canon_rules()
eec5822c9ac6d031e0ad62a55dc4e111355dd2bb TODO: heimdal: Pass extra information to hdb_auth_status() to log success and failures
ab6abb084231eda70f00eba5f8b869b71688ea7c Change KDC to respect HDB server name type if f.canonicalize is set
bb7c77747e6655aba98b365d8edfe5693c1d38a7 Export krb5_init_creds_* functions
ec3346d309ad4a12bd45216e3b778ac0db9fdb04 lib/krb5 correctly follow KRB5_KDC_ERR_WRONG_REALM client referrals
3d1e065561dc18bc30ce583ed2fc58b7aafcc51e HEIMDAL:kdc: make it possible to disable the principal based referral detection
a3cad540ecae6696b5ffcf5c5e90a665ca97a822 lib/krb5: windows KDCs always return the canoncalized server principal
0f1e376f8f93ba01aadf38be3561191f4322e7a0 HACK: Netbios Domain as Realm
7e3b4a0147dafe103cc2bfbbecf50141106fdd9a kdc: use the correct kvno number for PKINIT in the AS-REP
8f172e63a3fe34ac552965f13e2ffab31c63c5ac kdc: add krb5plugin_windc_pac_pk_generate() hook


Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions



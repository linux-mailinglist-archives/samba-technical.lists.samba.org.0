Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA523FCF1F
	for <lists+samba-technical@lfdr.de>; Tue, 31 Aug 2021 23:26:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=qpsUr3grmki3HTWKn+EPl7lHbfrNktGguPdVFlMxWes=; b=vzSvY3leXtts1Ix0cqc6mBglhR
	mujVLOn9OOhLBdly3sbNhdF1X62Oa7ensQysqsOwDKhx1HWYJNB93BgKBzdEZ02lwkLDtLoPW5X7E
	zu4AFmPewAW4DNQeZ/GcGrFsVfYKFI/Lv+hj+SdyxgUua26A24mjVShYU94OcX4sJ0eEbxuVoTdaZ
	cf7J2XYYK+w3cyfrSPJuMZhQgx1In88YA9V/8JaMXIRjDl5615GSZCb2s7Bzcn2XPYyreH+6jKmk/
	qHjTu51i2GAPaxzNV631qeK+VV+TnetBFVDuIWlYxNea7iNlJWN9VhdB0aa/xd97xA7kLVK7GvFbR
	X0dqblnw==;
Received: from ip6-localhost ([::1]:61000 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mLBG7-00ANaC-J2; Tue, 31 Aug 2021 21:25:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58592) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mLBFz-00ANa3-2r
 for samba-technical@lists.samba.org; Tue, 31 Aug 2021 21:25:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=qpsUr3grmki3HTWKn+EPl7lHbfrNktGguPdVFlMxWes=; b=Qbc1vUyHgqKuC/HJoi3HA3HOq2
 at9XYoOxok5iL5vpOluMfgdKtsFrtrhDimwmvYTEnvqErA1MTs+ZXoU/EWztZHuCXgFV3Jz1og5RV
 OnXyVuEOSS7Yyl3A35R6xfoqcsfOtZnqdZHng79FKtRWA6r2F18f875I535tX6tlrcnsfJwk+EJVC
 KfevdqUbwx7VlDd56ANhb0n3MjaRHAMHz9N//7SmAXVN6BYCNa3SMV1ZrY7LoklaY4o6UlxMrfH5j
 /jVzUpph97UFua499pt2oaBnGiA0jfIu36H9hrRSXUQj6dGCUG0MTjvQKOP8um23KkIpZGSD3v2hS
 vjjLKyEELBiQSW53serEYCS/tfCY9NWmQyPgiYwR0mZL2Ug0rI/kjqJ9BIxKiAI3eYtClhwsC9XYZ
 DZ8P8z2/r/E6BSvXWcx1sIkk1LseLGtFekNZcKERzNFxnMoDm6qUgRUfOD1cs8heLlInoP5kqu3WE
 xTo6PxAsX1YSE8eswb1znWjM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mLBFx-003vhn-6A; Tue, 31 Aug 2021 21:25:21 +0000
Message-ID: <9f99c5977e7743e615936f070ce8e085a73ed1fb.camel@samba.org>
Subject: Re: Help writing new SAMBA_INTERNAL DNS test code please.
To: Jeremy Allison <jra@samba.org>, Matt Grant <matt@mattgrant.net.nz>
Date: Wed, 01 Sep 2021 09:25:14 +1200
In-Reply-To: <YS6StQYsctrwXzvu@jeremy-acer>
References: <CAHA-KoObp6CvJg05wbSypST_4eAtGhuTg9eUkcBYw+PTV612og@mail.gmail.com>
 <YS6StQYsctrwXzvu@jeremy-acer>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2021-08-31 at 13:36 -0700, Jeremy Allison via samba-technical
wrote:
> On Tue, Aug 31, 2021 at 05:20:57PM +1200, Matt Grant via samba-
> technical wrote:
> > Hi Andrew!
> > 
> > Have not created Samba bugs for the following yet, as I am trying
> > to get
> > the hardest part doen, writing the test code.
> > 
> >   1. Dns server port number specification for smb.conf 'dns
> > forwarder'
> >   server list
> >   2. Restricting the dynamic DNS update ranges so that the
> > SAMBA_INTERNAL
> >   server is not spammed with IPv6 PD addresses from the ISP.
> > 
> > Main issue is being able to dynamically change the smb.conf setup
> > for the
> > Python self test hookup, for 1, specifically within
> > samba.tests.dns_forwarder.  Being able to do this will also make 2
> > far
> > easier.  After looking at the test code set up, I can't see how to
> > dynamically change the smb.conf file in st/samba/smb.conf while the
> > tests
> > are running to set up for testing the port numbers or not.
> 
> Look at tests like:
> 
> source3/script/tests/test_deadtime.sh
> 
> they use a feature:
> 
> global_inject_conf=$(dirname $SMB_CONF_PATH)/global_inject.conf
> 
> that allows a test to include dynamic smb.conf entries for Samba3
> tests via the line:
> 
>          include = $globalinjectconf
> 
> inside selftest/target/Samba3.pm.
> 
> I don't think the same feature is in selftest/target/Samba4.pm
> but I'd look into adding that. It might do what you need.

Sadly the AD DC (except the embedded smbd) still doesn't reload the
smb.conf (ever!), so that trick won't work.  

If custom smb.conf options can't be avoided, they need to be added to
an existing (if otherwise harmless) or new environment.  Sadly if a new
server instance (like ad_dc, fl2003dc etc) is needed in Samba4.pm that
is a fair chunk of work, so we try to fit it in with an existing one.

Sorry!

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions



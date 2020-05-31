Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBD21E968C
	for <lists+samba-technical@lfdr.de>; Sun, 31 May 2020 11:23:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=2T093uOvWpyWP4QA3ihuv9GG9RrLOlQKH2KiBilOi4Q=; b=MjirNLc2uWq7k0Hw2gKHewAWHD
	JFbzaQFIKmPzVl7Q7It3NaWWH3upMBXH/F4CDmXIFHKerezH3Sa26i7YA+cDffDk0GnsXDhHOHDiR
	AbHl7rtZYluZQRV5iEXZ4feP02MR0kV39hi2Nixdc1YLT6Km40ZgrDS9chk3k8nFlM6uHLdstUrQZ
	sfNCxj47uDqzI5oJVRPWI52ocUabGynxLgL63mNjoVWe6NWxbs5AbBaMmeKnU+p6CbFhDbu+oWBE7
	6MV8gOI2Menz+IN4ubLsqbFniLxmpWT1oP64ys0uROqJKtOLFgc1TUwpXkiaNGBFPRXPureD/NExt
	RssvSaVA==;
Received: from localhost ([::1]:52482 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jfKAM-006Sgo-Pc; Sun, 31 May 2020 09:22:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26126) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jfKAA-006Sgh-Cx
 for samba-technical@lists.samba.org; Sun, 31 May 2020 09:22:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=2T093uOvWpyWP4QA3ihuv9GG9RrLOlQKH2KiBilOi4Q=; b=wZSQ+pktn8Ku1z1n6+XlvpMJHi
 npR1snX2NqTeAeGqcODQoeUC+imgTKaRjeaMoTyMVq8vPV2gmMNIDZ5jOkysnKxouxm/kHYG5UyoY
 OkhnFSRIxuduMhj8irIOCcL/stifoKG7pS3hTNmgwxsZbCWzoJ8f5D/35eC2ZpR3r4LmbvMv4livw
 l5F7RlRB1MyD2y1JuWDU64M26GiT+zF6HRiMhy3C1iDQFCZPcP1FSWoNB0E+UjEBVsC4QPAaeUYzj
 edg8OV8bLO0oeF3z9AQthtBnWAz3mWA6I66eECdTQlT8ggXIh3ycQNgend+Nyo0A6pBPYO1ccJrDc
 e4s21wZgascxCMOocJ02xHwnYIrIalTxcowhzMuDrSQt+ciScr6+XyR13WcEjACwPE/xdFeNjCn7+
 9nt6Iuv6ECc1TwJusyhde3p/oi0Q7PfsewDuVqACjAZbuiO/Wup0QQFoYPdsgua+KDXAdsmMx24m4
 Hs0wJo2Tr1XnJK2SRwbktZOR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jfKA9-0002IV-Be; Sun, 31 May 2020 09:21:49 +0000
Date: Sun, 31 May 2020 12:21:47 +0300
To: William Brown <wbrown@suse.de>
Subject: Re: Following Steve's Question - Re Tokens in SPNEGO
Message-ID: <20200531092147.GT5779@onega.vda.li>
References: <04593936-C78E-43E9-81EE-0311A84D21EB@suse.de>
 <20200529104042.GQ5779@onega.vda.li>
 <CB9B11C8-E184-40F6-A035-1ED5B707E9B8@suse.de>
 <20200530121450.GR5779@onega.vda.li>
 <8795B020-51D1-40B4-98B0-A60A77B39808@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8795B020-51D1-40B4-98B0-A60A77B39808@suse.de>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On la, 30 touko 2020, William Brown wrote:
> > 
> > 
> >> IE think bearer tokens from oauth being passed in that can be
> >> validate, or a saml assertion where you can check as the passdb has a
> >> registered handler.
> > 
> > Right. You wouldn't push SAML assertion or bearer token to PASSDB.
> > Instead, in negoex plugin you would perform mechanism-specific lookup of
> > the details and associate that with the security context in a way
> > expected by higher level GENSEC code in Samba. This is similar to how
> > Kerberos part of GENSEC expects to pull PAC record and parse it further.
> > Or GENSEC's NTLM code extracts security token and parses it further.
> 
> <snip>
> 
> > 
> >> It would be interesting to know how a windows server + windows
> >> desktop, both joined to azure AD conduct their authentication in this
> >> case, since there should be no ntlm or krb involved ....  
> > 
> > They still involve Kerberos, with PKINIT-based authentication using
> > certificates bound to machine TPMs. These certificates are issued and
> > tied into information about those machines in Azure AD. There is a
> > reason why Microsoft Windows logo certification requires TPM from a
> > hardware platform.
> > 
> > See details here for machine enrollment:
> > https://docs.microsoft.com/en-us/windows/security/identity-protection/hello-for-business/hello-how-it-works-device-registration
> > 
> > and for user provisioning of a two-factor credential:
> > https://docs.microsoft.com/en-us/windows/security/identity-protection/hello-for-business/hello-how-it-works-provisioning
> > 
> > and for user authentication:
> > https://docs.microsoft.com/en-us/windows/security/identity-protection/hello-for-business/hello-how-it-works-authentication
> 
> That's only the hybrid AD + Azure AD case isn't it?

My understanding it is not only for that but this is the only place I
found it described in detail for all types of scenarios.

For non-enrolled clients two use cases of binding external identity to a
local one: authenticating with a cloud auth provider and trusting a user
from a different host are covered with PKU2U which uses NEGOEX:
https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd560634(v=ws.10)

> > Windows does everything in terms of NT security token that needs to
> > be created for the session setup on Windows side. For Kerberos and NTLM
> > the token's content is based on the content of PAC in Kerberos
> > ticket and security token from NTLM exchange correspondingly. It is
> > then amended with whatever local details are needed in the local security
> > authority (add local groups, for example).
> > 
> > In the user authentication link above you might think there is no
> > Kerberos involved in the first case (Azure AD join authentication to
> > Azure AD) but there an encrypted session key is returned by Azure AD
> > through the cloud AP provider which is then decoded by the cloud
> > authentication security support provider (SSPI module) using the
> > device's transport key.
> 
> <snip>
> 
> > Essentially that online identity is bound to a local account you have
> > and then reuses details from LSA after successful authentication has
> > been done via interactive logon with the help of SSPI extension. In
> > practice then means triggering use of that extension via SPNEGO NEGOEX
> > offer.
> 
> Do you have any documents on the cloud SSP functionality? What details does it reuse?
> 
> It seems like being able to support this extension would be the answer to Steve's question ...

This is just standard Windows SSPI stuff. It is built around using
NEGOEX internally to call out to other providers but in general there is
nothing different to standard SSPI API.

https://docs.microsoft.com/en-us/windows/win32/secauthn/custom-security-packages
https://docs.microsoft.com/en-us/windows/win32/secauthn/creating-custom-security-packages
https://docs.microsoft.com/en-us/windows-server/security/windows-authentication/security-support-provider-interface-architecture#BKMK_NegoExtsSSP


-- 
/ Alexander Bokovoy


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECA61E911C
	for <lists+samba-technical@lfdr.de>; Sat, 30 May 2020 14:15:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=lATKlRy9gW+dqUltSqZ7qZVemKoUqCJ7c/queW5zEfw=; b=E8Sis2n8mEttlhLFcphlj9an91
	AFL6KGbxgdZETgO9WzJ9OZXcdEjyzhVs26vCCTa27wkoBbp/dsmloBXA2FNgbGHD6nbQyZRxmnLEB
	sqdUgdc2Z3IHsyZ1lAt3Zfqy/Oj7wMklSn1HH1osSDVObCg/rdvZy+SH5eqoAuVNkQOuSnHge8RKp
	VCNMibup2ehWWGLH37NtYA1inf1hNPdlqmNcoVHp4bNo9GqrBe/mtVoQDS/ck6JWTgB1Y9LJme6pB
	3c8yGC8o7NY1uw9q5ExXAm7qgQ8KMGRrG/fxHUUyUCDdhRFifpn2xWNdrPTmmNTy4i97gERC9Nir3
	FfzIAq+w==;
Received: from localhost ([::1]:45258 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jf0OA-006QMm-38; Sat, 30 May 2020 12:14:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63602) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jf0O5-006QMf-3r
 for samba-technical@lists.samba.org; Sat, 30 May 2020 12:14:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=lATKlRy9gW+dqUltSqZ7qZVemKoUqCJ7c/queW5zEfw=; b=Qd6JzEUG1h3edcAW9xc/qcuZdd
 L8fIXD4ifD+iPYQ8VciunQGQNx36Tiq2sIjKVGWEIJtkXEm/ggx7k5UpEzdKEmgv8Kre+Czr4d/az
 aFyPS/tzRM+j38kK9HM5Sk/Zq3y6caWW0r+3WZ7SFUtl9z2HLS5nEeRXA4aQAv5eRKMHN3AdH29X8
 E5CfCD2W7I8ITyfjA8nn1JnHq2dDsnqgnloBPZEgCHBNrHO+XDBVj8nltUmytrQc+S3J1WaKmPR9X
 reejhM+3GIEjXLfuwtMJyge9QhiWbgjawcWN1RwYpZRc8zwSHnbiLBa5jjVzWK0T0sK00GjTy4mQn
 CRdz5TFpICWRYPXX6CTDTWkvB567hDjKFfX+OuQ5c3TXr3F4D2RQV+InzX7bzZpFJe2+9RjblEQsn
 IVuPMH30bWkrM6DAJlx9GF/wlBI4kTHmz7lVwFMW8E8ZraVpIUr+gNv3a4v6xyEGh3Iy9vF841FNO
 oLqR3dZUK6q1ygeljcagA+1h;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jf0O4-0003zH-9g; Sat, 30 May 2020 12:14:52 +0000
Date: Sat, 30 May 2020 15:14:50 +0300
To: William Brown <wbrown@suse.de>
Subject: Re: Following Steve's Question - Re Tokens in SPNEGO
Message-ID: <20200530121450.GR5779@onega.vda.li>
References: <04593936-C78E-43E9-81EE-0311A84D21EB@suse.de>
 <20200529104042.GQ5779@onega.vda.li>
 <CB9B11C8-E184-40F6-A035-1ED5B707E9B8@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CB9B11C8-E184-40F6-A035-1ED5B707E9B8@suse.de>
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

On la, 30 touko 2020, William Brown via samba-technical wrote:
> 
> 
> > On 29 May 2020, at 20:40, Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org> wrote:
> > 
> > Hi William,
> > 
> > On pe, 29 touko 2020, William Brown via samba-technical wrote:
> >> Hi there,
> >> 
> >> Thinking to Steve's question yesterday, it would be interesting to
> >> know from the experts on this mailing list an answer. How what would
> >> opaque token authentication look like in Samba? How would a passdb
> >> support this style of authentication? How would a client get the token
> >> to pass through?
> >> 
> >> It would be great to know more about this and explore some of these thoughts. 
> > 
> > My current thinking is around reusing existing infrastructure in the
> > protocol. SMB3 authenticates with SPNEGO[1]. SPNEGO allows to have multiple
> > authentication mechanisms advertised, with most common ones being krb5
> > and NTLM. These are not the only ones, a common extension mechanism
> > called NEGOEX can be used as well[2].
> > 
> > NEGOEX is basically a way to tunnel some method of authentication known
> > to both client and server through SPNEGO. It doesn't need need to
> > require a third party (like KDC) to broker an authenticity of the
> > parties. MIT Kerberos supports NEGOEX since version 1.18, there are also
> > patches for Heimdal.
> 
> How would the currest tdb passdb or ldapsam work with this? A hook
> where the content of the negoex is sent to that module?

This is independent of PASSDB API. This is authentication step, not
identity part. I would expect a negoex plugin generate a context handle
that would be possible to inquire about details and some of those
details then feeded into PASSDB API to lookup whatever is needed to
lookup.

Sure, some changes would be needed to allow associating a token with a
particular identity object and that might require changing whatever API
is used for that purpose but it is not exactly PASSDB alone to be
changed.

PASSDB API operates on samu records and some of the callers expect
following fields to exist and be non-empty:

        DATA_BLOB lm_pw; /* .data is Null if no password */
        DATA_BLOB nt_pw; /* .data is Null if no password */
        DATA_BLOB nt_pw_his; /* nt hashed password history .data is Null if not available */
        char* plaintext_pw; /* is Null if not available */

These assumptions would need to be fixed where possible. We would need
to turn anything around NTLM and passwords into optional and fail
operations that demand those. In FreeIPA's ipasam we don't provide any
of those fields and most operations are just fine already.


> IE think bearer tokens from oauth being passed in that can be
> validate, or a saml assertion where you can check as the passdb has a
> registered handler.

Right. You wouldn't push SAML assertion or bearer token to PASSDB.
Instead, in negoex plugin you would perform mechanism-specific lookup of
the details and associate that with the security context in a way
expected by higher level GENSEC code in Samba. This is similar to how
Kerberos part of GENSEC expects to pull PAC record and parse it further.
Or GENSEC's NTLM code extracts security token and parses it further.

> It would be interesting to know how a windows server + windows
> desktop, both joined to azure AD conduct their authentication in this
> case, since there should be no ntlm or krb involved ....  

They still involve Kerberos, with PKINIT-based authentication using
certificates bound to machine TPMs. These certificates are issued and
tied into information about those machines in Azure AD. There is a
reason why Microsoft Windows logo certification requires TPM from a
hardware platform.

See details here for machine enrollment:
https://docs.microsoft.com/en-us/windows/security/identity-protection/hello-for-business/hello-how-it-works-device-registration

and for user provisioning of a two-factor credential:
https://docs.microsoft.com/en-us/windows/security/identity-protection/hello-for-business/hello-how-it-works-provisioning

and for user authentication:
https://docs.microsoft.com/en-us/windows/security/identity-protection/hello-for-business/hello-how-it-works-authentication

Windows does everything in terms of NT security token that needs to
be created for the session setup on Windows side. For Kerberos and NTLM
the token's content is based on the content of PAC in Kerberos
ticket and security token from NTLM exchange correspondingly. It is
then amended with whatever local details are needed in the local security
authority (add local groups, for example).

In the user authentication link above you might think there is no
Kerberos involved in the first case (Azure AD join authentication to
Azure AD) but there an encrypted session key is returned by Azure AD
through the cloud AP provider which is then decoded by the cloud
authentication security support provider (SSPI module) using the
device's transport key.

I would rather point you to interactive logon and network logon
authentication protocol interactions in [MS-AUTHSOD] for non-cloud case
for comparison:

Interactive: https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-authsod/2e9de599-e791-4b3d-bb0c-2ffbef5ee665
Network: https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-authsod/4b72092d-8fed-402d-b7af-d2678817af59

Essentially that online identity is bound to a local account you have
and then reuses details from LSA after successful authentication has
been done via interactive logon with the help of SSPI extension. In
practice then means triggering use of that extension via SPNEGO NEGOEX
offer.


-- 
/ Alexander Bokovoy


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FDE3EC8A5
	for <lists+samba-technical@lfdr.de>; Sun, 15 Aug 2021 12:40:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=VG0Lf7HiDnwITqIBooUW4XNKiqT3FwlwpEH/ZdKxOzg=; b=nkryHYZSgZW45BZtaj/LK0myfW
	ES68yc7Tvh21NBHFPIHNFct+raIlvgDkYIOb/TSVhNzepy8VQXzEVetaxtIuVNLRMi5RconSIyE9c
	DeFG6vlV9d7XyYirsl1YYO+M3DIdVHulxE+ZA5wBwZNXo4k8SJBecMWmDMkpH29mAGlChuVLsLoch
	1gSKAqn8KI1oUgwkB8sGF6J9QfX70HF7UhzHylrbtxiJHHyFzC0KsvTufuxNGn4VjmVuwJeuoeL72
	kgHtXdwG7liAeDCKO380VEvF/iUEgANISV1ZysCv65R8IFoAIfA9rxOGFRTTIWVduFmJoLyxh9hQR
	NQBuVeFw==;
Received: from ip6-localhost ([::1]:42880 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mFDXW-006EBr-UN; Sun, 15 Aug 2021 10:38:51 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:37402) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mFDXQ-006EBi-LI
 for samba-technical@lists.samba.org; Sun, 15 Aug 2021 10:38:47 +0000
Received: by mail-ej1-x62c.google.com with SMTP id h9so26530983ejs.4
 for <samba-technical@lists.samba.org>; Sun, 15 Aug 2021 03:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VG0Lf7HiDnwITqIBooUW4XNKiqT3FwlwpEH/ZdKxOzg=;
 b=jTa1wrW4u/TtPrmR2JT9Wr9z8T2QJ/apXvOvmowce3Qwnn+DkgPbyr4aK3dFYGaUZr
 tWgwjiQGIJ5FdJMWDLoo5//aL89kyhKMNCZJO9OtRE7QIzDLMxg1uKNhdO7BaygTh0fO
 3RxCQOB/oZ75OOGfBbvi3vHeSpOcXylbM8i9C85BY0kK6s0q9wJJ1ofWw2EdPZytbsdc
 GPgdl10EhkNdI3qIWmYnaQnZQcY9ErIQ6hoQPJ98xCGLrGjtJGRrW14yqy5Z1wVc20t4
 EXgVEN8neGfw2T7F7ggsAJYc+bD9h2dk499XIxjbti2x8YcvumucccLyw6bQEySeYXIQ
 76QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VG0Lf7HiDnwITqIBooUW4XNKiqT3FwlwpEH/ZdKxOzg=;
 b=B3kButF6mfzAU24FHsO/1JNQfjhwMd3zr7EqjSlaIqrvsNsm7oA8r59yNom96QoMNw
 RTBLAC9mPp0+AO/CZfiQd3AV28ADkb+Cr7yErh89+4qc0JDZyxU9gR6oBVtctRGrl7n9
 aRNMaVkIf3CFoHFfIpUXJPfwTi07FRLvUfJUIOwAQTPr3pfPFzE3CsEIzBo1ZmzPS2zY
 eTwxjGAciwlPU21viulgFqtmBVej+ihnZmJ5/3so195t1P0XPJI5hkNWxnARfCBC42r1
 t0siYVKlw+pFTB2IsZCyocK4kRlazn19+uJfUvWjXbQNMgGGaJBBhx/XpaDDZ8LZzNka
 7Pow==
X-Gm-Message-State: AOAM5324nNoTp4MYDs7Ck+q0+MVRYM1J6N24Ub4ie2wII9o8KngnPJbJ
 /XiUnKuH8RaIBpS2AsMhhEc7YnbjRnyjoxOd3FQ=
X-Google-Smtp-Source: ABdhPJyY0Qdp1sYGjEF45HzWNzqWI2ke2B6iaq08amYPqNgEOVcifajsJbPsHqC2IwYpCLvxB0hD0qQhjvexR6Aj7Jk=
X-Received: by 2002:a17:906:22da:: with SMTP id
 q26mr11050185eja.473.1629023915558; 
 Sun, 15 Aug 2021 03:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <YRXlwDBfQql36wJx@sol.localdomain>
 <CAN05THSm5fEcnLKxcsidKPRUC6PVLCkWMBZUW05KNm4uMJNHWw@mail.gmail.com>
 <YRbT7IbSCXo4Dl0u@sol.localdomain>
In-Reply-To: <YRbT7IbSCXo4Dl0u@sol.localdomain>
Date: Sun, 15 Aug 2021 20:38:23 +1000
Message-ID: <CAN05THScNOVh5biQnqM8YDOvNid4Dh=wZS=ObczzmSEpv1LpRw@mail.gmail.com>
Subject: Re: Building cifs.ko without any support for insecure crypto?
To: Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 linux-crypto@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Aug 14, 2021 at 6:19 AM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Fri, Aug 13, 2021 at 02:46:21PM +1000, ronnie sahlberg wrote:
> > On Fri, Aug 13, 2021 at 1:34 PM Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > Hi!
> > >
> > > We should be working to eliminate any uses of insecure crypto algorithms (e.g.
> > > DES, ARC4, MD4, MD5) from the kernel.  In particular, it should be possible to
> > > build a kernel for a modern system without including any such algorithms.
> > >
> > > Currently, CONFIG_CIFS is problematic because it selects all these algorithms
> > > (kconfig options: CONFIG_CRYPTO_LIB_DES, CONFIG_CRYPTO_LIB_ARC4,
> > > CONFIG_CRYPTO_MD4, CONFIG_CRYPTO_MD5).
> > >
> > > It looks like these algorithms might only be used by SMB2.0 and earlier, and the
> > > more modern SMB versions don't use them.  Is that the case?  It mostly looks
> > > like that, but there's one case I'm not sure about -- there's a call chain which
> > > appears to use ARC4 and HMAC-MD5 even with the most recent SMB version:
> > >
> > >     smb311_operations.sess_setup()
> > >       SMB2_sess_setup()
> > >         SMB2_sess_auth_rawntlmssp_authenticate()
> > >           build_ntlmssp_auth_blob()
> > >             setup_ntlmv2_rsp()
> >
> > md4 and md5 are used with the NTLMSSP authentication for all dialects,
> > including the latest 3.1.1.
>
> That's unfortunate.  Surely Microsoft knows that md4 has been severely
> compromised for over 25 years?  And md5 for 15 years.

Absolutely, but it is the reality we have to live in.
It is actually an md4 hash wrapper inside a md5 hash so "better" but still...

>
> > The only other authentication mechanism for SMB is krb5.
>
> Is the long-term plan to have everyone migrate to kerberos?  Currently kerberos
> doesn't appear to be the default, so not many people actually use it -- right?
>

I have no idea on the plans here.

Kerberos do require a bit of infrastructure to set up and manage, so a
keb5 only solution
would be a no-go for most/all home-nas environments and also all small
business "that is not
big enough to justify running a full ActiveDirectory environment."

For use, I would say that most larger domains and enterprises do use
AcriveDirectory and thus also Krb5 because of single signon and a
single account database.
But ActiveDirectory does require a fair amount of setup and management
so I think most smaller businesses and all home-NAS
users just use user/password NTLMSSP authentication.

What are the plans here? To just offer the possibility to disable all
these old crypto and hashes on a local kernel compile?
Or is the plan to just outright remove it from the kernel sources?

If the first, I think that could possible be done for cifs. I think a
lot of the security minded larger enterprises already may be disabling
both SMB1 and also NTLM on serverside, so they would be fine.

For the latter, I think it would be a no-go since aside from krb5
there are just no other viable authentication mechs for smb.



> > This means that if we build a kernel without md4/md5 then we can no
> > longer use NTLMSSP user/password
> > style authentication, only kerberos.
> >
> > I guess that the use cases where a kernel without these algorithms are
> > present are ok with kerberos as the
> > only authentication mech.
>
> Well, maybe.  Even without kerberos, would it still be possible to use SMB with
> a "guest" user only?

Yes and no.
In smb we actually have two different concepts of guest.
We have GUEST, where the SERVER decides you are a guest user, based on
some who-knows-what configuration
but you still authenticate properly (and have a session key).
and we have ANONYMOUS/NULL, where the client does not even have any
credentials at all (and you have no session key).

For the latest and most secure dialect of SMB 3.1.1 the command to
even map a share : SMB2 TREE_CONNECT
MUST be signed, and thus you have to have a session key, to sign it.
So, anonymous/null users can not even map a share without credentials.
Because they do not have a session key and thus can not
sign these command.

So in the case of no NTLMSSP, a user would technically be an ANONYMOUS
user, not a GUEST user.
The difference is subtle but important.   Technically a GUEST users
did authenticate properly, and got a SESSION KEY,
and logged in, but the server said "nah, you are GUEST".  But still,
the user got a session key.

Another huge drawback with anonymous/null/guest is that without a
properly authenticated session tied to a user account
you no longer have any meaningful ACL controls.   Which may be fine
for a home-NAS but not elsewhere.

There are no good solutions here.




TL;DR
If NTLMSSP authentication is disabled, there are no other options to
map a share than using KRB5
and setting up the krb5 infrastructure. And thus smaller sites will
not be able to use CIFS :-(
So while I think it is feasible to add support to cifs.ko to
conditionally disable features depending in a kernel compile (no SMB1
if des/rc4 is missing, no NTLM if rc4/md4/md5 is missing)  I don't
think it is feasible to disable these by default.
I will work on making it possible to build cifs.ko with limied
functionality when these algorithms are disabled though.



>
> >
> > Afaik arc4 is only used for signing in the smb1 case.
> >
> > >
> > > Also, there's already an option CONFIG_CIFS_ALLOW_INSECURE_LEGACY=n which
> > > disables support for SMB2.0 and earlier.  However, it doesn't actually compile
> > > out the code but rather just prevents it from being used.  That means that the
> > > DES and ARC4 library interfaces are still depended on at link time, so they
> > > can't be omitted.  Have there been any considerations towards making
> > > CONFIG_CIFS_ALLOW_INSECURE_LEGACY=n compile out the code for SMB2.0 and earlier?
> >
> > I think initially we just wanted to disable its use. If we want to
> > compile a kernel completely without arc4/md4/md5 I think we would need
> > to:
> >
> > 1, Change CONFIG_CIFS_ALLOW_INSECURE_LEGACY=n to compile out the code
> > as you suggests.
> > This should remove the dependency for arc4. I think this would be a
> > good thing to do.
> >
> > 2, Have a different CONFIG_... to compile out the use of NTLMSSP
> > authentication. This must be a different define
> > since md4/md5 are also used for non-legacy dialects.
> > And this should remove the dependency of md4/5.
> >
> > For the latter, I guess we would need a global, i.e. not
> > cifs-specific, config option for this. I assume other users of
> > rc4/md4/md5
> > would also want this.
> > A new CONFIG_INSECURE_CRYPTO=n ?
>
> There is already an option CRYPTO_USER_API_ENABLE_OBSOLETE that could be
> renamed and reused if we wanted to expand its scope to all insecure crypto.
>
> Although a one-size-fits all kernel-wide option controlling "insecure" crypto
> could be controversial, as there is no consensus whether some crypto algorithms
> are secure or not, and different subsystems have different constraints.
>
> - Eric


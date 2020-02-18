Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 998B3162BA6
	for <lists+samba-technical@lfdr.de>; Tue, 18 Feb 2020 18:10:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=rMPFaAkQ8a1cF3Ee0IfaAFMCgqCtCEjKgwEGoVswDCQ=; b=fDJKJOA7Phi/y0rSHfy7cH+pMW
	u8vAUmHY38Pzxvv/FSK32HACFBqHHI917D/OUWgNoVgYFFuYPjdv7BO4pagov2ePi0JlOrbFol8Ny
	43QcmLad78Jgixn/TFCR5l/DiJYNrDkRPBfk6JvLk8qXi5iSY9+++pZNas9dMmrFrbcrsCr4rClXP
	tEJkGEi8z4uPbpERPFdH/FSjHypvnId8i7Ikj2DG3alPgQ1rn5EwV2QvkIscoZai4Us+fGZpc0NHn
	uXsZ2vVDR4KL0/jkSJy7klDh4rA8BefdvDfyIH6RJfTTESUrE1nB/bLT8fMqOl5qlUITDgDhAIGKz
	GAYijOiA==;
Received: from localhost ([::1]:65100 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j46Nv-00APMu-Fu; Tue, 18 Feb 2020 17:10:11 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:40529) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j46Np-00APMn-PK
 for samba-technical@lists.samba.org; Tue, 18 Feb 2020 17:10:08 +0000
Received: by mail-lj1-x235.google.com with SMTP id n18so23828956ljo.7
 for <samba-technical@lists.samba.org>; Tue, 18 Feb 2020 09:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rMPFaAkQ8a1cF3Ee0IfaAFMCgqCtCEjKgwEGoVswDCQ=;
 b=Iwxdg8zXDyYPXJsgfndUmQV+QDUu9CJrBTaX237E0FnbNdrWK7BV/Nhq4Rj/7xdFI3
 1cErjx+NFVU2cuQA05K1F/cUx4GV7zzjrDmCic3J+y1UT1GYImJp7b5MEqEi/T5RmqZX
 d2d5QD2vwtossffquq1S8Eb0hKMqSrQ2ZIUF/r3GVFmoXgx4N2YPox4ZUbRqR9kjj3QY
 hNhqSHHhywVDSGw6zaC8YBY97VpZdGjlxNiRrRw/soh9kM/eoFznCWe1VKxME1otE8FA
 us/Mg62xiQ5PxvXtsR6yn8M/E1O+Ddl7S0V81gd9BdZ4/SxQnPLJRuwwX3PMNo/LlbG8
 /pGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rMPFaAkQ8a1cF3Ee0IfaAFMCgqCtCEjKgwEGoVswDCQ=;
 b=FJR0yO4r4Lnaf+JMyOiSt8qKBhiesKOFGD2zHRn335qF1Upqpcenvw1UqG2VjYoH8y
 fNVlsnpvGh7b3JvoEnyiCUCTGMfD0/uyooULZ2NrnZe72adCnsG4nEZae0utw3WSHvkZ
 t6I1eiu7fYztW0Ds1rsUzNZwVOb5wPLtNzy1Z1pIoKxc3rsnQOombWTdDa6jz8rJ1v/c
 eW2MH8Y/YsSqjTRk5kyAJblRdUS0vkEBr+f833zlJY3993YT9Be7F0y+XtYinXY1tcgl
 h47k0dh9KzQNSDzpxcslLK5WjRM6qAf6Sq8OiSXUqzLn3817yePh+4OojnernNyj37+o
 XrJg==
X-Gm-Message-State: APjAAAXEb5cp5pKqtYV/Q80VzjzzKg3e5ixUuPLsy+CZ0jzyBrz2CPLg
 tarUtqyZLVahX+tY/ZsXswPbazOuzsgRWr6TYgQ=
X-Google-Smtp-Source: APXvYqyaGqU2kj4Ryt4PQAGVNUxvFHN+R5PLCXr+RCbVF67XUyg5gduXBqkzmcgbXnLpRo3rlCvWMRbNkDRSDoKr3Sg=
X-Received: by 2002:a2e:a408:: with SMTP id p8mr13847785ljn.145.1582045804030; 
 Tue, 18 Feb 2020 09:10:04 -0800 (PST)
MIME-Version: 1.0
References: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
 <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
In-Reply-To: <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
Date: Tue, 18 Feb 2020 18:09:52 +0100
Message-ID: <CAC-fF8S=rb+nkKRuQcjvvkqCeyJWQ5xud=GYLrgNVHTsSSbFZA@mail.gmail.com>
Subject: Re: ADV190023 | LDAP channel binding support
To: Stefan Metzmacher <metze@samba.org>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi metze

On Tue, Feb 18, 2020 at 5:48 PM Stefan Metzmacher <metze@samba.org> wrote:
>
> > I tested net-ads-search from a joined machine configured with "ldap
> > ssl ads = yes", and it works once I also set "client ldap sasl
> > wrapping = plain".
> >
> > However it doesn't work when I configure the DC to require
> > channel-binding with LdapEnforceChannelBinding=2 as per ADV190023.
>
> I think that's expected, can you paste the error message?

See also:
https://bugzilla.redhat.com/show_bug.cgi?id=1804121

$ net ads -U"administrator@ACME.COM%Secret123" -d3 search cn=admin

Successfully contacted LDAP server 192.168.0.120
Connected to LDAP server adc.ACME.COM
StartTLS issued: using a TLS connection
ads_sasl_spnego_bind: got OID=1.3.6.1.4.1.311.2.2.30
ads_sasl_spnego_bind: got OID=1.2.840.48018.1.2.2
ads_sasl_spnego_bind: got OID=1.2.840.113554.1.2.2
ads_sasl_spnego_bind: got OID=1.2.840.113554.1.2.2.3
ads_sasl_spnego_bind: got OID=1.3.6.1.4.1.311.2.2.10
kinit succeeded but ads_sasl_spnego_gensec_bind(KRB5) failed for
ldap/adc.acme.com with user[administrator] realm[ACME.COM]: Invalid
credentials
ads_sasl_spnego_gensec_bind(KRB5) failed for ldap/adc.acme.com with
user[administrator] realm=[ACME.COM]: Invalid credentials
return code = -1

> Is it possible to reproduce with ldbsearch as well?

Yes.

$ ldapsearch -h adc.acme.com -b dc=acme,dc=com cn=isaac -Y GSSAPI -O
maxssf=0 -ZZ
SASL/GSSAPI authentication started
ldap_sasl_interactive_bind_s: Invalid credentials (49)
    additional info: 80090346: LdapErr: DSID-0C090569, comment:
AcceptSecurityContext error, data 80090346, v4563

> But do the default settings still work?

For now yes, but that's about to change, if i understand correctly.

Quote:
"A further future monthly update, anticipated for release the second
half of calendar year 2020, will enable LDAP signing and channel
binding on domain controllers configured with default values for those
settings."

> > Has anyone looked into channel-binding or has any idea what is needed
> > to implement in samba (or upstream) for this to work?
> > Is there other ldap client code in samba that would also be impacted?
>
> Yes.
>
> > BTW, I noticed windows clients use both singing and sealing, should we
> > consider changing the defaults of "client ldap sasl wrapping" to seal?

Notice the last question wasn't about channel-binding, but about
signing vs sealing (the GPO from the advisory only enforces signing
afaict).

> I looked at it a bit, see
> https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=ac8fd11f1d4b9deb48d6c7942af0c83b52d69d7f

Thanks! I'll play with that.

I'm unclear about the implementation details but I think it would be
nice to have some kind of flag to both require channel-binding over
TLS and disable sasl-wrapping in that case.

> I think we need input from dochelp to answer 2 questions:
> 1. which kind of channel bindings are expected/used by windows?
>    I assume tls-server-end-point. I guess MS-ADTS would be the place
>    to define these details for ldaps.

I'll try to formulate a question to dochelp on this.

> 2. how is the ChannelBindingsUnhashed blob constructed for
>    NTLMSSP (MS-NLMP)
>
> metze
>


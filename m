Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F2461170910
	for <lists+samba-technical@lfdr.de>; Wed, 26 Feb 2020 20:53:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Eby/Uzy069tdMaGiKYZvJQOfPfab7V0fPe0YOfOns0Y=; b=wpDKQN/rsmxG0M2r0Ww04ZFFuA
	Ehcvtj9rxIbNk7qyKeNldjgDnO4K/afDCe7asBpZG5JR45ozRhPeyTB6MevyjUpOEfbe/4lXQO2WV
	5ZOohC8ZpHd7NkWYYMofCKHnI2itl1r+Jq/RGTtPvltQ5jrk0C7A+DAcpaTGhkyCJv9qbXBJUFwzd
	Cfg71czdPeNWgv/HJKD/+ZcXWuh4VfgU/U5kgJrxnsG2hP0b8ku4CGo3O6KgK4ouEJ1Bkc2Z9JtZ3
	5Msglxf1cDA66SAYIY1PVtcJlmSdCB90Og7LdAxUIhb+tReSBDjnb5lWv1EIxSTVOLlEeK4Ynlfqp
	BJwAmUBQ==;
Received: from localhost ([::1]:26384 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j72jX-00BqVn-6f; Wed, 26 Feb 2020 19:52:39 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:43944) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j72jS-00BqVg-De
 for samba-technical@lists.samba.org; Wed, 26 Feb 2020 19:52:36 +0000
Received: by mail-lj1-x241.google.com with SMTP id e3so450487lja.10
 for <samba-technical@lists.samba.org>; Wed, 26 Feb 2020 11:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Eby/Uzy069tdMaGiKYZvJQOfPfab7V0fPe0YOfOns0Y=;
 b=jbjyjeNgj3zIrAiaQGBv/MGH1eJGIPJS3iYUXygV0tTyQhU0LKCE6C+iabuHEi7CAi
 XFiyR/ZKi7CjGzBNsaI1Vob8Q2TQvEsnEbEADfCADJF9YFkb0Ypaau6LtIURIWwowgUi
 OUf9Yyuw1aMYQ1GMK3/Tjy7yTTEQ1f5uAVtsYl/sjotilQXZMeBsQs/QFzSw/CiJ6uxd
 /bQukhZpp9n8SqsdCPAz2jpKGE1iXXem00BvVwqzmqlHH+BsW/MHaF4EJsRS81uqmSwC
 Sp/5Jm+D5A7teYkrUqG9RUxZYwk7n8VRH4BVQW0IX7rOR2kA6P30ioycnuJmm+A5HHST
 GT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Eby/Uzy069tdMaGiKYZvJQOfPfab7V0fPe0YOfOns0Y=;
 b=CaHSZFUgjCqR/uR87FMJYjGeszLAmj2YOlKCn2qJX8uETJBKC4SUJNNF04r2rKRhPA
 qmz7tpjpjsf8U/o8tN/xUQvT7tEo6RpfbBaTiwaDMcTP7/DmML14dbTMGrL7wiZ2lrkV
 pZbWVJ7iTWGoOJqqw+kNJSSnwE7ekQx+5QhMRuC62R2HTIkJIDLkhvxEJLG9qUBOdiAG
 meeOyAH2KyrWMqIfAzTNfw+aolNf8ikJUc89habZBimC7oFgeT3WN/ehlzQafqLn2LOA
 tVkjja7vcSdKmey0V5Mj962AzOnugKMIFfjm0KiOseRA8FH5FNMdjUp0JTRPSJEIBz6r
 Q/ug==
X-Gm-Message-State: ANhLgQ1jNeov3C7E80bIK1mK2SxNa/Z907AXNhGDy1pT6cJDfWUu6PqD
 rKw5NHxO3eF2lBsYllPJjKSEX6NaQgztBO6nz7w=
X-Google-Smtp-Source: ADFU+vuZH7t3r5ZYS0HCcQwakKmGKZ7quU5GWuacIg8kJjsTQxAXHRlrLugpURXi2mcHvJnObveXSkzad1Gs7DcE+IA=
X-Received: by 2002:a2e:9b90:: with SMTP id z16mr392826lji.254.1582746752514; 
 Wed, 26 Feb 2020 11:52:32 -0800 (PST)
MIME-Version: 1.0
References: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
 <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
 <CAC-fF8SF+FUQBWxsPnSRtAXEqE=TWBm0Meb8swERSvHqpQf0yw@mail.gmail.com>
 <CAC-fF8SFX0ndOpY2w9zASJd8FagnT_6Mh0Xd4=ejQKQYDcK-uQ@mail.gmail.com>
 <374481b4-af4c-7b0b-cb80-feec96046b53@samba.org>
 <CAC-fF8RVr4qA1HSthHiRn1eaWWxwN=ke8EtfZPMbQmK+Wf+ajQ@mail.gmail.com>
 <CAC-fF8Quxxrx+gaqBMtzaB2zdppJNWUG7OQ70BM_qP4k-b2aMQ@mail.gmail.com>
In-Reply-To: <CAC-fF8Quxxrx+gaqBMtzaB2zdppJNWUG7OQ70BM_qP4k-b2aMQ@mail.gmail.com>
Date: Wed, 26 Feb 2020 20:52:20 +0100
Message-ID: <CAC-fF8TonKJ4JTPfxdTueW-pdqqEMAHH0qFkxfy1SLBm2Eme_w@mail.gmail.com>
Subject: Re: ADV190023 | LDAP channel binding support
To: Stefan Metzmacher <metze@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

And this is net-ads failure, same bindings, different flags (and
delegated creds).

authenticator
    authenticator-vno: 5
    crealm: SMB.NET
    cname
    cksum
        cksumtype: cKSUMTYPE-GSSAPI (32771)
        checksum:
100000009e41a51ed7c90b3597bc7217c4d3c41e0f81000001009705768205933082058f=E2=
=80=A6
        Length: 16
        Bnd: 9e41a51ed7c90b3597bc7217c4d3c41e
        .... .... .... .... ...0 .... .... .... =3D DCE-style: Not using DC=
E-STYLE
        .... .... .... .... .... .... ..0. .... =3D Integ: Do NOT use
integrity protection
        .... .... .... .... .... .... ...0 .... =3D Conf: Do NOT use
Confidentiality (sealing)
        .... .... .... .... .... .... .... 1... =3D Sequence: Enable
Out-of-sequence detection for sign or sealed messages
        .... .... .... .... .... .... .... .1.. =3D Replay: Enable
replay protection for signed or sealed messages
        .... .... .... .... .... .... .... ..1. =3D Mutual: Request that
remote peer authenticates itself
        .... .... .... .... .... .... .... ...1 =3D Deleg: Delegate
credentials to remote peer
        DlgOpt: 1
        DlgLen: 1431
        krb-cred
            pvno: 5
            msg-type: krb-cred (22)
            tickets: 1 item
                Ticket
                    tkt-vno: 5
                    realm: SMB.NET
                    sname
                    enc-part
            enc-part
    cusec: 828
    ctime: 2020-02-26 18:29:54 (UTC)
    subkey
        keytype: 18
        keyvalue:
f87166f8c694f492623f05c37c251a5b24daba82d756c76dc6a2147e80969ba3
    seq-number: 1042541160


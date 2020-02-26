Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5931D17081D
	for <lists+samba-technical@lfdr.de>; Wed, 26 Feb 2020 19:55:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=sSjFVmqtKPBgfGr0h7t+EILRgcnsjaiy3qlT2FJqOZM=; b=NWjC08JOAjQjterg01Sn8eegMw
	NGsVFt5AvyZacQAQwaCiFI7GeD660HhFd7Lppj/N5XJCfo4DnjDIw5zgFk1DcFK0+vUYcZduiiFsL
	5RHejUcDUptEtOdcJYcx5L9xjQ4kkVSStvhSnjRXBvrmnIda3Ac/Qk+6O5onS/haRC4hpRv4AdYj8
	mz6lEYaNe2LI4R3I6vmzUuG2BtfqitDSVcca0LV78+IskYm64cnKzmuV0M4anavC1ZQfXrt2UYVix
	3EWjbTmW17mftMa3VgeKvY7M7v9zd2NwPKDDAMx58SKqUC3o1D1aR7DWVkAIqV74bl2K6gTuB9MqD
	zSuTACWg==;
Received: from localhost ([::1]:25540 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j71pn-00BqJ0-CH; Wed, 26 Feb 2020 18:55:03 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:44291) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j71pi-00BqIt-Gd
 for samba-technical@lists.samba.org; Wed, 26 Feb 2020 18:55:00 +0000
Received: by mail-lf1-x133.google.com with SMTP id 7so97886lfz.11
 for <samba-technical@lists.samba.org>; Wed, 26 Feb 2020 10:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sSjFVmqtKPBgfGr0h7t+EILRgcnsjaiy3qlT2FJqOZM=;
 b=QzkOcRvGQ7YB1tcwWCmCuvrZp62eNFXnjq3oUJhVz9GmUbkfkgW8t6C8XgqOB8Yg8U
 qdyQ3fTsHJBaTDPfUIZo3vkx2SSk8bJTsHS4MJH6FS9St37XPc5Z7cUk4GJET5EfKpH5
 9T/FefNbISdixq037z00hUOaIkSncCTeIOnsNx9XStwTO0odKAe41qIyMmX3NUK0xHMa
 PQiS5MA1kpJMdrkk8UcvrkI53TsCnvg98kVdDEmpkcDtYR4/oy9AhCHgZHkSKEx3PfzS
 8S4v7OTYuWAZzHju/gkOGrGLY59xUBBUSRaDkg5B1U1uUNx5Wpg11nk10CfEVwxIAJ8B
 3uUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sSjFVmqtKPBgfGr0h7t+EILRgcnsjaiy3qlT2FJqOZM=;
 b=iZAI+J/SMQyO/ktE0FWXPVtFMPWnJFLYQF7ARBTPWuZT2OxSQOYARlir5zhdZ8aL0w
 Gn7laeK2Yagw1RAdgLKgQ104qS0ORPWPEFzoaFtcVnHDzMS7N8JTeQc/Z1XZSulO819D
 2tXM8n2mrlQOb3cO6eQNl3BCyZiPfGWqqRwlz1zxrIZR+3NjrSrssgFcla4GLjL4oQcn
 t2IB0Z3FA5OfPbKTi65g/k5T7nPW/UHlK3SseZ/jtB9ZY/PEer5nPp+Q7brQRMEVivkU
 DRal3td+DX4n75/ftNMyWQx0/iyxgtD6ND7nxl7VH5Bk4FMhmXso4Jsa1mplF54Coac6
 AjoA==
X-Gm-Message-State: ANhLgQ2mwxI69Mm9vqnQXbWxjpZqV5ohbJ4pDL6x8Dd1oCc2SBeBFJA8
 v1pUfIIKVosbgKzgIMdIQm4LGLMUtjw4QJkqz0Ma9CX+L8M=
X-Google-Smtp-Source: ADFU+vseoogeusiwtTcDF9gTmloNdoXpN3NLoPLYVIPunQDTQgoK0aWRAqZ1pi08Wd/UQHLkcAezmEUf6gLdoo3T0XE=
X-Received: by 2002:a19:6b0e:: with SMTP id d14mr50990lfa.46.1582743297255;
 Wed, 26 Feb 2020 10:54:57 -0800 (PST)
MIME-Version: 1.0
References: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
 <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
 <CAC-fF8SF+FUQBWxsPnSRtAXEqE=TWBm0Meb8swERSvHqpQf0yw@mail.gmail.com>
 <CAC-fF8SFX0ndOpY2w9zASJd8FagnT_6Mh0Xd4=ejQKQYDcK-uQ@mail.gmail.com>
 <374481b4-af4c-7b0b-cb80-feec96046b53@samba.org>
 <CAC-fF8RVr4qA1HSthHiRn1eaWWxwN=ke8EtfZPMbQmK+Wf+ajQ@mail.gmail.com>
In-Reply-To: <CAC-fF8RVr4qA1HSthHiRn1eaWWxwN=ke8EtfZPMbQmK+Wf+ajQ@mail.gmail.com>
Date: Wed, 26 Feb 2020 19:54:45 +0100
Message-ID: <CAC-fF8Quxxrx+gaqBMtzaB2zdppJNWUG7OQ70BM_qP4k-b2aMQ@mail.gmail.com>
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

On Wed, Feb 26, 2020 at 3:57 PM Isaac Boukris <iboukris@gmail.com> wrote:
>
> On Wed, Feb 26, 2020 at 3:39 PM Stefan Metzmacher <metze@samba.org> wrote=
:
> >
> > Am 26.02.20 um 15:21 schrieb Isaac Boukris via samba-technical:
>
> > So for NTLMSSP the presence of MsvChannelBindings means strict checking
> > of the provided channel bindings, even if 16 zero bytes are send.
> >
> > For kerberos only AD-AP-OPTIONS means strict checking and not ignoring
> > 16 zeros.
>
> So they are the same flag I guess.

Oh i misread you, they slightly differ then.

As about the net-ads / ldapsearch failure, this is the error:

[2020/02/26 19:18:16.627426,  1]
../../source4/auth/gensec/gensec_gssapi.c:806(gensec_gssapi_update_internal=
)
  GSS server Update(krb5)(1) Update failed:  Incorrect channel
bindings were supplied: Success

Although they send the same bindings...

ldapsearch - fails:

authenticator
    authenticator-vno: 5
    crealm: SMB.NET
    cname
    cksum
        cksumtype: cKSUMTYPE-GSSAPI (32771)
        checksum: 100000009e41a51ed7c90b3597bc7217c4d3c41e3a010000
        Length: 16
        Bnd: 9e41a51ed7c90b3597bc7217c4d3c41e
        .... .... .... .... ...0 .... .... .... =3D DCE-style: Not using DC=
E-STYLE
        .... .... .... .... .... .... ..1. .... =3D Integ: Integrity
protection (signing) may be invoked
        .... .... .... .... .... .... ...1 .... =3D Conf:
Confidentiality (sealing) may be invoked
        .... .... .... .... .... .... .... 1... =3D Sequence: Enable
Out-of-sequence detection for sign or sealed messages
        .... .... .... .... .... .... .... .0.. =3D Replay: Do NOT
enable replay protection
        .... .... .... .... .... .... .... ..1. =3D Mutual: Request that
remote peer authenticates itself
        .... .... .... .... .... .... .... ...0 =3D Deleg: Do NOT delegate
    cusec: 721923
    ctime: 2020-02-26 18:43:22 (UTC)
    subkey
    seq-number: 840038277

Windows client - success:

authenticator
    authenticator-vno: 5
    crealm: SMB.NET
    cname
    cksum
        cksumtype: cKSUMTYPE-GSSAPI (32771)
        checksum: 100000009e41a51ed7c90b3597bc7217c4d3c41e02400000
        Length: 16
        Bnd: 9e41a51ed7c90b3597bc7217c4d3c41e
        .... .... .... .... ...0 .... .... .... =3D DCE-style: Not using DC=
E-STYLE
        .... .... .... .... .... .... ..0. .... =3D Integ: Do NOT use
integrity protection
        .... .... .... .... .... .... ...0 .... =3D Conf: Do NOT use
Confidentiality (sealing)
        .... .... .... .... .... .... .... 0... =3D Sequence: Do NOT
enable out-of-sequence detection
        .... .... .... .... .... .... .... .0.. =3D Replay: Do NOT
enable replay protection
        .... .... .... .... .... .... .... ..1. =3D Mutual: Request that
remote peer authenticates itself
        .... .... .... .... .... .... .... ...0 =3D Deleg: Do NOT delegate
    cusec: 73
    ctime: 2020-02-26 18:24:27 (UTC)
    subkey
    seq-number: 2072188652
    authorization-data: 1 item
        AuthorizationData item
            ad-type: AD-IF-RELEVANT (1)
            ad-data:
3081a9303fa0040202008da137043530333031a003020100a12a04280000000000300000=E2=
=80=A6
                AuthorizationData item
                    ad-type: AD-TOKEN-RESTRICTIONS (141)
                    ad-data:
30333031a003020100a12a04280000000000300000f450fe871880d38a409147a4f8e2d7=E2=
=80=A6
                        restriction-type: 0
                        restriction:
0000000000300000f450fe871880d38a409147a4f8e2d79a2107498eaab6449f374a2ec1=E2=
=80=A6
                AuthorizationData item
                    ad-type: AD-LOCAL (142)
                    ad-data: b0b55b71c9010000876ec90000000000
                AuthorizationData item
                    ad-type: AD-AP-OPTIONS (143)
                    ad-data: 00400000
                        AD-AP-Options: 0x00004000, ChannelBindings
                            .... .... .... .... .1.. .... .... .... =3D
ChannelBindings: Set
                AuthorizationData item
                    ad-type: AD-TARGET-PRINCIPAL (144)
                    ad-data:
6c006400610070002f007300640063002e0073006d0062002e006e006500740040005300=E2=
=80=A6
                        Target Principal: ldap/sdc.smb.net@SMB.NET


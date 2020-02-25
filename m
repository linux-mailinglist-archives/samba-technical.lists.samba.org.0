Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C14C16EFEF
	for <lists+samba-technical@lfdr.de>; Tue, 25 Feb 2020 21:18:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=NDVVlyvpEnDCV6imGsKVeoqqg0/3f9x9kVIxtgVT0DQ=; b=1e2HUDSFGsYCpad3fiWjFOltPm
	BHoAqj6/TcuzDO5uRl7l6sOxV/kdSXWgICW4BK88397CQ6oGRf226xWeQjK9IHwSTNsa1FWkh8ak7
	0GS7C3iFTDtRtw3+89sfPwRoGODaz63Pf5tgv4zf3cuY+VE3OW5PE/5/OfsceMBpDrBZgOLSoXNNo
	O70/kuF21qQRIeXrffaLAeJbEAdPnUYd37/XGN95Ne+y5wBPCylDdq1aMHGSpUAa+3A+9YknC2mPc
	ThMf+Ry2kzjIESxMbtgk+NLJD0Hlx5ndrwyPOmUmiB0YzbTGE4THYjV8UPSAHaXxhkxmAu6Mp8DJk
	GUmzi57Q==;
Received: from localhost ([::1]:48264 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j6geU-00Bf3h-39; Tue, 25 Feb 2020 20:17:58 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:35021) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j6geO-00Bf3a-Jn
 for samba-technical@lists.samba.org; Tue, 25 Feb 2020 20:17:55 +0000
Received: by mail-lf1-x141.google.com with SMTP id z9so186463lfa.2
 for <samba-technical@lists.samba.org>; Tue, 25 Feb 2020 12:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NDVVlyvpEnDCV6imGsKVeoqqg0/3f9x9kVIxtgVT0DQ=;
 b=uf9RlGCjO4/7Mi02Cqjcg7AvDORPNV3FC4BLhVbt3LcEWATyju9MXiR7KooUgr3pSQ
 aNbuXuLaJwPZO/fIiyYm6/ID39+KholFJaoKEEG+tdYpWIZN8iHjT99ad4FmEFFELT58
 vvFWIelTdVBdUhaxzmmcWUW0aaeBjurdgbEJ55NmiX0veScCQNj0DJBzx+diDDAf2Ob8
 JLhRgrQlnK8lOKI1JDG5PTjHSQm46BGLFKtVI5NYpgcMXiBAwmNL5b36fxcREmRHXZqq
 f0GdQZs1wDyyia7YTaJEr01p5uRm5+UOc+H7gnE8Fs++T6SqciClizkrLSH02ZHB5FA8
 QYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NDVVlyvpEnDCV6imGsKVeoqqg0/3f9x9kVIxtgVT0DQ=;
 b=ha334sOvJxV1H9NpflKEDG4B6Tz8hD75p+mKhWa11vGQouV8T55t0x5beTiGl2zie4
 jLXiNCTIFOJAy7h9o/nnX+EuZtHfqBWMInrJwG5Yf5WSw/bH1Dh7zuE3OAgtzy5ayczM
 qQMcI4onErHAQGfly/CRchTqxWxsOqJetgKTIHcdKHlufTmVcmL4afMN9lePnOPT+8mc
 8RT3BfcIoKEjf2IxoCe/N1gYLt3yMd2/XB9t6cF/nW9NCOvBxobx76RXf4T4+J4mJ5cu
 9cQOUjrZvyKjUrtpbElZwn6qlwBKG2+EprEZZpNTXQzqxCv+UHNkeXoF+sqtNygt2yB1
 kOtA==
X-Gm-Message-State: APjAAAXCi6qWGqE8MkY6PHfxQudj0vNfwn3i6Af8rjWV8Sj4uCeW3Rzv
 Sx5RA03DV2HVncKCzv7lyBdTWdX+hsaQu1GFwcc=
X-Google-Smtp-Source: APXvYqxffHQn6QRmVisLv2IUIByE4nmxRRtujIpzbMbOFzmLm9dHfdiYRqjZX2hgtzjT5f69OPoLKBQORgjrzaJtoHk=
X-Received: by 2002:a19:6b0e:: with SMTP id d14mr320008lfa.46.1582661870725;
 Tue, 25 Feb 2020 12:17:50 -0800 (PST)
MIME-Version: 1.0
References: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
 <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
In-Reply-To: <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
Date: Tue, 25 Feb 2020 21:17:39 +0100
Message-ID: <CAC-fF8SF+FUQBWxsPnSRtAXEqE=TWBm0Meb8swERSvHqpQf0yw@mail.gmail.com>
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
> Am 18.02.20 um 17:06 schrieb Isaac Boukris:
> >
> > I tested net-ads-search from a joined machine configured with "ldap
> > ssl ads = yes", and it works once I also set "client ldap sasl
> > wrapping = plain".
> >
> > However it doesn't work when I configure the DC to require
> > channel-binding with LdapEnforceChannelBinding=2 as per ADV190023.
>
> I looked at it a bit, see
> https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=ac8fd11f1d4b9deb48d6c7942af0c83b52d69d7f

FYI, I got net-ads working against AD server by adding some logic in
source3, look:
https://gitlab.com/samba-team/devel/samba/-/commits/iboukris-metze-cbind

However the fixed clients aren't working against samba server yet,
unless require-strong-auth is set to "no", while non-fixed clients
still work. I get this error (I also wonder how can I trigger the
source4 client code).

LD_LIBRARY_PATH=/usr/local/lib /usr/local/samba/bin/net ads
-U"administrator@SMB.NET" -d3 search cn=apache -d3
...
Connected to LDAP server sdc.smb.net
StartTLS issued: using a TLS connection
ads_sasl_spnego_bind: got OID=1.2.840.48018.1.2.2
ads_sasl_spnego_bind: got OID=1.2.840.113554.1.2.2
ads_sasl_spnego_bind: got OID=1.3.6.1.4.1.311.2.2.10
kinit succeeded but ads_sasl_spnego_gensec_bind(KRB5) failed for
ldap/sdc.smb.net with user[administrator] realm[SMB.NET]: Invalid
credentials
ads_sasl_spnego_gensec_bind(KRB5) failed for ldap/sdc.smb.net with
user[administrator] realm=[SMB.NET]: Invalid credentials
return code = -1

And:
LD_LIBRARY_PATH=/usr/local/lib /usr/local/bin/ldapsearch -h
sdc.smb.net -b dc=smb,dc=net cn=administrator -Y GSSAPI -N -ZZ -O
maxssf=0
SASL/GSSAPI authentication started
ldap_sasl_interactive_bind: Invalid credentials (49)
additional info: 8009030C: LdapErr: DSID-0C0904DC, comment:
AcceptSecurityContext error, data 52e, v1db1


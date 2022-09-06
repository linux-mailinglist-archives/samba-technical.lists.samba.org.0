Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2395ADD59
	for <lists+samba-technical@lfdr.de>; Tue,  6 Sep 2022 04:31:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=sGRXsNDAe55sUCdC/6rEEkz3khLOU2eoLDaSoU/QHrQ=; b=2FLKkYsuJm6odBV3RMsL79AlqT
	w91Ifd2DKm2uJnLH9hIHaRmOZJBbbYQT8lVBC2wwRT/q1eBYF7lYHZPsWsy+Eiz/GvoqoGC/VwBfp
	SLymhltVx5jxhdCScoMNXK2rbjywawwgtQEbWnn6eiHkul8ZpEpcBU7jYa5GnOsyzPEklKz4RkeOd
	bxfWybMHq3r3MEDzYH8R/G/kG/oXjkpzSjlcIkmNjHW6l1cGFcW5hobUxMLF2vq0d492AGUZSOjfL
	uoPxQqKlWa0F5NwnjyFEh5BHyli3JffN6a+Xlb0KC6BdpICCH4IrAW056x9N3oiDT+4JTs7Hh7kOY
	eH6RzwRQ==;
Received: from ip6-localhost ([::1]:31516 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oVOLk-005dY0-8j; Tue, 06 Sep 2022 02:30:04 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:40759) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oVOLe-005dXr-Bw
 for samba-technical@lists.samba.org; Tue, 06 Sep 2022 02:30:01 +0000
Received: by mail-pf1-x42b.google.com with SMTP id b144so5206552pfb.7
 for <samba-technical@lists.samba.org>; Mon, 05 Sep 2022 19:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=ckB6mQ0Pd3pVcYEzGf9I+eCgyO8u8+wHRWy2xXC1uIw=;
 b=fcrwXApfp+9Gz+Pn8pCyPlQLAIocGTSJDu39uj4WPLhGFqKlW5fx6ylwZqeuyIV8if
 9GPwb5OkvTtW1uibCqyuelCRpZiyFwz4e6lWQqFzMdi/QlUjbTCkSZC61mE3Bbf+OcZO
 4VuXG7SIh/XllSdvoel6mYI7G2Lr5jnW/Vo0x9PX4CwFI3O9EqImGtFcH/N1b2fYRXIe
 SOdRzIM5EQnVewrr+vGIMoY6pIcOt+iOWZXV2k4yDFrngDyxt6arEU2QXtrCGClZ8nXQ
 lFnuS0LaAdtq+A8a8OpuWGW3mlO29In7EWaezfv+TLMqCRmxk+00BkdiWt4Rk6n677NU
 BgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=ckB6mQ0Pd3pVcYEzGf9I+eCgyO8u8+wHRWy2xXC1uIw=;
 b=lcIU6a8TGZWXA9DSctf5cUrjeU5ftZrfZeLpiULSXDIvu+GF+OOcroiJg9Yb7IgxIx
 WiCCI5/HMXeBguteHI9KDuJGh0UI0dx4p2YmPy69KebSWWn69HIzbMitUOEhyUxj8Jz8
 tsEA+0cZj9FMbl6xmaK2glDM/MaQ65gPrB1Eo1Jua3ILZZcw2I8L/qO3g/hFvzT3dW7Q
 VOTPqMmzqQmmI/+u53O6XFym5NbfGSaLJwJ+xY/9Gxe/iOG7fzUoTrKZ8GgrXImfd2bD
 7QgfryIPZb0jqztiwzqc7gPLPUid8Fc913mX6/K+qN7JXbDDYVnlInlWJvryGGjOQuYo
 j3+w==
X-Gm-Message-State: ACgBeo0o4hGyUIvQYmh7RZgpAZGmSmJ7UjpMcxwBei5zVUXc3VZixB+l
 RoScfqjD0k40R4qibv8ZHX93OSNABE3Ujx9N2sIUYTvodWpPlg==
X-Google-Smtp-Source: AA6agR72moggBvW2itHu9A6PST2L4XK7/lDG03RGZHt73SMKoMY4l0EsPvoNpU72khxwB76VXscn5JPc6+w2uZbDxZ4=
X-Received: by 2002:a63:89c1:0:b0:42b:afcf:d5ce with SMTP id
 v184-20020a6389c1000000b0042bafcfd5cemr38410776pgd.4.1662431394769; Mon, 05
 Sep 2022 19:29:54 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 5 Sep 2022 22:29:43 -0400
Message-ID: <CAB5c7xq9MR0=-J10tG3xTTuCh+Z-Y4b8FoJKkM3Sh_ynsV_ybw@mail.gmail.com>
Subject: libwbclient python bindings
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hey all,

I made a draft of python bindings for libwbclient.

https://gitlab.com/samba-team/samba/-/merge_requests/2707

They mostly cover areas that I would commonly shell out to `wbinfo` for
(like pinging DC, checking trust creds, seeing which DC winbindd is
currently connected to, and converting SIDs to Unix IDs and vice-versa),
but I would like to make sure that any other common `wbinfo` usage would
also be covered.

Sample:
```
>>> import wbclient
>>> ctx = wbclient.Ctx()
>>> ctx.
ctx.all_domains(       ctx.domain(            ctx.netbios_name
ctx.sids_to_unix_ids(  ctx.version
ctx.dns_domain         ctx.netbios_domain     ctx.separator
 ctx.unix_ids_to_sids(

>>> my_dom = ctx.domain()
>>> my_dom.ping_dc()
'DC01.BILLY.GOAT'
>>> repr(my_dom)
'wbclient.Domain(netbios_domain=BILLY, dns_domain=BILLY.GOAT,
sid=S-1-5-21-1002530428-2020721000-3540273080)'

>>> my_dom.users()
['BILLY\\administrator', 'BILLY\\guest', 'BILLY\\krbtgt', 'BILLY\\joiner',
'BILLY\\user1']

>>> my_dom.groups()
['BILLY\\domain computers', 'BILLY\\domain controllers', 'BILLY\\schema
admins', 'BILLY\\enterprise admins', 'BILLY\\cert publishers',
'BILLY\\domain admins', 'BILLY\\domain users', 'BILLY\\domain guests',
'BILLY\\group policy creator owners', 'BILLY\\ras and ias servers',
'BILLY\\allowed rodc password replication group', 'BILLY\\denied rodc
password replication group', 'BILLY\\read-only domain controllers',
'BILLY\\enterprise read-only domain controllers', 'BILLY\\cloneable domain
controllers', 'BILLY\\protected users', 'BILLY\\key admins',
'BILLY\\enterprise key admins', 'BILLY\\dnsadmins', 'BILLY\\dnsupdateproxy']

>>> my_dom.domain_info()
{'netbios_domain': 'BILLY', 'dns_name': 'BILLY.GOAT', 'sid':
'S-1-5-21-1002530428-2020721000-3540273080', 'domain_flags': {'raw': 7,
'parsed': ['ACTIVE_DIRECTORY', 'NATIVE', 'PRIMARY']}, 'online': True}

>>> ctx.sids_to_unix_ids(['S-1-5-32-544', 'S-1-5-32-545'])
{'mapped': [{'id_type': 'GID', 'id': 90000001}, {'id_type': 'GID', 'id':
90000002}], 'unmapped': []}
```

Just writing this email I realized I probably want to include the SID in
the mapping results.

Is there any other functionality that is desirable?

Andrew

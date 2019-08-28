Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4099BA0822
	for <lists+samba-technical@lfdr.de>; Wed, 28 Aug 2019 19:08:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=EBY6mPGPk7XKIzv/E/9IDEPFvp1m4f/pGntC1L9NkPc=; b=tm49rSciPfcZgXwP1Ny+NBtItN
	5kBoztNxaxTcVUWYpZIM89ZbgLMkftT7ZSaZy2+UfbpYa1xJZPNAgJ/34IvVN7GIF+BbYxn/Oy5ZJ
	J/80IQVzaqtUL7E9xnof2zv7b2uZ4+Q+N7wGG/rOSPeTBC1t6tLH4N7lSwaEZELbVVZGGLNrjm4/F
	0gQltL6+jJxF3KHBuN5MrUjXQOsHieuiy6IZD+wkvfuZRkjkCeVDPE+P+HgBzINvvCA3+CsVh4rPZ
	hWeZUj+3UZidlR+KDMZPNHfFEsjgyP9FLIkrxdC/DTP1q5KYTpv/LR9Zr9jCZLfHeyEzPAGW1CLJU
	94Dv/QUQ==;
Received: from localhost ([::1]:28920 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i31Qu-0002Qg-SX; Wed, 28 Aug 2019 17:08:32 +0000
Received: from mx1.redhat.com ([209.132.183.28]:36176) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1i31Qq-0002Pe-Ci
 for samba-technical@lists.samba.org; Wed, 28 Aug 2019 17:08:30 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 628C081F25
 for <samba-technical@lists.samba.org>; Wed, 28 Aug 2019 17:08:24 +0000 (UTC)
Received: by mail-ed1-f70.google.com with SMTP id w15so379464edv.17
 for <samba-technical@lists.samba.org>; Wed, 28 Aug 2019 10:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=EBY6mPGPk7XKIzv/E/9IDEPFvp1m4f/pGntC1L9NkPc=;
 b=ifbpeqo3RAYZtxOZHQx51ygk+3rsKauTyEXPHK5UuVe6Yv+PnYXB5qUXuethr5Ae4H
 uHMSya07mbyEtE1N7CL26hvrI0zE257gBagWyV8s4xK07ghr5JOQkvJbyxWhTUDvsSeE
 w+akeceyq37ZNKkH36z1+28yWx3cwWaMvqPj1H2sTNS+2yfz/Rj5Z/WgPZvp0TBkm8tj
 3hNswoTSx7JlDUCquKZtqLYS95fadVQdF8ykj475wEuhY4eO3AAruhgDRRRqv+NlDSG7
 jRqOqX+wOkVLPMQxtOYgQaMtNp+g3RVzpYPZaCvnSu5tF7r9ve9pbpdzwPjZ1oylpQLY
 FWnQ==
X-Gm-Message-State: APjAAAUtpFQ9KH+Cf8asPvYjl6Uty6C2PXCqjspdh5j5bjbKDIHugRFF
 LJyK758MR8Me+HllH0FVztE1sR8HIUVaxKepA4Ff8yG4xzLIm8ehDwV7d0R9hl1mebDL9vpQbnn
 IQnEH8FTYYMOrMZzDgXhmGsQ2/sgz7KlMHIyAaoQ84yUc
X-Received: by 2002:a50:da02:: with SMTP id z2mr5165892edj.254.1567012102924; 
 Wed, 28 Aug 2019 10:08:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwc4iKqf5/z3eizfa61hwnYn9Hl0Z8YcgqAD/iTQsRHYjNhV2dpUYjxwqjspG0u0ez4EGNU1zs3ab7mVAZ2Y14=
X-Received: by 2002:a50:da02:: with SMTP id z2mr5165875edj.254.1567012102772; 
 Wed, 28 Aug 2019 10:08:22 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 28 Aug 2019 19:08:11 +0200
Message-ID: <CAEiGmB+e_BcL=shJ6y+ePa2Ja4d8xw1NpZSXc3sym6EGV=DD-g@mail.gmail.com>
Subject: Join a domain independently of local hostname
To: samba-technical@lists.samba.org, Andreas Schneider <anschnei@redhat.com>
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
Reply-To: Isaac Boukris <iboukris@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

In the join process, if we get an fqdn from getaddrinfo for local
machine then we prefer to use that for dnsHostName and fqdn SPN over
nbname+realm, see:
https://github.com/samba-team/samba/blob/1f923e067dbe358c17cbccfe179baa811aa3b8b3/source3/libnet/libnet_join.c#L523

I'm working on a ticket where the customer wants to be able to join a
domain based only on netbios name from smb.conf, independently of
local machine hostname (reportedly, this used to work). The problem
they are facing, is that the fqdn returned from getaddrinfo, sometimes
has already got a registered SPN and the join fails with "Failed to
set machine spn: Constraint violation".

I wonder how can we accommodated this use case, maybe we can fallback
to nbname+realm if we get this error, or perhaps by adding a new
parameter to net-join specifying the machine fqdn, or a new smb.conf
option ?

Thanks!


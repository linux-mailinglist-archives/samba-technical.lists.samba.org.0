Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F257B3A4B7F
	for <lists+samba-technical@lfdr.de>; Sat, 12 Jun 2021 01:58:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=ue2Fai1CUUfmls6X3rfEQqAKrunZ8zZrgA/8pkMHeko=; b=NzYr6EMiJL2FCL3AuTfaAsBgMg
	jv03pMqYqviwL016JG2pQHkAKv7Kggn2pTsHH4OXBj1WiyvKpvUBUtDkEJLWGjlAtiyK2zb4ZTuty
	QaHQmswd54lkNo3vClyR9ZV+wV4P0wAVuHoOotqO7p+uqJp3qlmuLXInAeVMcSa20Y++FUcr2xwZR
	qAFTxploEMi8LnBdPKX/CsN+rIlnngljixVIO74JZh0MyQNwym3+IXPFohp5/h8suAMQUKqdO1RSP
	W7EEbyKWbtyk4AlUC1rPkES1YwIHVRHY9zAzbfpKEwat3PvGNmXUt6mWm9b55293SCT/tpm+h2vJa
	EfFqGAYw==;
Received: from ip6-localhost ([::1]:27826 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lrr1L-005LFl-5Z; Fri, 11 Jun 2021 23:57:03 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:35398) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lrr1F-005LFc-H2
 for samba-technical@lists.samba.org; Fri, 11 Jun 2021 23:57:00 +0000
Received: by mail-lf1-x12e.google.com with SMTP id i10so10988290lfj.2
 for <samba-technical@lists.samba.org>; Fri, 11 Jun 2021 16:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=ue2Fai1CUUfmls6X3rfEQqAKrunZ8zZrgA/8pkMHeko=;
 b=KqeHZt0CZA5yhc3KJrpGrio91/L0snDl/UuY/a5bXykdmYl1OpgPKjSRwu1LsPcsJI
 11nS3iUH+pYw6T16ZpShpUPANuAks249B0jUU1EF8rrMcr+YaYRd7kR50gGjNCHO4SzR
 hcfAPkVw0tmya5yR5ATHymHSTGdSdvvX36IGLy4kC2JcIDWxKjWI7eF6v9apr0MZMdXS
 2wop1pVsjOkrzlfB3xQP7UsW3NaOt04Gp0f55l4IFnLLG0eWoKzH0+fV3IP+gSfJNa0K
 64f3ifFMReiOMNFc8u5mikJRfHo/LOI6FvZPZAxxn3Yjmlepqzq5VB2eZCEtkL9zHtVP
 CK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=ue2Fai1CUUfmls6X3rfEQqAKrunZ8zZrgA/8pkMHeko=;
 b=K1WKGulhZtsNIHn6yVGPtM/GegXIv7gQV4LnxgdoxnaNor1R3IQoVTVxrqx3jMvhQY
 A5eTitYibBAz4zaCPOE8D2+im3QCtIRbU+vaMlSOwTwa88lHvxlDH05yjqURpiM2ZCX1
 A+Oj/QL4jSfrg1eXZFjIMIhgk5MOZxTTna0lEVdV/sI60v0tDdq0b7nKYiyI3H0z1E/f
 32KCc9o8W9yxaC5HhpmTXq7dyA1OoW+L6jyrKP2tvdIZoQLBsDbL42fkZmnnm72tbrYw
 b2uwV1UFOqwzE7vy0BYjIqQdI2XfIR9y7HuAP5cEwJazyvd2TGFdLCWYb0eZa4ny82u2
 eqnQ==
X-Gm-Message-State: AOAM530u9FeAYt+rbkE6Wv36sUruKbzFRld1jvB4IPhsthGHwjhkp7e5
 79HUssJCvl0OVpke8CFJ5byKtOvkmelOW95BiDkoFnyewnk=
X-Google-Smtp-Source: ABdhPJzkfRg8Id67rhZTsUKfnfu7O4vLh2/QySG8jUbd2VOQ/bTQVLlwc0IIkudoMHJjSwbbNi+MH0DqpDVl8ERphx0=
X-Received: by 2002:ac2:419a:: with SMTP id z26mr4251204lfh.307.1623455813865; 
 Fri, 11 Jun 2021 16:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAJwt-Jns5=XneYgidODs+SjJmWvoq=BhwbvRA0Z4SDKLgdZs3Q@mail.gmail.com>
In-Reply-To: <CAJwt-Jns5=XneYgidODs+SjJmWvoq=BhwbvRA0Z4SDKLgdZs3Q@mail.gmail.com>
Date: Fri, 11 Jun 2021 18:56:42 -0500
Message-ID: <CAH2r5mvv8dn+u9JVMJo0dvQ_Nk2esO-uDY4J=equS6AcMgSbOg@mail.gmail.com>
Subject: Fwd: Is it possible to mount a cifs share with kerberos using the
 machine account (with active directory)
To: samba-technical <samba-technical@lists.samba.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

---------- Forwarded message ---------
From: Bruno Bigras <bigras.bruno@gmail.com>
Date: Fri, Jun 11, 2021 at 6:51 PM
Subject: Is it possible to mount a cifs share with kerberos using the
machine account (with active directory)
To: <linux-cifs@vger.kernel.org>


When a Linux machine joins an Active Directory's domain, a computer
account is created.

A network share can be configured to give rights to the computer account.

Can I use that account to mount the cifs share with the computer
account (with the keytab file)?

Almost every example on the internet is about using a user account or
using multiuser (which also uses a user account).

Thanks,

Bruno


-- 
Thanks,

Steve


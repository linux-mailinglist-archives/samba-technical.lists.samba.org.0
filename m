Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B69A626A3E4
	for <lists+samba-technical@lfdr.de>; Tue, 15 Sep 2020 13:10:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Q2WPthXS7MrGWVdCY/Jg9kJGXBjJridZ5SvapxuBOI0=; b=ZVhxxfFxxWXk8NgvCI9Ecurt+H
	mJbY4GuK1LdEx48InyvrVljfXvhf2+fLhhFqA5e+hzlthEX1CZr+YeQMw6N23cmtQ+NkPH7Q5fxEM
	qziwWvJlOKk01t2GKrGQkfvIomcru0Lzhamdsd/ljMi+UXc59A9rXPMKvGjeiAPf5iM66VtOfb7w3
	Pk4vQsqABQ8KSxV/Ts8p+ufrwQyJ1t1xhtOuPVamg+FGtIX3pcOL2rS8jCg02edbrCY5k3/o3PmWO
	REUdSFmCjM9CPhpsKqLjHQQwHuhzVe4OfSrB5te5oE6touyf4bDgJ0YvQEWp23vawMQeHQicymfVB
	PDWjvXGg==;
Received: from localhost ([::1]:60290 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kI8pf-005T3X-Df; Tue, 15 Sep 2020 11:09:07 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:35814) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kI8pa-005T3Q-DI
 for samba-technical@lists.samba.org; Tue, 15 Sep 2020 11:09:04 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id BA17ED6E07A10;
 Tue, 15 Sep 2020 14:08:58 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 7H8Nex0EoPoq; Tue, 15 Sep 2020 14:08:58 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 3D08ED6E07A1A;
 Tue, 15 Sep 2020 14:08:58 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru 3D08ED6E07A1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1600168138;
 bh=Q2WPthXS7MrGWVdCY/Jg9kJGXBjJridZ5SvapxuBOI0=;
 h=Date:MIME-Version:To:From:Message-ID;
 b=IplXVrIk4+nU9Zk2PDY3Bgx9jHkL5gWpuvZsauQP7XXzwBkasVgSOtggcQyq3PZEA
 0ozGFkE/EJejwcioMKqLZ21t3b2Hwbr5VaPrCR/OUrrj8uPrPM1Tux4XtWEBsMFMF4
 AX5cYRcReN3QwRcc5Edv3/4N9co3qDzvZm+5Tdxci8FITkYMhYhkvXij0Gy74wnh2N
 Nsyi/eDR6SufJWJ4Skwix+2n3BN6O3O60CCv5MmGB+MsUtXWHsvZgfevPL2hAt8m8y
 Q8ftyMYxFFzY82pJUksT7rvqiOvOqY/cg62YgB7U8sN8JWbbI17GguwSSrtbN1GiTJ
 NiXv6ewNPtONw==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id vGrFr7hDm3Hz; Tue, 15 Sep 2020 14:08:58 +0300 (MSK)
Received: from [10.68.14.64] (unknown [91.193.179.24])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id C9ED2D6E07A10;
 Tue, 15 Sep 2020 14:08:57 +0300 (MSK)
Date: Tue, 15 Sep 2020 14:08:53 +0300
User-Agent: K-9 Mail for Android
In-Reply-To: <adf4a272-cd82-213d-d630-93bac4127812@samba.org>
References: <da8c5360-fe43-16e5-e149-657a22cbc61a@rosalinux.ru>
 <adf4a272-cd82-213d-d630-93bac4127812@samba.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: SELinux attributes in Samba domain
To: Rowland penny <rpenny@samba.org>,
 Rowland penny via samba-technical <samba-technical@lists.samba.org>
Message-ID: <29C547AD-181E-40E0-A423-C7CA551CE4BF@rosalinux.ru>
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
From: Mikhail Novosyolov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



15 =D1=81=D0=B5=D0=BD=D1=82=D1=8F=D0=B1=D1=80=D1=8F 2020 =D0=B3=2E 10:10:3=
2 GMT+03:00, Rowland penny via samba-technical <samba-technical@lists=2Esam=
ba=2Eorg> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>
>Your problem will come with sssd, it isn't supported by Samba (because=20
>we do not produce it and no little about it) and even Red-Hat no longer
>supports it use with Samba=2E
>
What is the problem to use sssd as a client to enroll into Samba AD domain=
?


--=20
=D0=9F=D1=80=D0=BE=D1=81=D1=82=D0=B8=D1=82=D0=B5 =D0=B7=D0=B0 =D0=BA=D1=80=
=D0=B0=D1=82=D0=BA=D0=BE=D1=81=D1=82=D1=8C, =D1=81=D0=BE=D0=B7=D0=B4=D0=B0=
=D0=BD=D0=BE =D0=B2 K-9 Mail=2E


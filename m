Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1A7188C9
	for <lists+samba-technical@lfdr.de>; Thu,  9 May 2019 13:14:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=iJz5DjxnEljwtap+uNhlDK+XlgWX1A76i+omJp6NB08=; b=ag5uV+sZUyRDM8cQqBsIx5cCC6
	8cd4W0fi1hrIgDsKR+mnvsiUU8jXeJ5CcV8f+XD/BHM0jifTMIKOxggScwXbvurp7+eXsH2MUIs0F
	08vGyHaYCC5qpbfleEoVbxvhVr97THNiEbXEkIAST4P9XRrL/p5i6bHog4I2MeUmDt6lSfW0miWU5
	gpJJmHQ/Bwcua/2jh9roQ0fTjmag9dPm4GqnrL1VuJRkXvzG+KjI5FuWcJOmgJjyiujA3vmoKuzKO
	pst05UEKAKsIQL0QddzOufKpPkEt2ZoLn+3my/FSHxXGDid7gf2ZHeI8IfLYFr31bJy1QZCKCcwcL
	Qw7yJ5pw==;
Received: from localhost ([::1]:45290 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hOh0T-0034iM-Md; Thu, 09 May 2019 11:14:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:55498) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hOh0J-0034iF-EA
 for samba-technical@lists.samba.org; Thu, 09 May 2019 11:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=iJz5DjxnEljwtap+uNhlDK+XlgWX1A76i+omJp6NB08=; b=sphUPCiEmJxObNCe4zGsyQxi+j
 0FyJFX1oTWZmEDW+gQ1nlCjdG/8N/CY8RFyiXlNDemycefdBK1X5uoS9bjw28yPrWHfojYpM8siaF
 pQRX6cIDSk/FSj2KAK+Xf4WmCbhRCfp/H3EKoy7+yT/E9BmkxSEuat4rSpXBhr34z/6o=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hOh0I-00069A-70; Thu, 09 May 2019 11:14:22 +0000
Date: Thu, 9 May 2019 13:14:20 +0200
To: Samba Technical <samba-technical@lists.samba.org>
Subject: GSoC 2019: welcome Mairo Rufus
Message-ID: <20190509131420.17d98c62@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: P Mairo <akoudanilo@gmail.com>,
 =?UTF-8?B?QXVyw6lsaWVu?= Aptel <aaptel@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I'm very pleased to introduce Mairo Rufus, who joins us as a 2019
Google Summer of Code student. Mairo is assigned the task of
improving the smbcmp network capture diff utility[1], and will be
mentored by Aur=C3=A9lien.
Please make him feel welcome.

Cheers, David

1. https://wiki.samba.org/index.php/SoC/Ideas#Improve_smbcmp.2C_the_capture=
_diff_tool


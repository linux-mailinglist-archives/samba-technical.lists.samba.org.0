Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0FC4AD35F
	for <lists+samba-technical@lfdr.de>; Tue,  8 Feb 2022 09:28:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=xv33+eeMkWzDez+2yvpd6+PQvikQ30BoNEj5XQGaNgw=; b=Y2Sgcs7p06BQ/hpsCaPdO53LNo
	EelvRPxOup8rVRcyAlzJhdektnYBaIGd1m8TikkzrdT6DUy08YpWQiNlWiYAsRekZKEbsQdF+FfOe
	xs79gmrTt9Me3qZGjRDTJHjOoFQRz84u4ikeZlY6cRYeMJ6Af9L+jk8V9CKwonC5NGoxZZn5syxCk
	plHrvOuZJvBTjETcz5W1oy5No1mQPypdTaU33ymHoP+4EFhEn5eUxRDsWqaKD/mKn+/aMPrAKNA6a
	ghQ330Gpb2+OLlB2AgAxp1n/FQ32uXcoBS/gCCCWVL4C89/7+IJL4KlQ07t2aExblxq+3F/AFLZfK
	Oor0d/sw==;
Received: from ip6-localhost ([::1]:29602 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nHLqY-005i2H-UV; Tue, 08 Feb 2022 08:27:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48754) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nHLqT-005i28-G1
 for samba-technical@lists.samba.org; Tue, 08 Feb 2022 08:27:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=xv33+eeMkWzDez+2yvpd6+PQvikQ30BoNEj5XQGaNgw=; b=LMWgkrdTB9n0ztlZqLAplInLSo
 sEnxO/oeWnv8vYtkpnBL6ksYh9bUUMGOD1iarTImZuJVH2CAuBovTsCAmahb8viWwTpAXjpCqATBg
 CT3xeBXY+f3WO+1Cw4wGZ8SGwokslIoLpU2jiSfxO0XNOPm1YfSAKchmXccQ6l6U5b/Bvc7rcDQXK
 ppWf1Urqg5rL28DRA5UfK9aMpqazk5m8M+DUxituLnruQUtX7ELizVdqn9pQCyR43zKp8WkhnNQRC
 8vHIAwTWx0qGe0kt45xmklGXy4KpN20VWtWuw+LWqcWEfegRovPl53xTciK9cUGLGyxVTEK3P+Se5
 ipPlZWwo4XvJZ6ZVTOko4OLMn3OAJV2RB27R8OkaBfXonGLx4hXIBb57tf+3Hy34+t8WItLQu61fI
 N2J/Slyc25hG9DqCyRfAXBWfJppM7UESpnp6QCDNU3dDgLdpRnHau++fhdvsG9iOTwWy+ck25dQla
 A8zLPMzRdRolar9+FJ1ihEMA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.2:ECDHE_SECP256R1__ECDSA_SHA256__AES_256_GCM:256) (Exim)
 id 1nHLqS-002gTi-Fy
 for samba-technical@lists.samba.org; Tue, 08 Feb 2022 08:27:28 +0000
To: <samba-technical@lists.samba.org>
References: <53125588031f8ffad9e7c8a4b16a7f093781a39f.camel@samba.org>
 <28c3b502-7146-4403-b728-4815dafa9110@samba.org>
In-Reply-To: <28c3b502-7146-4403-b728-4815dafa9110@samba.org>
Subject: RE: [Samba] Remove LanMan auth from the AD DC and possibly file
 server?
Date: Tue, 8 Feb 2022 09:27:28 +0100
Message-ID: <7ED0341D4A664362A8D0F86DE1C1E978@rotterdam.bazuin.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 11
X-MimeOLE: Produced By Microsoft MimeOLE
Thread-Index: AdgcxbRTtUMh+Q1NQIe+598qkZ6mng==
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
From: "L. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: belle@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Even i've still got 2 servers that use SMB1, i say same.. 
These are not giving more problems then joy.. 

So, remove it. Old stuff will only hurt more in the future to 
try to keep everything compatible and compiant. 

Here, in my case, i make a special build for these servers 
to keep samba to the latest version it can run. Its a choice. 
I have to do that untill these servers are replaced. 

I also think, the time can better be put in stable then
trying to fix and keeping it in. 

Time is precious.. 


Greetz, 

Louis



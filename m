Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F09808C465C
	for <lists+samba-technical@lfdr.de>; Mon, 13 May 2024 19:43:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=p7bYJPGjaXsSUc5Jg1Oway4HfsSQC11IlAkfbTWHT78=; b=vXAeh+Tv9D0+Y9IkXtrZhk6Qrw
	TKm7vu6R+nGySTldMr7c0lnY0QVEZymqOpSYhU0r2PlPRE+XPrzqjWHYt89pD7XNM9ewjSKubIKU9
	qXdxw19eVOi/zO1TSqzBAoFzKUOE6DRx9nvVE23aOf2BxyPLHHJ9MdZWRLD0O2PoIWA0jvyB4RmKH
	rn97fSn38J8ho0zuR0bTXj3T9vWgfnzRV/VoZ/NRUHuDWsnWKORXAG0gg3WqlR59Pbd4LKFrmw24I
	Euk44N3IkuS3GxLVISFyt7t5bgAW4BytNNN4Qg7Gw9HxqBDClKsKJ6hPATST6BtazS/oWwljnK6pO
	P034UTwA==;
Received: from ip6-localhost ([::1]:37318 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s6ZhA-008nqF-Et; Mon, 13 May 2024 17:42:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15528) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s6Zh5-008nq8-W8
 for samba-technical@lists.samba.org; Mon, 13 May 2024 17:42:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=p7bYJPGjaXsSUc5Jg1Oway4HfsSQC11IlAkfbTWHT78=; b=yk3o9nTJXBdzaU03/aGGnyJBr1
 lEYa6f+n5jSmB0yKX7K4cd75eUbKtiGWkOPy+SFCtM5CfIUHFaBVhZ/d8dzuIe1CuzarGt2LrHtyL
 14kuotuFyVv+mmKAJRQxdNKs44Vxr17A9H/Yd3r4rg4QLkfnngtD52EJ3ZzgIp5Bh/31KGb3mF1IK
 Ao0Y/ZHxkE1eHXGN/fZIGDmzTgyJ6RFafB+nQpCcYif9oI7DclQAP7sbH/WQp+l/SXh606bQEGCR3
 /Cd7RWAGq735w8saGsiteLMo8EBaK2GrePbC5zZkCP8PIV+qWfF8CcqQ3EHufmZ31flc98b2qbLY5
 npq7p5beMF4BeRyEejPjbuUjibzdNoBf4vgkZ7REyISiBFYV8Pbi8E8RZQNvUlBYZ99GZwhwOKZqM
 2YqLqPM/gM+YeV8jcBNAM0LsYsjRc6aa04MveK2RjlZAqFkEtAjUlwuRBv1mXvJ1qkRiJmqw3sko9
 MUNX/crTAFsIi/MMe8TSIbPc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s6Zh5-00BEVq-1B; Mon, 13 May 2024 17:42:35 +0000
To: samba-technical@lists.samba.org
Subject: Re: Openchange and last Samba releases ?
Date: Mon, 13 May 2024 19:42:34 +0200
Message-ID: <2708725.lGaqSPkdTl@magrathea>
In-Reply-To: <CAN4xyZOYsusPpMjOyUakgEsdjQQsXZRNTER-Jq4Zis20F6gKWQ@mail.gmail.com>
References: <CAN4xyZOYsusPpMjOyUakgEsdjQQsXZRNTER-Jq4Zis20F6gKWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: CpServiceSPb <cpservicespb@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, 13 May 2024 16:38:51 GMT+2 CpServiceSPb via samba-technical wrote:
> Was anybody successful in building of Openchange with the latest Samba
> versions ?
> If yes, was it a git Openchage version or some customized/tuned one ?
> And what was the Samba version ?

Fedora and CentOS Stream are still building openchange:

https://src.fedoraproject.org/rpms/openchange


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




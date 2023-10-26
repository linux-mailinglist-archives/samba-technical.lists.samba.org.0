Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DC29F7D7D90
	for <lists+samba-technical@lfdr.de>; Thu, 26 Oct 2023 09:25:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=SHLeQ4gZOJhzDZtnjl1JlkTv1EEFMIvspPPRbaiJRcQ=; b=Y39dsbZkwwLo02zCOxMLfvyBWy
	xDzK4BwUjxpJP+k6cDBnsVFmeT9zxalhIGktZGOYacX8usX0hRLv7f96U5YanwPDdkly9VA//hiVA
	hRAVrqFROX0XN5dHy89QguFKck87ep16EtueuwbOUfLTGXDp4OjV+p0cBgbuzLhkAMVKcZs2ITl6m
	UhI7LtLWU9yjpZjzUqDzPm36lZPNg8IdY9fwusiFKIzj6widfakvl0nXHQSroX+kX3LMLB4Q6EbVj
	CC9Df4lFV4BwVjW2iGJFrcrkguSdgetMvtiBt2sU7oEqMIU0KXTBj4usLICEyDUTH7+DyFBC6l6rQ
	kgFn9ymA==;
Received: from ip6-localhost ([::1]:41536 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qvujf-002bXq-Ju; Thu, 26 Oct 2023 07:24:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26406) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qvujY-002bXg-34
 for samba-technical@lists.samba.org; Thu, 26 Oct 2023 07:24:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=SHLeQ4gZOJhzDZtnjl1JlkTv1EEFMIvspPPRbaiJRcQ=; b=c+x71lVQs86qJG7nG2sxmD9lQp
 3T3ZcEZQboG/201E0sG8LbmpuzcHXjmLe6z7sc95xY/Jyq30+cpxfqhqgLUwO34g2nMEoiftkl2vd
 C36x/8iH8JRH8X0zrwlDDf4rbhj45qolMNqGjdcP2DLLXUw+2GB2FIPF0+9T8kXL3da/hYjK+UYg4
 RwPDLzR1qPhppOfV7SwADSqRO3IfNca7j4rNXQNpk0QuVXFPdA2dc0W3geUxFTlcD1o/IVf1+jjxj
 w/c4hWgDCXMlM10lSyP2xCmtT9S72A1uEIOWZsN3V4DSEVW4JF81NwoXkqukTWtzr8DsaHC68KX0X
 QblEprwroEeMoKoRShV29P1zQtiLC05EiVuY99fprKRHarLpnDhj+Sc5yQyz3LzgoZXgVQkZgDQrw
 Sn8Gtm40rS43lh9UKeG294lx1qFLL6LWTAhGKAp+syXoAyHJohPdE/2et7/VrjeSgJ0j17oRN/YYV
 SlKMUJhXVUxSpL6OsxrJmjuE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qvujW-002h1h-18 for samba-technical@lists.samba.org;
 Thu, 26 Oct 2023 07:24:46 +0000
To: samba-technical@lists.samba.org
Subject: BIND changes ahead ...
Date: Thu, 26 Oct 2023 09:24:45 +0200
Message-ID: <6012158.lOV4Wx5bFT@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

if you read

https://www.isc.org/blogs/bind-architecture-25-years/

you will see that BIND is going the Samba way. We had the same with the file 
server in Samba AD and it it our general approach how we work in the meantime.

A former colleague works for ISC and the rumors are that BIND will make the 
dyndb API together with DLZ API internal. They might not provide an external 
API any more.

FreeIPA uses BIND so they probably will look into that.


Best regards


	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 221261EF28E
	for <lists+samba-technical@lfdr.de>; Fri,  5 Jun 2020 09:57:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=w+N05hNnYze0CUMtZDbvTJ2sZyCa1lM7rICP16CgXIQ=; b=l0Ki9wrefceGpBQRgISb7XRPbE
	Q24sdc5QAHDKTBstxcmuP/HWP58Q3ko+cliOda3ZuSOoK27aQCGuoraeVvzLdkHwdRKBoMSt2/wkr
	LFj7Tyxk7DlN08bEeV7LrI7IVknK/LW6XjEoMrXlsoempGwdrPEiszLATJ/TpC+1ojcZXubatCO+k
	zb89//Rd/NoxZ/EuDYoWyuV/nPo+EmbybRk3rYdXMLt5M8J6EcMU/5njaQoQrWZrILztfVAFJeh2L
	HsetiBN2+y70IEkBk22bcgdLMl5WbBZcQjX9D1fEk61ruKBdCBp9hTUvESVd8naRxmpJxxgCeSF0Q
	6bxT6VRQ==;
Received: from localhost ([::1]:32378 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jh7Dk-0093Py-Cz; Fri, 05 Jun 2020 07:56:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42870) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jh7Db-0093Pr-I9
 for samba-technical@lists.samba.org; Fri, 05 Jun 2020 07:56:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=w+N05hNnYze0CUMtZDbvTJ2sZyCa1lM7rICP16CgXIQ=; b=XhkJu9jid5oIOssPSBfQWpVz3B
 +kh3wwCZuYJAWRp+i9JY53603mjSkQ3Q5ZSKtVR0qDOJEt4JtuVT/je9Fkjm3fgk0tgKIzm4z60Vj
 ruCKUfbmeYzuKOcIjzsc4E5sO43N9f2wQTeEh8/6WY5xh9a3Y6ugqKANPGpvP7pwEs4l3d5jErjBO
 Wy+wifNtdfC//+5zBm8FMdyvk0EmwKVGpDZekQdvBSa0rEd4+V66sM+HSZvQ0VgmwaTovQHMW7Uqn
 bibqNckhW5417aNY3th7lQcfdRU1mRnaFvnuNLbH4VDheNv+jSDHGklwKX48qgxg4a78effb6NY+N
 ylv2fU1GbzKOr5n462OmHVTxAsyU3HOar2rzzbdnD+318I+MBbVEV3LYFum3spSaVbdtr6vv6/ucX
 oddGZrB88fHS7fPU8EyigHJNMkAqaOl11Tcg9Ax6WCPWgy+uUIoOH4E8aHF4Flkxv4CQK3DAdH+pc
 KZyITwdyozmkgPsJDs7Tbxoj;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jh7DX-00049a-KA; Fri, 05 Jun 2020 07:56:43 +0000
To: samba-technical@lists.samba.org, Andrew Bartlett <abartlet@samba.org>
Subject: Re: git signoff+ and review+
Date: Fri, 05 Jun 2020 09:56:41 +0200
Message-ID: <3376401.t2CYSfcsgO@magrathea>
In-Reply-To: <c2d4f9132f8a70749d6019acc5b592f32415d652.camel@samba.org>
References: <2070261.IvKQ8U6GgO@magrathea> <2877725.qJPT1UHR8W@magrathea>
 <c2d4f9132f8a70749d6019acc5b592f32415d652.camel@samba.org>
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

On Friday, 5 June 2020 02:06:56 CEST Andrew Bartlett wrote:
> G'Day Andreas,

Hi Andrew,

> I wondered if we could have an agreed set of aliases included in Samba?

You cannot include those in the Samba repository. Those are all individual. 
All you can do, is provide a script which could set them up running 'git 
config'.


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




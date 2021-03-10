Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF9F333DD9
	for <lists+samba-technical@lfdr.de>; Wed, 10 Mar 2021 14:26:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=oozxfJUMifJJrkamj6TibjZST9b9ASZ4p9FBpuGyzA4=; b=Fcdv+gzeeTpgWhLo93re1c6DZX
	qUd1utpgemMJECB+3zcY8yXB4oB6ghGAaat9YGSgBJlo0Tgwl/i92aOFC3t8pyU0hx702cdnkiuFO
	8KQerA0p9A+Q2gZ/EPlFRDU2xkAz7DuP0yrAx24YuBo7BsJfvMBc4UYrguB1fpyXt7f4IhQZBxicf
	fHcHI07IB4Pdizgfn952dZpSAvyUsTyCKGoKde8x5dSzmNig1+RWJZxI3FsQwCLr7Uxtqa1F1g8sS
	zaSnLcudps7pnFRKuk9zgxf45bstkutCnZoqjhGVYwyxnU6x3iN9M0Sz7GqlYDa/8kSGCtfOpKSw0
	CCYUgW2w==;
Received: from ip6-localhost ([::1]:36666 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lJypl-004lG9-Lh; Wed, 10 Mar 2021 13:25:05 +0000
Received: from m13101.mail.163.com ([220.181.13.101]:35325) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lJypg-004lFz-GP
 for samba-technical@lists.samba.org; Wed, 10 Mar 2021 13:25:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=IHAwZ
 UPLh9d9jpjKAq6yT7z6ZyCLu0ZbTI8+k8cZGSg=; b=bXGz1fipRdy9QkRufoMj8
 xtJB5sdFkw1vU+Q9ABmZNHTnUYAavLGAveV9xcw1YohBUhdm3sehcbZmwDeLJLuf
 eck7gm7t6LUpg0lrFkvhlYPHNWwH/ftivTWR12pSnANKHxygQUDfjDVIItzxzwXP
 1u8mVGhRLjlyUSHTrsPtjE=
Received: from ssdl.566$163.com ( [113.200.44.63] ) by ajax-webmail-wmsvr101
 (Coremail) ; Wed, 10 Mar 2021 21:09:22 +0800 (CST)
X-Originating-IP: [113.200.44.63]
Date: Wed, 10 Mar 2021 21:09:22 +0800 (CST)
To: "Jeremy Allison" <jra@samba.org>, 
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: current status about reparse point support?
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2021 www.mailtech.cn 163com
X-CM-CTRLDATA: 6eKuDGZvb3Rlcl9odG09MTczMjo1Ng==
MIME-Version: 1.0
Message-ID: <4da09823.98d7.1781c41931d.Coremail.ssdl.566@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZcGowAC3IjUDxUhgSlIhAQ--.12190W
X-CM-SenderInfo: hvvgzhqvwwqiywtou0bp/1tbiJQNRh2AJkJ-tlQAAsu
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64
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
From: dongleilei via samba-technical <samba-technical@lists.samba.org>
Reply-To: dongleilei <ssdl.566@163.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SGkgSmVyZW15OgoKCiAgICAgICAgICAgICAgICBJIG5vdGljZWQgeW91IGhhdmUgYSBicmFuY2gg
bmFtZWQgbWFzdGVyLXNtYjIgb24gIGdpdDovL2dpdC5zYW1iYS5vcmcvanJhL3NhbWJhLy5naXQs
IHdoaWNoIGltcGxlbWVudHMgcmVwYXJzZSBwb2ludCBpbiBzbWJkLgpJIGZvdW5kIHRoYXQgb25s
eSBJT19SRVBBUlNFX1RBR19ORlMgdHlwZSB3YXMgc3VwcG9ydGVkLCBteSBxdWVzdGlvbiBpczog
d2hhdCBhYm91dCBvdGhlciB0eXBlcywgZm9yIGV4YW1wbGUgSU9fUkVQQVJTRV9UQUdfU1lNTElO
Sz8gd2lsbCBJT19SRVBBUlNFX1RBR19TWU1MSU5LIGRhdGEgYWxzbyBzdG9yZWQgaW4gRUE/ICAK
d2hhdCBpcyB5b3UgcGxhbj8gCgoKcGVhY2UgYW5kIGhhcHBpbmVzcwoKCgoKCgog

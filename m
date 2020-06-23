Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB47205BE6
	for <lists+samba-technical@lfdr.de>; Tue, 23 Jun 2020 21:38:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=eJtBiK05DkVz8vJqL3x5amOzUysXkrfKkNkWndAvdv8=; b=uC7HMIyYFi5sYI4/8Y7JJoJeor
	mOnEsFHzGqz7tQNOUkdymK1XAJYsCOxrZ82VWmZfjlUS1SmipB4wWPQI2DIC7qEYHFdgHiVzsgla3
	b0Ei9Pz0luCdxUeVCYSWHsB827OoTML/IeQ7dHCtaZQxjrEGbs0Sfmy7WKo/SkCnslZJLzuJvKONb
	ITvMgocraN5g2wEV6lxmSUII+FVlzUwdwVw6nF/50zovuJspPqhM6cgWiYttioVMYArMxk92l4IoE
	gBzl/3OVpV8Wz3wYK7Cr7Aj31jcDy/fNaA6FHqK97sIhPW7keK4fBO8g2Q7y/6u4Jml3KDEktyOzb
	gRUVm3Uw==;
Received: from localhost ([::1]:27368 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jnokB-0024HK-RU; Tue, 23 Jun 2020 19:38:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41768) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jnok5-0024HD-S6
 for samba-technical@lists.samba.org; Tue, 23 Jun 2020 19:38:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=o5iJJXc8RlYOjvsldz4Zef+AYnJWygRv9Cd83AZrJDs=; b=BNIrbC8il5zxmJmQkgXeO2lSc7
 r7M7PxJpB4T0hJrHefysfHi6TeWg1rf6uDBw182J5D1uVp7n0wy0zkkcWG5DSgW2cXN4z93O/0z3O
 n/I32QYty6MIM0NoyDIXJOhYesVzxCHEsRu2aErBOynd6LSePO6kN1/ZeO+ruYTns1z2J7cOa48XX
 My/nTF6P8+c3pnM46aPNeUNfsA0RDGAMkIdgBl4AKHrxJcnRq6O2RwXkSA4MsrALh1g9q8Z40VC5p
 zfxI0tfkFX81fdv4w6sjRp5ryaAenSAuocmNwrtv7opgg2qMuA1c6hnE9746ulh/5r0/xXsa7EYh0
 0Wy/tzEKGxqCpedaooDsq8FMV1ODEZ0+wKehIrkzhMDp+B/75uGclDfSh8FyCAzoHIjd7I2duOzm+
 Wy6Mg1S6ps4GcO0FiA0GNxGbmFqSDqIxYcx/n3YpwBdcNkdNggOPSuWIhM8RnXIEgkbEZjBwHo6z3
 XMw62PGIJX7o4hG6QK5xv4gg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jnok2-0006qi-4F
 for samba-technical@lists.samba.org; Tue, 23 Jun 2020 19:37:58 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1jnok1-00G9fv-Tt
 for samba-technical@lists.samba.org; Tue, 23 Jun 2020 19:37:57 +0000
MIME-Version: 1.0
Subject: Re: [PR PATCH] [Closed]: idmap_rid: default group always set to
 "Domain Users"
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-159@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-159@samba.org>
Date: Tue, 23 Jun 2020 19:37:57 +0000
Message-Id: <E1jnok1-00G9fv-Tt@hr3.samba.org>
Content-Type: text/plain; charset="utf-8"
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
From: Github bot account via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: github@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

VGhlcmUncyBhIGNsb3NlZCBwdWxsIHJlcXVlc3Qgb24gdGhlIFNhbWJhIFNhbWJhIEdpdGh1YiBy
ZXBvc2l0b3J5CgppZG1hcF9yaWQ6IGRlZmF1bHQgZ3JvdXAgYWx3YXlzIHNldCB0byAiRG9tYWlu
IFVzZXJzIgpodHRwczovL2dpdGh1Yi5jb20vc2FtYmEtdGVhbS9zYW1iYS9wdWxsLzE1OQpEZXNj
cmlwdGlvbjogaHR0cHM6Ly9idWd6aWxsYS5zYW1iYS5vcmcvc2hvd19idWcuY2dpP2lkPTEzMzcx
DQoNCkkgZG9uJ3Qga25vdyB3aGV0aGVyIEkndmUgdGFrZW4gdGhlIHJpZ2h0IGFwcHJvYWNoIHRv
IGZpeGluZyB0aGlzLCBidXQgZXNzZW50aWFsbHkgdGhpcyBmb3J3YXJkIHBvcnRzIHNvbWUgb2Yg
dGhlIGNvZGUgcmVtb3ZlZCBpbiBbdGhpcyBjb21taXRdKGh0dHBzOi8vZ2l0aHViLmNvbS9zYW1i
YS10ZWFtL3NhbWJhL2NvbW1pdC8yNDFjODFiMjc2MzM5MjQzOTA0MzI2MWNmMTc5Y2QyYzg3OTNm
YWVkKSB3aGljaCBicm9rZSBwcmltYXJ5IGdyb3VwcyBmb3IgdGhlIHJpZCBiYWNrZW5kIChnZWNv
cyB3YXMgYnJva2VuIGFsc28pLgo=

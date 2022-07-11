Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9B756FEB2
	for <lists+samba-technical@lfdr.de>; Mon, 11 Jul 2022 12:18:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=JojAVNYGbEm/LPDgMA3m4vdjBlG7jTzzi8z6IjoK/II=; b=Fo6y3zr18IEaVExf7N6/t5mETz
	oZX+mfVxuaPwxsOkF9dqJ6erX4JoyvHLJiiJPwL9vleJ332wmL6vPbCJCe6LtNOR7L3wY72WSR9E3
	QNZxd9nNeCFEx3dIi4iz3EuS1fZH8nvglkUp1rhr2e5y0M+H/k1CHq0edyH+x2wILCofHdiMlZ9sA
	klpJNF89T/+aKni6drtnbvfF0hxr08M2u9oNTxBuG9eiXWjzoSBtU/gYpsa1195KRSl6B+FElGsDx
	Fd/7vIevK8WVDGpoVa/XbXC3Y8pMtHljcqNw83NyB3zPyUhr6/Z+2C7z6IcPNbHzb+X8u2Ga52wTd
	e0YGKoJg==;
Received: from ip6-localhost ([::1]:19038 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oAqTh-00GzyN-P5; Mon, 11 Jul 2022 10:17:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19678) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oAqTc-00GzyE-Ni
 for samba-technical@lists.samba.org; Mon, 11 Jul 2022 10:17:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=mA12lpKgtavTlC9InSU81oksKwHArgnRSQQk3Q1h3Rs=; b=nZhhgZmtqFwV/d/KGXGVNudUK/
 qvH8yPSILeuYpXcXwS08VccA+mJnzobOIR3bpo8RWmwjk155bWbrhMkw7e8Te1/zPGIrqXzUy4BUl
 OSmD4CfbbIgCcBjHzJE0EFh8JjNgHYYFPjyrd2VBaGBRgrca6VpZ0XAOYvaQUfM+pEnrruzMhZQ7y
 AcNZxzMPlYWKGNuBYmDoe4ANYVlArsDeqEegBjVBt8BEG3x++Tv3lDFzCXk5pgUrFAnp08lN5uLd+
 CSmFy11CPwgMuwUVp5EuIUeF/3ZGPYFeBW1kuEBEIDaOqu9Qkse+x6ljyBB4tH+lriHMRaLdxrtLP
 2fWt/UEN3SEeiLMRRNPFOBr0Np9U1GfrYf/M2JjrZjYNDNWS8sMDtv1B05jZZ+lOFpIdD7c6YQPbB
 eVbgizLUjKV8J0riCcVx3T7Ew2iGReY8jUF7gihiLC1O0GiX4zXTnnlgboxSbc9zHBwEC/HYIK5Hu
 R1mHb5V+4l2Cv+16aq3ysjGg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oAqTT-0049L0-QN
 for samba-technical@lists.samba.org; Mon, 11 Jul 2022 10:17:07 +0000
Message-ID: <c11c0282-b41b-f3e7-92c5-7171c9f13d5f@samba.org>
Date: Mon, 11 Jul 2022 12:17:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.17] Samba 4.17.0rc1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.17.0rc1 is scheduled for Thursday, July 28 2022.


https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.17
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Teamhttps://samba.org  
SerNet Samba Teamhttps://sernet.de

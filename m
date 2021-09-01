Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1F63FD73D
	for <lists+samba-technical@lfdr.de>; Wed,  1 Sep 2021 11:53:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=wfdVA/RJjR/xzbyfj+Tso4Iw7xEvGD3rCX0cJQy3sMk=; b=kTedm7EgErVLNPqhYfPfn6SB2o
	/8kC0CFBieROXecBxrOvez5JXia5RtNjV/4VFc+S9eUq6tBVECNs0bhuc4XctJhFvBWWSYZkZdMy9
	FijdEV6C5xtPdzowYKQs6FasJlEWKyRdZfxj4pK1+A/3eRUwsER8rkpBT2pEZuy8E7dwlkL2tUi5F
	EPS0tGgHU6S2raHna/s8tkysTASNOcBK4YzEH2/ssM75F0VxVuyjfvO+qsAL8y10BGjFo7Y+TSf28
	W2ZthL8jh5uQxX0S+q3q25VNwbkePccUosFIlF1gZyPbSzxlvev6h5zU8FsAP7iL4SOPA59T5/5NQ
	ceW5201w==;
Received: from ip6-localhost ([::1]:45576 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mLMvv-00COES-I3; Wed, 01 Sep 2021 09:53:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16276) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mLMvn-00COEJ-TB
 for samba-technical@lists.samba.org; Wed, 01 Sep 2021 09:53:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=wfdVA/RJjR/xzbyfj+Tso4Iw7xEvGD3rCX0cJQy3sMk=; b=w04VpTxt6NBqu+sw4zmXA0aF1F
 MdMML703+CagtVTHfD+y4Cd+i/3iZq3GRvKCxoT3/Qy2rYVKpESOivmq2Zzy8GM3sll3zTZe1qwb2
 RrSvOu+qdLJ+xsWqJtGuiqmYCZdiLjBzCS6x2CoV5Wy0tJYhkSBCs1Bk5mK+04eEwAjGN2W6bXg//
 gct+cPTjvEZXGIBWQ9bWt5hpbDK8TrDCf2ZBm3PJzKOjliYuGl8j9nBvswwhhyLUx2L1GGaNlP2vN
 3jVMELCu4jyD9pE20ZY/mxlzyDn8r/ON2Q3d4FGvEVOn2upH/KlUAS8uv9BY/IiLPtiH0jfSCPFNu
 L4QG2kbrefgNMyhf51mqVo1S5M843d8Z54y43NZMjKS+DK+V8kkFlNnahtySrYmjMG9SGo6vCTHox
 q+rvHGltbxws+NDYaj73GEE3rxW9asV5Rc4+fNpFsjNWNXO2I25Ssi9S7za0cucMoBbOs8/ETjTZi
 +6jSfRsh3WaGX7+Kzg8zFukW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mLMvn-004315-AX
 for samba-technical@lists.samba.org; Wed, 01 Sep 2021 09:53:19 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.15] Samba 4.15.0 delayed
Message-ID: <fffaffbf-f8aa-428b-6d48-91c7b53f0f37@samba.org>
Date: Wed, 1 Sep 2021 11:53:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

unfortunately, two (potential) showstopper popped up this week, so Samba 
4.15.0 had to be delayed.

It's now scheduled for Wednesday, September 8, but there is still one 
regression under discussion (bug #14803).

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.15
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger                  https://samba.org/~kseeger/ 

Release Manager Samba Team      https://samba.org 

Team Lead Samba SerNet          https://sernet.de


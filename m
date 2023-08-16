Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6F477E745
	for <lists+samba-technical@lfdr.de>; Wed, 16 Aug 2023 19:09:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=neLdaKy2eSRksQAKyhMt8+UX+lvTIcEkHO7DBzxA/nM=; b=QZZsVwhjDU3pfyFTSVgAljWf2+
	0HJqyXkzJFZU8XVmq1deptlKeCs0kcoq76EiPyTLOwZXUNYE0ww7S0uG/gjeN/TTv+jh6pFDmistj
	CjPTem4daTsmAclwZsUY+QMYmwm4zc85F63NUE0ARUX9jMBNgHfO2bHto0rgr68W3Ks303MccE3vZ
	n3Y1w27iKWSneAY3zJZ2VuR8NIflFcV83l+Nls1rlh9KqcS0NPW4Il0d7kPDWP8my0ivvfyaEI/cW
	iHlJkIStQMoUFzXKlTON7XAIWplI5zy/aVRg4rANc4Vgx5hCu32IlJ24EUtxwRKeve1MTjecvbRDQ
	Wya3l9pA==;
Received: from ip6-localhost ([::1]:64440 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qWK1I-00CaIs-9s; Wed, 16 Aug 2023 17:09:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34942) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qWK1B-00CaIj-IT
 for samba-technical@lists.samba.org; Wed, 16 Aug 2023 17:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=neLdaKy2eSRksQAKyhMt8+UX+lvTIcEkHO7DBzxA/nM=; b=Bd7E1kX3bCRv7lxF3eY4vHGODL
 2kE+b+OJjuSAuXj3D0WHYPe4YQo0ZLLAIM3zemwVmlYv+nAIOrLiKOG0n33pBuqEUhyHbYrtxyn8Z
 XPUkC0awVhvIMD6L0OSCHPh4DAvcDTHPsJLUCoVZ8ApcEeMdpgzTX3LEJDcN9Xf57A8Cp5huWO0UD
 QMiC6S61HbbpLVXZCBuhUj5qic/DOkG/VdDCLJQTq/+OvIZpzVoaZ08sebcYrK0u7twjbEFaUd1lb
 XLMyitTE7JG0KUtEFZQnd84PWH4Thudh5Fh/pw1LjxL/ytfOTRFdr9CmY5lOKrj99E+vr5LKKNMIC
 FN2ywo+O25zBq40lH36xwu56mPXvgq0bLROfisnG/Yuj3IW0MUbr9Nwuvz80TpZfCvsNVZxkuiPcW
 ltuaZTH739cKUrwvjX303/iArScNyfqaIo4C/9lzC7bihFxKXsfnX9d7XURqf7EqgdUM8+g6ixWut
 8BIPK8dg7ATHl6TtcGqHhFd6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qWK1B-008QL3-03 for samba-technical@lists.samba.org;
 Wed, 16 Aug 2023 17:09:13 +0000
Message-ID: <f6d85f75-1563-254b-94f1-c9cd113b5b19@samba.org>
Date: Wed, 16 Aug 2023 19:09:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.18] Samba 4.18.6
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.18.6 is scheduled for Wednesday, September 27 2023.


https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.18
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de



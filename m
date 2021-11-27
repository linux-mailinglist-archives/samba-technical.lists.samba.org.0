Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F3445FC3B
	for <lists+samba-technical@lfdr.de>; Sat, 27 Nov 2021 03:58:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=LY0wZpe6kavnmy0IGOJOe/yJFp8QeqRdAYelQ9x3VS0=; b=lbwexDFtKW1FiO7R0PlIwLf2V/
	tVncuSqNafaFuamE5lJ8Dq8hRyabso/VNItO77pqjEqP7ONtiTqwNlLbZJd+xGAxNGMclDwfIThks
	U6h7EVuYjrYE+dYrXgWEvRjoZerYcMKFWWDUHt96uVQZBaSWvkIQ44MlipMfFa6H4EKiq0BpFybFG
	wILU8NULvU7tvVjEqfxVoDrC/kn43kexoxggTYAs3UjIM1c3w4C1Vg1K3/NyPRYJRV58LraRRw3Ye
	kaXSgO60r0CkEADMaQSfNC0qjKz5HwUVEhyHOP1lTzxR33VOd8DyE9ABkOqduPx7ujNnKUzQ9l9Tc
	NMSh0Z8Q==;
Received: from ip6-localhost ([::1]:27926 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mqntm-0056GL-PO; Sat, 27 Nov 2021 02:57:10 +0000
Received: from transit01.runbox.com ([91.220.196.211]:55698) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mqntg-0056GC-UP
 for samba-technical@lists.samba.org; Sat, 27 Nov 2021 02:57:08 +0000
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
 by transit01.runbox.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <post@jbechtel.de>) id 1mqmhh-002rkT-7b
 for samba-technical@lists.samba.org; Sat, 27 Nov 2021 02:40:37 +0100
Received: from [10.9.9.73] (helo=submission02.runbox)
 by mailtransmit02.runbox with esmtp (Exim 4.86_2)
 (envelope-from <post@jbechtel.de>) id 1mqmhf-0004b1-7u
 for samba-technical@lists.samba.org; Sat, 27 Nov 2021 02:40:35 +0100
Received: by submission02.runbox with esmtpsa [Authenticated ID (535840)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1mqmhM-0003Fx-Ng
 for samba-technical@lists.samba.org; Sat, 27 Nov 2021 02:40:16 +0100
Date: Sat, 27 Nov 2021 02:30:24 +0100
To: samba-technical@lists.samba.org
Subject: Minor bug in win32 test program
Message-ID: <20211127023024.287b0673@mmluhan>
X-Mailer: Claws Mail ~3.16
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: Jonas Bechtel via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jonas Bechtel <post@jbechtel.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



Hi there,

I'm new here, and I just wanted to tell you about a bug.

That is in testprogs/win32/npecho/npecho_client2.c, lines 92 and 98: The message leads to a segv. It must be %d and not %s for (first and) second argument in printf statement. Correct form: 

printf("message mode returned %d bytes should be %d\n"


Hope this helped.

Best Regards
 Jonas (jbechtel)







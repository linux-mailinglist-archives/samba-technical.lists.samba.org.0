Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 922527D7DF2
	for <lists+samba-technical@lfdr.de>; Thu, 26 Oct 2023 09:59:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=maX2ZABglP/HeqAltvHjCEJ6D5gtBEV0hoW/ke27fA8=; b=i52jHqiWy3PvoyrqFMXMbdoGZQ
	fs+fR1o0hoBKIucA1Ae6LZnXZI5nlQ8XejBdJGZcUjeCViXuYK7InwtZ8q5MoAdWm+wiEc8K7aY8k
	EaX4qpqIfN30Ji8l/vGyv2mtev4sm8AItaiqgzNlG4ESLMAxR2YieL9oUN7P1AI7QzrwjMjJ4zYNI
	LGX3Ot6QWjxjZbXf3U3BOLQp8fQmk3YQ+DbsqiVI4KeXDMV3u1tylcu7U9iOn7Kg4Jza3pPU3+ixM
	xLwiIu4yLu/54GJ5XWcyUP4vaq3UkYks6esIS0IV/s+unNa0LMvtDYfZYulNOoQwKwUpYmxkfhVrD
	Mpc79qPA==;
Received: from ip6-localhost ([::1]:40614 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qvvGk-002brz-FM; Thu, 26 Oct 2023 07:59:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46572) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qvvGb-002bro-Qk
 for samba-technical@lists.samba.org; Thu, 26 Oct 2023 07:59:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=maX2ZABglP/HeqAltvHjCEJ6D5gtBEV0hoW/ke27fA8=; b=aN/4J7BToOJ2i9gEdqK7IJOQV1
 /5j4cko8/cZAuguoyaHpYXHkF7fnoz2snbsAnj8Y4OndlplLieUWX0ezsbkqEAyA1dXfbxYNyWTqM
 7UapnluFbbmsxD/FeIt1p6npHCBtl4Nhzoe11byV8acThaERF/rBTbRhFzSsjSNvRlazEnG558gbi
 5JDy5dTrhuEGdydmdK+eEpq5lDP9cVhaSUz2O6kQzahF90hZW21zseFZg7lwakeCII131I12dqent
 jcpDZNpWYTB6BTFdFNJu2dOl9NHnCA3WEuTiaDGHYOrwZB4bOGX55daRYkhirOzJ5EyggTLhaOn0J
 3GkncWVHk+dcIQn5sbg0V5Utq8ned22Ab9WEdJjC+kBKzwkzrGpG102qKrxoiMWxX2Mci2bTw7CPX
 X9BELmiJw9FHUONXqQTauvle6kalfhkYt0C10PrqzZzZGyX51RVeSbA/Jdo4f2qlyrUl1mZl4Wkh5
 nJR1yltJ2Hvmk7PB6/enzBGy;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qvvGb-002hKt-01 for samba-technical@lists.samba.org;
 Thu, 26 Oct 2023 07:58:57 +0000
To: samba-technical@lists.samba.org
Subject: Leak Sanitizer in Samba
Date: Thu, 26 Oct 2023 09:58:56 +0200
Message-ID: <2330326.ElGaqSPkdT@magrathea>
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

you might already know AddressSanitizer. AddressSanitizer also has a 
LeakSanitizer built it, however it is disabled in Samba. I'm trying to get it 
working as we have memory leaks probably in Winbind and rpcd-lsa. So the last 
days I fixed issues which prevented to actually run 'make testenv'. In case 
you want to help fixing memory leaks you can use this branch:

https://git.samba.org/?p=asn/samba.git;a=shortlog;h=refs/heads/asn-lsan

I'm currently stuck with memcache and smbpasswd.

The AD DC testenv already starts. It finds tfork leaks on shutdown. It would 
be great if someone could fix those ...


Best regards


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




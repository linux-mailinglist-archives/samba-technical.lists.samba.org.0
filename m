Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A53B3B2B26B
	for <lists+samba-technical@lfdr.de>; Mon, 18 Aug 2025 22:31:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ANUkFkKuMUsNowCTgcYzlhuCPV23pdRt50KVF2MzwqM=; b=sm82LgSK6zRYfqp8UkSYFxB0Yv
	yIQV1haJKhk5kJvSLc542HiNkxlDSiBtnBO5lAastOhq10xWfOjI6hAECNOWzzlg2Oe0so6QLlXdr
	3oOXW/Hs30AHlAHGbapupWo2jMVT81Y+waqHyHHGlNWWmpa3BdqjA7N1htNottAm8YrTmES5QaELR
	0MOmg0CrGIwqZ9fhnZk6yYqqXayzzMMTDMytse6blg5nKCvZKEH+U1vj+BiNMXMlvBYPEv96hRqPx
	NPFA9WxUh5TSFJq35BPKUNUJkZ9Pkh6O3b/Bg0PLxySYlSXKhacM2LRl+gkLa4VoSECWHm7kXAhrT
	YAOhEr4g==;
Received: from ip6-localhost ([::1]:56008 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uo6VW-00FGor-2Y; Mon, 18 Aug 2025 20:31:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55108) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uo6VS-00FGok-IJ
 for samba-technical@lists.samba.org; Mon, 18 Aug 2025 20:31:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=ANUkFkKuMUsNowCTgcYzlhuCPV23pdRt50KVF2MzwqM=; b=U7Gomt6LnJxAuAN+sm9hu3+vE/
 jLWX3ZqPZSoQavuQCPDu2HJyBVNnsae4k7SxYKHNmk+yHXtHy8oWRm8OiJfF0MK5TLIaVtUU7tIBv
 ez77XLS3DQ3jZbaTbblf/bYDTknfm3xyq1bEWxE6G5tH48pJB7cL5WDNIKEaaK2V42hvLkMgjR5A0
 OCD0rjG6ORVJGcJp2n+HxK0AroeTg/3IcSc7FHbqzTj/JDaV3HRyR4kzaWDkztrtk9OU7ie3IsgL/
 1y5aHftn+pJCH7kYoTgBhzox6C0oNlRb5Gjg5TGxfmAfRjrD4MRfYGJXAc6oO9pbVZ6sesJXe/Abe
 Ns1IbvXnAL8WtAWCRYtOKhV0XulP5UnVSwH6cPESozJ5RvfO6AMqgC+j7loi8txxMPORU2wD5ZWfd
 EntZqM7Xz6bFTesf+5qhJpROVkNgFUGZ2X0SZWMIYximXlK46DlaeOfW333+YqwhZ/MaN/YKb3fuA
 XnyL/Yiu5rbLdFgYnajyyPfn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uo6VR-003Wor-26; Mon, 18 Aug 2025 20:31:01 +0000
Message-ID: <05881546-b505-4c0e-8d95-ee1c24f01fc8@samba.org>
Date: Mon, 18 Aug 2025 22:31:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
Subject: Common smbdirect debugging/loggin/tracing...
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Tom Talpey <tom@talpey.com>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

after the move to common smbdirect structures I'm wondering
what I have to keep related to the debug counters on the
client side, e.g.

         /* for debug purposes */
         unsigned int count_get_receive_buffer;
         unsigned int count_put_receive_buffer;
         unsigned int count_reassembly_queue;
         unsigned int count_enqueue_reassembly_queue;
         unsigned int count_dequeue_reassembly_queue;
         unsigned int count_send_empty;

And the their use (and more) in cifs_debug_data_proc_show().

I'd suggest to remove this stuff and later add some tracepoints
instead or if really needed some stuff under smbdirect_socket.statistics.

Also do we need to keep the log_rdma() based message in the client
and the ksmbd_debug(RDMA) messages on the server as is?
I guess we want some basic logging for the connect/disconnect handling
and the rest should be tracepoints...

Is something like logging module parameters and output
written in stone or can this be changed to be more useful
and in common between kernel client, kernel server and later
userspace?

metze


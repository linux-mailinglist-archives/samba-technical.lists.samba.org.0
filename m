Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 288D2111DC
	for <lists+samba-technical@lfdr.de>; Thu,  2 May 2019 05:28:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=ywsiI2qdy61YSXmNdc7jvHBQmoE+LtqvfFafcUqFW9o=; b=uMXPLXKSfkiKiONJXzR3K/gr83
	f54ZMjl0bLhQHF5GDStYMfjiwIkzEnN3EHxEgBQNKw7qPonzw4MSgnIcZFItv00gbxyvWzb5WyOg6
	hWTBeKMifzpZaxRZx4cVWZq67ht0qAyPOvd+diNYI3Gex4TsiVBLIZ7G2K+Ome0Numpvttuf6da90
	/Tr0btgq/LbKQYco7y4suGBEbc/eYifr+wHj4XGsZ51rcDZfWs5wiM0DImpC/k1C4EMUJ2hLFAlXB
	dYQwMxJ97Bxw5QjcIHGwC1AP4LebxATDsEMDazpQeXYqUdAV8Z90BhoGY0JVYNxMUKjTbOBrhkuj9
	2nnlCepg==;
Received: from localhost ([::1]:57878 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hM2NJ-001uzi-Jj; Thu, 02 May 2019 03:27:09 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:39696) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim) id 1hM2NF-001uzY-1l
 for samba-technical@lists.samba.org; Thu, 02 May 2019 03:27:08 +0000
Received: from [IPv6:2404:130:0:1000:2225:64ff:fe75:8a7f] (unknown
 [IPv6:2404:130:0:1000:2225:64ff:fe75:8a7f])
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id B8B70811ED
 for <samba-technical@lists.samba.org>; Thu,  2 May 2019 15:26:53 +1200 (NZST)
To: Samba Technical <samba-technical@lists.samba.org>
Subject: dns_hub lingers
Openpgp: preference=signencrypt
Message-ID: <b49cf3d8-11a8-5972-9ccd-ef9c62591179@catalyst.net.nz>
Date: Thu, 2 May 2019 15:26:52 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-NZ
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I find that our newest and simplest dns server still has a few
surprises.

After a number of `make test`s, I end up with several dns_hub.py
processes hanging around (according to `ps faux |grep dns_hub`).

Looking inside, I see:

(gdb) py-bt
Traceback (most recent call first):
  <built-in method acquire of _thread.lock object at remote 0x7f32fb272e18>
  File "/usr/lib/python3.6/threading.py", line 1072, in
_wait_for_tstate_lock
    elif lock.acquire(block, timeout):
  File "/usr/lib/python3.6/threading.py", line 1056, in join
    self._wait_for_tstate_lock()
  File "/usr/lib/python3.6/threading.py", line 1294, in _shutdown
    t.join()

I can look into this eventually if no dns_hub experts leap forward.
Garming thinks it has something to do with hitting control-C.

Douglas


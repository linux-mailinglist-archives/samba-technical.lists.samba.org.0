Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B153D38835B
	for <lists+samba-technical@lfdr.de>; Wed, 19 May 2021 01:55:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=y6PVmVngEG/6xYB6axDoUvcKL9cayxwR9sRElmSkvSk=; b=DfztNfS/u1B1TB0l4zH3o4DoqB
	drUGEkFQvkfomilx2d+zdGjxyZuQ3Y2F/28MSRFs78+mqqSg7JgUfEr4mWqIEfibkGsWhCcIaOTM2
	nKY/Sb0URchs+68b7mPplAjHtYOuPFoWEokBBNilZr4vWQ8Z+0mU76jT8Vs2Wal8XXFeMB1Eflb+k
	iFBWNRN6hluvZGi8nZtLSTidxxUEK6tUbZH/AvC1YIFOS9LXcRWiX/Yp3w7vTL2+xGa3MGQ1JZetl
	21USRQydzksX5WwxwRC2qilUL/roUYxgm6lfh5aX4s6/lPQwkAdYJVsBoS14Qefgb0v+IJSueftaH
	/Gx39TWQ==;
Received: from ip6-localhost ([::1]:54108 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lj9Xl-001YRf-4M; Tue, 18 May 2021 23:54:33 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:60918) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lj9Xd-001YRT-Px
 for samba-technical@lists.samba.org; Tue, 18 May 2021 23:54:29 +0000
Received: from [IPv6:2404:130:0:1000:6c49:a6d2:a53d:c1df] (unknown
 [IPv6:2404:130:0:1000:6c49:a6d2:a53d:c1df])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 2AF328076D; 
 Wed, 19 May 2021 11:54:01 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1621382041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y6PVmVngEG/6xYB6axDoUvcKL9cayxwR9sRElmSkvSk=;
 b=fSW3KxksDIfBIJ7xBAcTEOIZcWg7k8qiQALAPxgdKB3OgfoxfuvhhOaG+66dd+FPALP6JF
 O1iODpxz1t3rcyBBYYC/r0N5XByyZRUlQKWPg9hofpvDW445eMF9QxRIdUDowWyhXb126i
 qy3V9rnt16atQw7PxnhKNs0c0h/ky5lJn1c7uBK71SeNcMypr9bJGsEwjNyRTJlLtsywyI
 EmJXFPfxD7PbEg53juky6IcH7FRAWLw6CyArxMj+jZHwHx8J73Je9cMpO3Eyyp3BhT6M7R
 I5/wydNUFgOt7nOPlq05uihBvML6D/0OB5H4TjfLqQBS0htJl8AUpZPRgyPrgw==
Subject: Re: Offline logon flapping in autobuild?
To: Andrew Bartlett <abartlet@samba.org>, Andreas Schneider <asn@samba.org>,
 samba-technical@lists.samba.org
References: <516bd798642997a15016d81f9ae6e17e9250f677.camel@samba.org>
 <2444523.AYHQVFttfo@magrathea>
 <530ded817f79e3cec0561c0bc59868ab193ef1c0.camel@samba.org>
 <4972011.ALVdVshByh@magrathea>
 <482fc14dfd6b782ec12643f88d4c65d9f266619c.camel@samba.org>
Message-ID: <4cc918ff-1c0b-b35b-163a-ef85e97df7cd@catalyst.net.nz>
Date: Wed, 19 May 2021 11:54:00 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <482fc14dfd6b782ec12643f88d4c65d9f266619c.camel@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-NZ
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.10 / 15.00]; ARC_NA(0.00)[];
 MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[]
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> 
> I think my username is too long (I've had this before), and your new
> test environment has a longer name, and so we are hitting the maximum
> path length.  This is why jra, bless his short username, gets to push
> all day without issue.
> 
> Just a hunch, no evidence right now, but we have had things like this
> before hitting the maximum length of a path to a unix domain socket.
> 

I have struck the same issue, presumably because "dbagnall" is just as 
long as "abartlet".

Douglas


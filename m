Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C8A1006AA
	for <lists+samba-technical@lfdr.de>; Mon, 18 Nov 2019 14:39:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=ZDIyRxmJm52XcLMig581iJB4Cob6f5ZZojDW7RH05GQ=; b=DZFcmidMax24nQPNh8zTgD0unZ
	z7CFxickKxvbjBsFBODO9Gj+L3dsaeVYj1ioJ4+/NECJNnfP7JCaPPEJJ0O9XYG8yOPBYfcpqkSu6
	kPY1BpbLAEjGYYLhx/yxYe9sgChRISwQ8XbeWbQ86CwbglmnARDx5QzwX1jueMLnjExT5uX2Qh9a4
	do+7iVFHFkgjCDUBZ8gpJvA5rlYRyFlIRrDQ+49vHE7SpWr3cspeS20JSoXuqg9RYHcwKTVR5lnJA
	Yx02i/59vOcjcqNmjmVrB/QVUUV3fW1SiFaJyKqq/ljkekjmhDOWkSI23QfdObUEGaEoXh4RLjx/Z
	SLupGOcw==;
Received: from localhost ([::1]:47818 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iWhEM-001YVG-Kx; Mon, 18 Nov 2019 13:38:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62358) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iWhEH-001YV9-VN
 for samba-technical@lists.samba.org; Mon, 18 Nov 2019 13:38:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=ZDIyRxmJm52XcLMig581iJB4Cob6f5ZZojDW7RH05GQ=; b=ojb2gQfWQdJyZfyILxuD8rbFIT
 Ov168KhkRA0E9uX4EvQzYN4l2Drtj5eAxLZRcVgg0GNmHaEWSeHbUgP0NX6jYe32JDyGYgoNywA11
 tXsB7gmndQdbq/B5zfPf3UvjNyrC7j53RSz2kaiTNY+UmMqX2oD6ZZrFsrbV08gNl2XavgZ6b49dO
 t1Szqsu04gLzFlZc1s7hGjoPofIFSaouOytiY4uk6x08g4X08KFg50l9BiE7izYtMLBR73n2hw9bP
 16EaQS+ccctHgyxlP50eEK/UMlywVSMkK6cV6NPxje/i5DvPsz5YCxSwI9ZhnZFVTUmgZBuT/N5iY
 ONf0UKeh3LIPq1RK/6sg0l886m8TLFHyuuXvtRJ+IE0TDYsHrhr8oPYI+peTbl7H8KLrSzoyxVeh0
 qjxj3ydnvVIZRsvBZE451/bpCqdWWOrKTsVSlDwbac/39fVy0/w8dEwJLwxq5AcYGbeNY0l+Uq4As
 ridtkx92wHRUG1ExoWfUqiC1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iWhEG-0001oU-RC; Mon, 18 Nov 2019 13:38:08 +0000
To: samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>, Stefan Metzmacher <metze@samba.org>
Subject: library versioning
Message-ID: <4008ac5d-ec0c-c184-f5c9-731987718f8a@samba.org>
Date: Mon, 18 Nov 2019 15:38:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

(taking the thread of https://bugzilla.samba.org/show_bug.cgi?id=13846 
to the list)

Hi,

Can someone reiterate our versioning scheme for libraries? I'm a bit 
confused because there seem to be some contradictions.

- v4-11 branch has talloc v2.2.0 and master has v2.3.0 (additions to ABI 
- 2.3.0 was released without a Samba version that uses it)
- Due to a bugfix, master goes to talloc 2.3.1 and Metze suggests that 
v4-11 should also go to 2.3.1 (and I remember that indeed this is the 
way it used to work)

Now trying to apply same logic to ldb:
- v4-11 branch has ldb v2.0.7 and master has unreleased v2.1.0 
(additions to ABI)
- In the same way, I suppose that we need to release ldb 2.1.0 and 
upgrade v4-11's ldb to 2.1.0. But in ldb, we have 2.0.6 and 2.0.7 which 
are bugfix versions off v4-11 branch - why did we publish bugfix 
versions off v4-11 instead of releasing 2.1.x and moving v4-11 to use that?

Thanks,
Uri.


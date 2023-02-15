Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF4E6973F0
	for <lists+samba-technical@lfdr.de>; Wed, 15 Feb 2023 02:53:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=aycRtM4dMyQhIIMFAqtqsH8gncvtdhvZl03oA9Fx0CA=; b=57u7nrELfMs5tzTuuZKyDc48tZ
	32NczMOG5BzI7P4rt6g8jTbJqYScwCeTqUveWeOx+A8IaXAuiQszCoi9tQQdN+CfQ0LBjca2dItzg
	4oNM/ovEPCnQmJoVcjkuR5hsqDKOwXx5Lwlul6QBMui7I2/wfS1BmnAVWMiw4XonUWfDvw+DA3K8k
	MVtrzKaB2cmpmwUFJhN+nxj0b/KDoc6di+ODdNQ4Z5KRFfFoWRJ8EPogHRrMW62Gdi7ne8TG17gLv
	EgwWD0A8VuCnc3AE1STSP1UPYtKAjFce5Hn/4t+SO1XxEFlIGB5zofJrFjGZGkHmSTHENsbWRfFl/
	mHvdPOFA==;
Received: from ip6-localhost ([::1]:49256 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pS6yk-00CDvM-2x; Wed, 15 Feb 2023 01:53:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27024) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pS6ye-00CDvD-Nv
 for samba-technical@lists.samba.org; Wed, 15 Feb 2023 01:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=aycRtM4dMyQhIIMFAqtqsH8gncvtdhvZl03oA9Fx0CA=; b=g7gZ/OuIaMwjLb5PNqf97sUNvf
 4wDpwmeTg9i/ilcZZnJv56Hicovb74GijSXQc1UJyUayeilU2RqvBWF2BrqQQagk6SOkWBthFc6W3
 MTVE92gAfpvLr8jq2J+5YkcHTCbKoiTYcFg1ioQgy64UlDgcVBPLl93Rk0eFPMVg3qxBc2jIOZg5W
 fM8IAuw72I7Yb8HK6fZedyIAmdOkDLQCGcmyxXFpaXf6uVDKMzkMHS30KK/d2Lqt3PcaL4yTtKyiE
 PJVZGGYrebVL75hbAQgaqlyEzCr3WfwsLqZqQOSZ2g8oagJV17cqT8FSXbKB/63ZQEGzh/wYOgBGG
 7Do9HGWUTZJDMtLZnOHJHARb2p2gq+kBSroJpQAJ7OyT8TI6Or/mCOXA6GQkf5AwY5GrLlDk5mFK0
 +13YivUhvMPa8UUA3Oa14pnFkivWtN8n7ksb56ebmlOr1KgxGarjm1l3EOGQ5DniMOVw4V4N1cZ+N
 ZJLOxJzRHZIHUIIFtdMFmuhD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pS6yY-00Dkmn-Sp; Wed, 15 Feb 2023 01:52:51 +0000
Date: Tue, 14 Feb 2023 17:52:48 -0800
To: Andreas Schneider <asn@samba.org>
Subject: Re: samba-tool domain backup with lmdb on btrfs fails
Message-ID: <Y+w68GDJqgXRTnKU@jeremy-acer>
References: <1944992.usQuhbGJ8B@magrathea> <2145228.Mh6RI2rZIc@magrathea>
 <ca21f1f473a1a849cdef33bf7cd14e095be090c6.camel@samba.org>
 <12155582.O9o76ZdvQC@magrathea>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <12155582.O9o76ZdvQC@magrathea>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Feb 14, 2023 at 09:13:51PM +0100, Andreas Schneider via samba-technical wrote:
>
>I think I found it:
>
>The issue is the lmdb mdb_copy command on btrfs
>
>
>
>     def offline_mdb_copy(self, path):
>+        mdb_chksum = create_file_checksum(path)
>         mdb_copy(path, path + self.backup_ext)
>+        mdb_copy_chksum = create_file_checksum(path + self.backup_ext)
>+        if mdb_chksum != mdb_copy_chksum:
>+            raise CommandError("FATAL: MDB checksums don't match!")
>
>
>This triggers on btrfs and works on ext4!
>
>
>I will prepare a reproducer tomorrow.

Fantasic debugging Andreas ! That narrows it down perfectly.


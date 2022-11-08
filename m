Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DD5621B2F
	for <lists+samba-technical@lfdr.de>; Tue,  8 Nov 2022 18:52:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=4HCzvnYYJ4FTBcGnxPniMTg08AG209PkLi4tYI8BtcA=; b=hs2wNfkPJ+/CBcW4/tw8RSiiww
	Ox71M005udvOiSpUpTE4PZh3GMFIUFYINq1xePpwkoIsfp/TWBEcS5gW6i+G9m7kzpSJxYrr7Rkb5
	4pJCQ+F4T3vYX4uD5o4wg0xb9Mvp8Bp4298IVt/synOb+3fA6DfiBBziDfyppAMBK942aaEMK9UdJ
	CwUjXXOsU96CTkrGTSh3vXs7oU6Du90rTqsWYbIhfbDcb6w57ByT8iu5IsmyugttV9ujvo1b6LejG
	ldeYXAoJsI5daNxofMMHKhfB119ERWvnxsuPCI28RAr9O0PQqascVr25HjhCeXtpFSY1unYKAe572
	z0W8LIrA==;
Received: from ip6-localhost ([::1]:26628 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1osSlS-00Baxt-H9; Tue, 08 Nov 2022 17:51:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62656) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1osSlL-00Baxk-Dn
 for samba-technical@lists.samba.org; Tue, 08 Nov 2022 17:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=4HCzvnYYJ4FTBcGnxPniMTg08AG209PkLi4tYI8BtcA=; b=YEFaKWh2f1V1luwzh1kJXlR2jY
 QCWJnz84MSfqocRUZJfayG8UYfLBmxdsMULb/0bjX5O3re21Jp0KebMC36b4E+2rrsnDb4yvbOlIR
 WD6Qj3qB2lC1q+lD7pm2zReLVjr5a4f1PxP9VSpp+JPdkLWJYdyvJThrezbIYRifTVJkU0vY6X+Kv
 6yF+ca52bOEKK/gU+lLS5nrZqZELXAjQtCW2MX/ZymrHCPXl93zlOV6ViqDw8qz8eUz/UDxrtg5f7
 RTqBBcYKXncdc/OH3h3KYlG4vmxUZqL1QqwdTovaLIpJXDPOxjLdSxCxu+kFT6WxkfQwPPlqo6f7G
 GRMY/zE9v0vnvRVFwKvljmdwSfZUyaVliaJW7beJ+pL0FB++OwW/8K8cLvz1aU4l89369je/J8//+
 3umMblf8xSl1zQQbtsdWwy0iYeHlRr2MyPYLobxCGuImri7PCoUljDx59Gd7sqBmemaNWhkPj5xfE
 Pq9faB1GrLUBquVXh0bHH0v7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1osSlD-007jQH-Ho; Tue, 08 Nov 2022 17:51:43 +0000
Date: Tue, 8 Nov 2022 09:51:40 -0800
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: reflink support and Samba running over XFS
Message-ID: <Y2qXLNM5xvxZHuLQ@jeremy-acer>
References: <CAH2r5mtc6rHC=zfWCjmGMex0qJrYKeuAcryW95-ru0KyZsaqpA@mail.gmail.com>
 <Y2molp4pVGNO+kaw@jeremy-acer> <Y2n7lENy0jrUg7XD@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Y2n7lENy0jrUg7XD@infradead.org>
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
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Nov 07, 2022 at 10:47:48PM -0800, Christoph Hellwig wrote:
>On Mon, Nov 07, 2022 at 04:53:42PM -0800, Jeremy Allison via samba-technical wrote:
>> ret = ioctl(fsp_get_io_fd(dest_fsp), BTRFS_IOC_CLONE_RANGE, &cr_args);
>>
>> what ioctls are used for this in XFS ?
>>
>> We'd need a VFS module that implements them for XFS.
>
>That ioctl is now implemented in the Linux VFS and supported by btrfs,
>ocfs2, xfs, nfs (v4.2), cifs and overlayfs.

I'm assuming it's this:

https://man7.org/linux/man-pages/man2/ioctl_ficlonerange.2.html

Yeah ? I'll write some test code and see if I can get it
into the vfs_default code.


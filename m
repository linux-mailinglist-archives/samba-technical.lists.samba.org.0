Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B98CF89269D
	for <lists+samba-technical@lfdr.de>; Fri, 29 Mar 2024 23:08:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=BjxHKwcmF8JyqoizniMV56RBl5SZztO956z5LgVrR4A=; b=ohSz8KxxafAeeyQ1+IiFV5QRYH
	VY0v9bfolNzsVeaC9pzwm7KWUNa3JJJ5Adz3WoLrCTsWycwtUSXeOCM2kT5Strd3rzDXUyLwwBtQj
	VEvUknfFzS5X0NOXhcoIRHn4FNT1c6grtyYtV29cvpaVfhBfJEBzU2OGh2FBhM4VQ0c0laXOzZsW3
	v9arfJHTKWUh5E7EsJETlqQQQpcTF3Hs/HUirMkjHkGfrdGtBFb7GpgkuzcPe6r4QRbKfPe6XmI2S
	7uxTxh7s+R1y9YvM7sS0kn3jlujY+6NKzXyZyNaW+7z9ybV6cob9ThgwbnWDnTu4p1RHrIA7KBFga
	wJNvOV/A==;
Received: from ip6-localhost ([::1]:42522 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rqKNj-001egS-TA; Fri, 29 Mar 2024 22:07:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10396) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rqKNf-001egL-IF
 for samba-technical@lists.samba.org; Fri, 29 Mar 2024 22:07:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=BjxHKwcmF8JyqoizniMV56RBl5SZztO956z5LgVrR4A=; b=iQvHwVxXzKhN9TrgF+4ClS7USF
 TFbOaDCMYklqGbxIWPDKkTIsdvL+T0QlYfoSwKmZ7Ye8aTPFpUue+ro/UEhCTo8pRFWYlI6r5aqqE
 Lonx5ElHBpVZmmV66NmKDxLlFtKmOmQbiUGMe57LBdiTINdAX5PJXhlZcibgW9HMmM+TtK8+JlXpa
 rCrUWaR34AHnZVyLIuFq5jSBFWXzoPcYYUGeAS1m80oVMSSO3aPcf4h/Im0eV7Nm6OSxa5m7Gw6gL
 GwiAXCfyO30JHpCHPH4iZIxbaps5Vx0HH7DBqNiOtzcE6vcKGZyNT6ByvpgGsn5csU14Bh9TZUdFR
 1GWvzWlOb2BTSII+WfmvSmRhU0vNeJZzzFYBUnhGt9juez6xxriFElmuj5Mjwg9GOIWpDd2XMXdES
 hImlXxjnbEXR5W8NW6FU/FhJey3wfd+FbSo5+XxjuYk7QnjlODPoekfNyaao803JiThZ2ALmq14Ma
 h2lFNFYEN7UJgnXAMWCqH/m5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rqKNd-003efJ-2F; Fri, 29 Mar 2024 22:07:22 +0000
Date: Fri, 29 Mar 2024 15:07:18 -0700
To: Steve French <smfrench@gmail.com>
Subject: Re: [PATCH][WIP] populate superblock uuid at mount time
Message-ID: <Zgc7lrgBSmNPIUSY@jeremy-HP-Z840-Workstation>
References: <CAH2r5muYgYr=kxSkzCmNQLaF0br_QZ2s=BLPd_TnOnPmTUz_WQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAH2r5muYgYr=kxSkzCmNQLaF0br_QZ2s=BLPd_TnOnPmTUz_WQ@mail.gmail.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Mar 29, 2024 at 01:30:42AM -0500, Steve French wrote:
>In order to get the unique id for the volume (the 8 byte
>VolumeSerialNumber) we need to issue a QUERY_INFO level 59
>(FILE_ID_INFORMATION).  Today we only query the older 4 byte (not
>guaranteed to be unique serial number).   See section 2.4.21 of
>MS-FSCC.  Looks like Samba and ksmbd do not support this info level
>though - although Windows does support it.
>
>Any thoughts on ksmbd or Samba support for FILE_ID_INFORMATION query?
>
>See attached work in progress patch

2.4.21 wants a 64-bit volume ID, and a 128-bit file id.

How do you want this synthesized from a 64-bit inode ?

Can we get a standard mapping for this ?


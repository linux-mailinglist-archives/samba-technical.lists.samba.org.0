Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DA381EF5
	for <lists+samba-technical@lfdr.de>; Mon,  5 Aug 2019 16:24:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=iOmMzzZwe4IiU1GaldJC7P705ahhaXuwqEGJHfUXltM=; b=NtfX4MQQs63gqRY0zwcA8qo5Vt
	AkCHxbM/Q4F122DXUdU7S/ohiv2kGn9q0rjt8yM4HThYWY7+oGrqvHJngjlqcvqq1gBwl9nVoNty5
	nF2gXiyT3vNRNZoYnTTG8pURU/AwvMDYgR4difMRle4nSJh7XJO+Gsdi4GXdzJfI9S8iC1wB+3F9Q
	PHxIJ8SykA29Oje6kCisezIX3PNoRfqSEuqJJ1h7m/eoV68iV3J3MfuhNNa59TVofDIc5Ky0qNGW+
	BCtXukc4G8IReQBKTPEF5jrx6u2YNH3NGs9csUG9q0PKnkMHEsXr0A8r5YwFgoxDEqllp7KvWcCD0
	mtOV6CNw==;
Received: from localhost ([::1]:52986 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hudto-004I5t-96; Mon, 05 Aug 2019 14:23:44 +0000
Received: from latitanza.investici.org ([82.94.249.234]:40269) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hudti-004I5m-Gk
 for samba-technical@lists.samba.org; Mon, 05 Aug 2019 14:23:41 +0000
Received: from mx1.investici.org (localhost [127.0.0.1])
 by latitanza.investici.org (Postfix) with ESMTP id D7986120A71;
 Mon,  5 Aug 2019 14:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cryptolab.net;
 s=stigmate; t=1565015015;
 bh=iOmMzzZwe4IiU1GaldJC7P705ahhaXuwqEGJHfUXltM=;
 h=Subject:From:To:Cc:Date:From;
 b=l0LgaYaDpCuPIbX9CTcuqwq/0AQdl+Shv68DDU/GPG7F+7rSgKEcgYgtNlQHuvZuo
 hrqLto5Q3qcDQMalcWMJNKI+XOnZEtstiUQawjL7WZYK0v4ILRjxmA/7s0CB23jDgT
 HlmGYnNJm5+4xSkyQaZ/5hTGJgjhL0EMgNwojtQM=
Received: from [82.94.249.234] (mx1.investici.org [82.94.249.234])
 (Authenticated sender: anoopcs@autistici.org) by localhost (Postfix) with
 ESMTPSA id 837711209E7; Mon,  5 Aug 2019 14:23:29 +0000 (UTC)
Message-ID: <e3886f8fcb0ed4aae2965099bcdb0b4ff35a581a.camel@cryptolab.net>
Subject: NT_STATUS_INVALID_HANDLE during file open with  vfs_glusterfs
To: samba-technical <samba-technical@lists.samba.org>
Date: Mon, 05 Aug 2019 19:52:37 +0530
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
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
From: Anoop C S via samba-technical <samba-technical@lists.samba.org>
Reply-To: Anoop C S <anoopcs@cryptolab.net>
Cc: "Volker.Lendecke" <Volker.Lendecke@SerNet.DE>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi all,

The following commit changed the way in which O_NONBLOCK is
added/removed from file status flags during open.

https://git.samba.org/?p=samba.git;a=commit;h=ef582ffcf3a220b73f678d9bce0fd37800f76c54
smbd: Always open files with O_NONBLOCK

Since O_NONBLOCK is now internally getting added unconditionally,
storage backed by GlusterFS volumes using vfs_glusterfs produces
*Invalid file handle* error while opening files(I tested from Windows).
set_blocking() from open_file() is now being invoked due to the
presence of O_NONBLOCK flag and fails at fcntl() call operating on fsp-
>fh->fd which is obviously bad and returns EBADF.

Thus when open file descriptors are handled as fsp_extensions we may
have to rely on VFS itself to get the job done.

Thanks,
Anoop C S
 



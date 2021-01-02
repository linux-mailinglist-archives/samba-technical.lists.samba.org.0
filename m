Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 572512E8679
	for <lists+samba-technical@lfdr.de>; Sat,  2 Jan 2021 06:26:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=M7fR5RdbVhR16F9VifUn2xUzeSPJmR32nInQDMEh6oc=; b=YHrlvssnF1vAtrp4QztzQGdSNR
	KSgImWlOR2HyvEI4z6bMByD1q5LHQWDoQmZ7mbaR3AD751G8eK1ETxSc0MMkNBuUb5fbYl7rKMpUS
	P8FDXnus+Pv7sf/dAyh7ZRlsiJPiMb/bvaog/hrOk3wLv854g5bOAMPfyzQfAnaW6RJeRlrPyQFWZ
	pGV5QC5Xu9eF48qBhr9N6qifch8O2Q+n70pONenQFiUDydEavLCCCD7OV69l9lR5o0NifncfceHfq
	pzEZNcfU7ZlWDPwwiOVBOF8AizRhvcyY529+a2zbg1+DSDUd9DDP1bN0kF4H4CatN4DasPEX2uP87
	Kxc5L7Ag==;
Received: from ip6-localhost ([::1]:41580 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kvZQN-004VQU-KW; Sat, 02 Jan 2021 05:25:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36064) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kvZQB-004VPo-Ik
 for samba-technical@lists.samba.org; Sat, 02 Jan 2021 05:25:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=M7fR5RdbVhR16F9VifUn2xUzeSPJmR32nInQDMEh6oc=; b=BorFbc3cNtqD7t9b7O3xWz4DVU
 xG+sCJLp2ql1zkREpq1xyLQ0aH5MwdQQsEwYZUdDpPmwo7NaejRf3jNOaY5FOGi8FRUOnP4Y4dMRO
 o7rmmT/jApQsLckNkkab360xYCUu+a30PjO8uL+jjpy2PNRMWBOUQsL5rOtpNTZRyuCAg1DFaGJRp
 oT3vWsmW1Mtd/Zd9n8Hbs8DcnBztRwtFbDIWgTIaWoCEIe2hbeDaa90WXf69LsQMaXi5g0XJYVlRU
 SMUivQnzqPWgInAEhiYxowRQnuGSn0NNukmYr3WuGyfQByggpu4Fd077UvGQNzRB2GaxEHd3pJoEe
 TMEoIThMJAXdZQ6F7oYjBuPvHBeJIWQT2oHs/Qf9oRPGAtwF1s4UuQyUnaTX6MgYL2yHCJbVIEecX
 qAVAV1h8NiyP3ko2WMTgiHLoTtj/MDo4UCpijRuYHnsJ1HrVSpIhj3nVqPZ0FEPdCjBcugEK2kpyR
 NsXp4H+HSFWUlgwYjuJ8Yi4a;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kvZPr-0007U0-Dp; Sat, 02 Jan 2021 05:25:27 +0000
Date: Fri, 1 Jan 2021 21:25:24 -0800
To: Steve French <smfrench@gmail.com>
Subject: Re: [PATCH][SMB3] allow files to be created with backslash in file
 name
Message-ID: <20210102052524.GA67422@jeremy-acer>
References: <CAH2r5msH3LZuF69UFcfgtG7XXurMDc=-Ab7Ct4XwfARR8d+wRA@mail.gmail.com>
 <20210101060050.GA1892237@jeremy-acer>
 <CAH2r5mt+5LQB59w0SPEp2Q-9ZZ2PV=XDMtGpy2pedhF8eKif0A@mail.gmail.com>
 <20210101195821.GA41555@jeremy-acer>
 <CAH2r5mvt_cHDbT0xaeLNQn=5cQ0T2-wPgpMkYEGQNdtDZ3kP=A@mail.gmail.com>
 <20210102025837.GA61433@jeremy-acer>
 <CAH2r5ms1V2KKb6T3ELQ-JsQ3fniOScTE2654_xLwnPruiekzEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAH2r5ms1V2KKb6T3ELQ-JsQ3fniOScTE2654_xLwnPruiekzEw@mail.gmail.com>
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
Cc: Xiaoli Feng <xifeng@redhat.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jan 01, 2021 at 09:49:06PM -0600, Steve French wrote:
>I exported the /scratch directory with smb.conf configured as
>
>[scratch]
>   comment = scratch share for testing
>   browseable = yes
>   path = /scratch
>   guest ok = yes
>   read only = no
>   ea support = yes
>   create mask = 0777
>   directory mask = 0777
>   vfs objects = acl_xattr
>   map acl inherit = yes
>   strict allocate = yes
>   map acl inherit = yes
>   mangled names = no
>
>Connecting with smbclient and doing a simple ls causes the disconnect:
>$ smbclient --version
>Version 4.12.5-Ubuntu
>$ smbclient //localhost/scratch -U testuser
>Enter SAMBA\testuser's password:
>Try "help" to get a list of possible commands.
>smb: \> ls
>  .                                   D        0  Fri Jan  1 21:19:52 2021
>  ..                                  D        0  Thu Dec 31 21:42:28 2020
>  rsvd-chars                          D        0  Fri Jan  1 09:14:04 2021
>  file-?-question                     N        0  Fri Jan  1 21:19:42 2021
>is_bad_finfo_name: bad finfo->name
>NT_STATUS_INVALID_NETWORK_RESPONSE listing \*
>smb: \> SMBecho failed (NT_STATUS_CONNECTION_DISCONNECTED). The
>connection is disconnected now

Well of course it disconnects. You set

"mangled names = no"

So the server returns the bad name. The smbclient
library notices the server is trying to screw with
it by sending invalid Windows names and disconnects
to protect itself.

This is by design. There is a *REASON* mangled names = yes
is the default. Otherwise you can't see valid server
filenames that contain : \ etc. etc. from a Windows client.

Even a file names AUX: has to be mangled. "mangled names = no"
is only useful for a pre-cleaned exported file system which
you can guarantee contains only Windows-compatible names.

This is not a bug, it's working as designed to protect
the client code.

There was a CVE where libsmbclient might pass up
names containing a '/' to the calling code (not
that they can exist on disk, but a malicious server
could send them) which might then treat it as a
path separator.


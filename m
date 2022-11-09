Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D11666232A2
	for <lists+samba-technical@lfdr.de>; Wed,  9 Nov 2022 19:38:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=/yIgJUKaHRITHQcdKsevWAjCd84QODiXTBt5cWXXEE0=; b=zhQ72PXN4RW4AyxTMvtsBygA9a
	dBwiMFaITNM5UVW94R6KzSGDZh8MFKLKLeVkyWjYqGge80k9bMvWeKoC1UGQtxS3EBAOFGJbji+af
	RPCBgQ+FK85B1KD6kRXcb2O+lLw5JhZHIouPReQKn62wyZ97cFPFlfRusKoMZe9Apk1V9zos/hXqO
	e4Fmhfm/zXO08W2JBK8iBN9t1LIS0cAAIriev/irvpxKbOuLowdX0wymdH6pDxLi+rdr/37vPZOx7
	PotofWG+sXwNDu+XkmCjt4Z9OfzTOftY4x5pwDrZNmoDDJNkq6I3x9PxtomRHBktZofQbz4ZL/8Tz
	cN8kPN5w==;
Received: from ip6-localhost ([::1]:44788 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ospxm-00Bs6B-CZ; Wed, 09 Nov 2022 18:38:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10210) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ospxg-00Bs62-1v
 for samba-technical@lists.samba.org; Wed, 09 Nov 2022 18:38:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=/yIgJUKaHRITHQcdKsevWAjCd84QODiXTBt5cWXXEE0=; b=t45GWlRRBg7TS33Y4Z68+lJdsv
 5DfE8UgE3o6VY9gqWtvlbwjcFBZ8IHJnMtYEsfNBxlrEbjBD1YSCDj21Bz+iEZVetto56ciWKWRSC
 XLo9Ap2YH1dXqz/XEO0xSHW/UEHGRE9fg2KsvfV0HSJAtOH9gqhT/dI95mMJ+f2ZWEFcmaLIJwMku
 pwgUG+14RHH/64Ml1LqBQDQi3xE0xnyQb4AdhPsVh8g0suNsdg3CN2IY11/cW7Ui/VOKZAUQN7b0k
 dzqVQvsIPU4SK6+/SBVCarub7W0W70tFWYoo0AIkyXBlrLCBD/RhumhCh7ko4Yh8G66R2aUskjY0d
 Gd6xQlft2g0zVPHkGLxcwbPop0nGG8PbIX2j+59rCkOtOIq6vFVh69FPRh+PW0UtFcQrgKYfjMYc4
 IhCSj4Bj+MDWrCAkICweHgL+fLnIjKywWkVxOOoCIh97zvxgPy2CiDTe2D0dKiFCr6+z2gfPczqPp
 6Az+Vlps1CTdFVArtTuT+a3k;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ospxe-007t5W-AJ; Wed, 09 Nov 2022 18:38:06 +0000
Date: Wed, 9 Nov 2022 10:38:02 -0800
To: Amir Goldstein <amir73il@gmail.com>
Subject: Re: reflink support and Samba running over XFS
Message-ID: <Y2vzinRPFEBZyACg@jeremy-acer>
References: <CAH2r5mtc6rHC=zfWCjmGMex0qJrYKeuAcryW95-ru0KyZsaqpA@mail.gmail.com>
 <Y2molp4pVGNO+kaw@jeremy-acer> <Y2n7lENy0jrUg7XD@infradead.org>
 <Y2qXLNM5xvxZHuLQ@jeremy-acer>
 <CAOQ4uxgyXtr6DU-eAP+kR1a7NsS-zDhXi5-0BJ7i=-erLa3-kg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAOQ4uxgyXtr6DU-eAP+kR1a7NsS-zDhXi5-0BJ7i=-erLa3-kg@mail.gmail.com>
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

On Wed, Nov 09, 2022 at 11:32:30AM +0200, Amir Goldstein wrote:
>On Tue, Nov 8, 2022 at 7:53 PM Jeremy Allison via samba-technical
><samba-technical@lists.samba.org> wrote:
>>
>> On Mon, Nov 07, 2022 at 10:47:48PM -0800, Christoph Hellwig wrote:
>> >On Mon, Nov 07, 2022 at 04:53:42PM -0800, Jeremy Allison via samba-technical wrote:
>> >> ret = ioctl(fsp_get_io_fd(dest_fsp), BTRFS_IOC_CLONE_RANGE, &cr_args);
>> >>
>> >> what ioctls are used for this in XFS ?
>> >>
>> >> We'd need a VFS module that implements them for XFS.
>> >
>> >That ioctl is now implemented in the Linux VFS and supported by btrfs,
>> >ocfs2, xfs, nfs (v4.2), cifs and overlayfs.
>>
>> I'm assuming it's this:
>>
>> https://man7.org/linux/man-pages/man2/ioctl_ficlonerange.2.html
>>
>> Yeah ? I'll write some test code and see if I can get it
>> into the vfs_default code.
>>
>
>Looks like this was already discussed during the work on generic
>implementation of FSCTL_SRV_COPYCHUNK:
>https://bugzilla.samba.org/show_bug.cgi?id=12033#c3
>
>Forgotten?

Yep :-).

>Left for later?

So looks like we do copy_file_range(), but not CLONE_RANGE,
or rather CLONE_RANGE only in btrfs.

So the code change needed is to move the logic in vfs_btrfs.c
into vfs_default.c, and change the call in vfs_btrfs.c:btrfs_offload_write_send()
to SMB_VFS_NEXT_OFFLOAD_WRITE_SEND() to call the old fallback code
inside vfs_default.c (vfswrap_offload_write_send()).



Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 121472E857A
	for <lists+samba-technical@lfdr.de>; Fri,  1 Jan 2021 21:07:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Xia1L87USBW5apqIGMF1dwRCIxOBi6OYUM3sTOiJ1ng=; b=5YfeRoR/sP78pAKGU2dP5QSelO
	ABxBh5DQod2oOyCHrLyubvEAPPwQhFhivS28wub4033ZvR+TpfYMJ2r0Zy5bJh4dVMtNx+SZ/a0pg
	uZH7uLGl60w7uhaekJHuuJhw6awrQHd8PLMkjchmQVqIZAzdJrslYUSqYEZo+rjAFbWogFXQYnru7
	k1vtztl5jHqO7Wfwd2RXlZ6/EPwweWNGQYnAFPhffD/3DgP6fqwmVbn0ySrQLEjgJ2lA18lVTxpY3
	HbYmy8CfZDd3FPOaE7yB0XluT3B4SOrYPYH7IRQ4coWC5iHTCaXUvggUyj8bNRxW8yxOlPMWKYHxA
	xDQZg/zw==;
Received: from ip6-localhost ([::1]:37878 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kvQhQ-004UJU-M7; Fri, 01 Jan 2021 20:07:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38500) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kvQhL-004UJN-0l
 for samba-technical@lists.samba.org; Fri, 01 Jan 2021 20:06:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=Xia1L87USBW5apqIGMF1dwRCIxOBi6OYUM3sTOiJ1ng=; b=CJLYzXxEF86RmQx7sX8zM9jlLz
 EApF3+3LWaSm62KuodmVObVxc/WlWoIqeQyAal+rbmxeiCc+xwIvOm5Z6YFUP6id6u7GERV2CHTqn
 9NUKQiCBnKSCobd+O1DehGNDIHCFArkAlBn3T4GUX46LcdXBSL+vLcEWoFLbMmrKgcmwUXAb1jpcz
 eunBD2G4GT9jwMgu38Jo4tStdVDXeZkIRvhN/oOjLOO9MAbUaV5SxXVmSfn3W17TcTRXqOJxgTlIG
 X6V7YNSppp85Xin/tntg+FkSW3l0i7OFqoy7RyHNPNK4LFKwp9E6iswTHPlk1brlJiwtRQl7IgXP1
 r0qQqxCaCjDLtZ/bvrmDyqeZW60ClgLpqGSkFIp9GrJ6dxRARnBXfAx39dwnCqrgW69B7SejzBYYs
 iz2yelD8MeMiFgteVEjmgAKCPR8tcezP4L4uhMI0tTgCMzLSWDpwKbP+ZP5g8F4TqY2S60R5UlHOp
 jRcNJ9bJLaujWuSkoSCEns5v;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kvQhJ-0005dv-GS; Fri, 01 Jan 2021 20:06:53 +0000
Date: Fri, 1 Jan 2021 12:06:50 -0800
To: Steve French <smfrench@gmail.com>
Subject: Re: [PATCH][SMB3] allow files to be created with backslash in file
 name
Message-ID: <20210101200650.GA42108@jeremy-acer>
References: <CAH2r5msH3LZuF69UFcfgtG7XXurMDc=-Ab7Ct4XwfARR8d+wRA@mail.gmail.com>
 <20210101060050.GA1892237@jeremy-acer>
 <CAH2r5mt+5LQB59w0SPEp2Q-9ZZ2PV=XDMtGpy2pedhF8eKif0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAH2r5mt+5LQB59w0SPEp2Q-9ZZ2PV=XDMtGpy2pedhF8eKif0A@mail.gmail.com>
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

On Fri, Jan 01, 2021 at 09:12:14AM -0600, Steve French wrote:
>On Fri, Jan 1, 2021 at 12:00 AM Jeremy Allison <jra@samba.org> wrote:
>>
>> On Thu, Dec 31, 2020 at 09:35:23PM -0600, Steve French via samba-technical wrote:
>> >
>> >This patch may be even more important to Samba, as alternative ways of
>> >storing these files can create more problems. Interestingly Samba
>> >server reports local files with backslashes in them over the wire
>> >without remapping, even though these are illegal in SMB3 which would
>> >cause confusion on the client(s).  Has anyone tried Windows mounting
>>
>> Samba should mangle names containing '\' to 8.3 names.
>
>You were right mangled names was enabled.  But that is also
>interesting - it does expose a bug in smbclient.
>
>When you connect smbclient - doing a ls of a subdirectory with
>reserved characters worked, but doing an ls of the parent (root
>directory of share) caused smbclient to disconnect.  See below
>
>smb: \> ls rsvd-chars
>  rsvd-chars                          D        0  Fri Jan  1 08:55:49 2021
>
>556368460 blocks of size 1024. 296010296 blocks available
>smb: \> ls
>  .                                   D        0  Fri Jan  1 08:54:28 2021
>  ..                                  D        0  Thu Dec 31 21:42:28 2020
>  topdir                              D        0  Mon Dec 14 16:01:25 2020
>  lock1.txt                           A      200  Fri Dec 18 12:28:18 2020
>  lock_rw_shared.dat                  A      200  Fri Dec 18 12:28:18 2020
>  lock_rw_exclusive.dat               A      200  Fri Dec 18 12:28:18 2020
>  autounlock.txt                      A      200  Fri Dec 18 12:28:18 2020
>is_bad_finfo_name: bad finfo->name
>NT_STATUS_INVALID_NETWORK_RESPONSE listing \*

This is coming from the following code which is designed to
protect the client from a malicious server returning a '\' or '/'
character in an filename component.

/****************************************************************************
  Check if a returned directory name is safe.
****************************************************************************/

static NTSTATUS is_bad_name(bool windows_names, const char *name)
{
         const char *bad_name_p = NULL;

         bad_name_p = strchr(name, '/');
         if (bad_name_p != NULL) {
                 /*
                  * Windows and POSIX names can't have '/'.
                  * Server is attacking us.
                  */
                 return NT_STATUS_INVALID_NETWORK_RESPONSE;
         }
         if (windows_names) {
                 bad_name_p = strchr(name, '\\');
                 if (bad_name_p != NULL) {
                         /*
                          * Windows names can't have '\\'.
                          * Server is attacking us.
                          */
                         return NT_STATUS_INVALID_NETWORK_RESPONSE;
                 }
         }
         return NT_STATUS_OK;
}


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9112A489883
	for <lists+samba-technical@lfdr.de>; Mon, 10 Jan 2022 13:22:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=3FpU22DrQ3Sdxwv0rPunpTyuwLAWrrzG2eH3dNwo4GM=; b=Sflx7GG/d3teE6hOx2NoyK9o9N
	9noOYz4N9gkB0Rxub2vcHHhiVz6gTpwkupHHkAe7PWKPvp0jhd1iqrInf4pHFYzM71kE7HCbGB199
	9vWgJsPSf9PFo67W743Zh9MLHaRu3hVDhoGw0NyYPwO6ens4lGeCo+7IEAH9aBYOgIoMaBZx8BQ2o
	wglU7XWqTvhCs5CDJbMIejzR0pwwZAVtez/CC3SKM3W793JemmMyf9rB5w9JutyrggD+aMS4tz51M
	PiYbfK/stVBa7QQkZXUpE5C2JYWP+817uVIs/U6wsGv9V2yK/3XZld8jlOBqdc55dMq8gpOBPZ3tN
	cP6LFIZw==;
Received: from ip6-localhost ([::1]:62270 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1n6tgY-006HbH-Js; Mon, 10 Jan 2022 12:22:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54812) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1n6tgT-006Hay-Eg; Mon, 10 Jan 2022 12:22:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=3FpU22DrQ3Sdxwv0rPunpTyuwLAWrrzG2eH3dNwo4GM=; b=DpOqgD2AGVDve0GWgn5jcZAUgp
 K7bNCrb4eQTabjhfb+g1rkdkCW707ft+6b5P3xY0WIUJHSDR3gGqE8WbH8MrZL36UXkiK2HBJnMr3
 iIhoBgqnlyZP7zM2+0vZWMW7T8EGfbwr9eERihTfBls6JYQYRpccSphgPLLVWoaY+oPgVtKKtC4+n
 3t+mnj78zNykhlyxGzzUjyC0t7orhgVRQhBMoGlMkxQMfPHqkQJslfdn6fiUHW8ha0gw6MAmrYfqm
 fJ1eA9GWLCR69F74jaU5L8+TTkrWC6UddI0XA0owuZM+gzjyQZAt3qU/aXDph4lgyHB1MnI2/Hp1b
 y/0U9sDGjUqEriHDdDpUxFSIg2VLl0K/DaLlPLhjrOSGm0gkNaBA7VSr56CAiM2GsLlUXwOYifS06
 nD+BGP2s+O1sfczbgUmd1ImTeilcqb2RQ2JAYecTZqcFcTl2a3lim31OSxW++VYjpS/+y5zxHCuzy
 c2VbQe+I3Aga4tNClfzY7wh1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1n6tgS-006ZKo-UH; Mon, 10 Jan 2022 12:21:56 +0000
To: samba-announce@lists.samba.org, samba@lists.samba.org,
 samba-technical@lists.samba.org
Subject: [Announce] Samba 4.13.16 Security Release is available for Download
Message-ID: <8e4aefd8-9d1a-5841-2e84-bbb6e07c7e31@samba.org>
Date: Mon, 10 Jan 2022 13:21:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Release Announcements
---------------------

This is a security release in order to address the following defects:

o CVE-2021-43566:  mkdir race condition allows share escape in Samba 4.x.
https://www.samba.org/samba/security/CVE-2021-43566.html


=======
Details
=======

o  CVE-2021-43566:
    All versions of Samba prior to 4.13.16 are vulnerable to a malicious
    client using an SMB1 or NFS symlink race to allow a directory to be
    created in an area of the server file system not exported under the
    share definition. Note that SMB1 has to be enabled, or the share
    also available via NFS in order for this attack to succeed.

    Clients that have write access to the exported part of the file system
    under a share via SMB1 unix extensions or NFS can create symlinks that
    can race the server by renaming an existing path and then replacing it
    with a symlink. If the client wins the race it can cause the server to
    create a directory under the new symlink target after the exported
    share path check has been done. This new symlink target can point to
    anywhere on the server file system. The authenticated user must have
    permissions to create a directory under the target directory of the
    symlink.

    This is a difficult race to win, but theoretically possible. Note that
    the proof of concept code supplied wins the race only when the server
    is slowed down and put under heavy load. Exploitation of this bug has
    not been seen in the wild.


Changes since 4.13.15
---------------------

o  Jeremy Allison <jra@samba.org>
    * BUG 13979: CVE-2021-43566: mkdir race condition allows share 
escape in Samba 4.x


#######################################
Reporting bugs & Development Discussion
#######################################

Please discuss this release on the samba-technical mailing list or by
joining the #samba-technical IRC channel on irc.libera.chat or the
#samba-technical:matrix.org matrix channel.

If you do report problems then please try to send high quality
feedback. If you don't provide vital information to help us track down
the problem then you will probably be ignored.  All bug reports should
be filed under the Samba 4.1 and newer product in the project's Bugzilla
database (https://bugzilla.samba.org/).


======================================================================
== Our Code, Our Bugs, Our Responsibility.
== The Samba Team
======================================================================



================
Download Details
================

The uncompressed tarballs and patch files have been signed
using GnuPG (ID AA99442FB680B620).  The source code can be downloaded
from:

         https://download.samba.org/pub/samba/stable/

The release notes are available online at:

         https://www.samba.org/samba/history/samba-4.13.16.html

Our Code, Our Bugs, Our Responsibility.
(https://bugzilla.samba.org/)

                         --Enjoy
                         The Samba Team


Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9C22F39D4
	for <lists+samba-technical@lfdr.de>; Tue, 12 Jan 2021 20:16:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=/bXzeFFWMQvPcFj6BBB6B6wASHardqLl3AbeAtXgXQM=; b=sRGA3LhbX4uukCXhB+QWQRl+OX
	QrY67qpz52DZOxwpr984cR3pqNmSYcSUFWwMFI2AvN3fG1Xl9lwrTmSyxNtcC0op1fGmCyz946b+p
	EQYmhayXf5cRW6Zckbxa8mhVDBJnombPI48XJfmJ6kvAFe9nWaz5FeiOBtd3OmS9AI5wIWB6sZDOT
	ulysLjiBMuC4elRJ0q9Y9ojPxsLjmmPdE2VYBrjb0Is7qYgbaKu4jw+IGI/1yIHUwKxCUbJyM5Cz+
	10kxFRea6/eqxq2AIM39bETjBlBOClrkXlg85vdXpk+KWCXRhuq6o6Rd3pjPFccrNTzsXuV2c2zJZ
	NwcEveSQ==;
Received: from ip6-localhost ([::1]:42346 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kzP9r-005Stn-AP; Tue, 12 Jan 2021 19:16:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37088) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kzP9m-005Std-30
 for samba-technical@lists.samba.org; Tue, 12 Jan 2021 19:16:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=/bXzeFFWMQvPcFj6BBB6B6wASHardqLl3AbeAtXgXQM=; b=fAaVUg/2jFQaFkOW4ShfdF74OA
 zyV+AzHZ7k8KKljfUQ/hecHcJQlXbciQH3DJSQdc9fytYeGqMpoIXHxgstnzBaykzenWPWL64dRVJ
 jXvIuz1/BggtRgd9Cgixrywk+WZs7fNEaUP4dxZEPpEeMDQidk4LKT8wAD4nhrizv+yLcJdjCAhBL
 p6oRyxLIyf6zF5SrbvevLBopM1dcduWYIaG28/Wlusc3GqnPKxp5qeAdSEtfcTJWoI0YFySGSuE26
 LCrOE1nreZj+PX4ERkB3+LzKCpRqAvxAW/88TBGuHARgPdxTEGn3ZXcTwhz1QfJnYomebE6AALsL6
 8apKAP0LSAK8eARq1pWBVFS6FuFIUIg7Xpif4WuMrOrHfhwZyhzHzI1kU7v6Df00vYMUof7qKHy1G
 mrzujAfwOCMiO5Jz1IdeY+Q5PVCdvjtbi4C9aGFk25E9ScJa3HiDydYvWTOoyc0uQTU8XwxNr1yas
 ZbE/H6ToR7uCtQ8d0+yft7HJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kzP9i-0006DM-Jp; Tue, 12 Jan 2021 19:16:39 +0000
Date: Tue, 12 Jan 2021 11:16:36 -0800
To: Shilpa K <shilpa.krishnareddy@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
Subject: Re: Initializing case based parameters during share switch in
 create_conn_struct_tos_cwd()
Message-ID: <20210112191636.GD1316956@jeremy-acer>
References: <CAHbM3qgJv3he3LSokE-V1yPUttueT1esXF0vNQqHSnRPDtqz9A@mail.gmail.com>
 <20210112191328.GC1316956@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210112191328.GC1316956@jeremy-acer>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jan 12, 2021 at 11:13:28AM -0800, Jeremy Allison via samba-technical wrote:
>On Fri, Jan 08, 2021 at 03:27:20PM +0530, Shilpa K via samba-technical wrote:
>>Hello,
>>
>>We are creating DFS referrals when a folder is created under the share
>>root. In one instance, an user was trying to create a folder with the name
>>"FOLDER~1" (with exactly 8 chars in the folder name) from Windows. So, we
>>created the DFS referral with the name ending "FOLDER~1" and returned the
>>error STATUS_PATH_NOT_COVERED to the client. Then,the client had sent
>>DFS_GET_REFERRALS request. While  processing this request, when
>>unix_convert() is called as part of returning the referral, it was
>>normalizing the name to lowercase because the name is a mangled name and
>>the below parameters were null:
>>
>>conn->case sensitive = 0
>>conn->share_case_preserve = 0
>>and default case is lower
>>
>>The case_sensitive and short_case_preserve were null because we were not
>>initializing these values in conn struct to the share configuration that we
>>were switching to. We are using below settings for the share:
>>
>>case sensitive = no
>>preserve case = yes
>>short preserve case = yes
>>default case = lower
>>
>>I used the code changes that are in the below patch and now we return the
>>folder name in the referral as is. Could you please review this patch and
>>let me know if it is fine?
>>
>>Thanks,
>>Shilpa
>
>Thanks Shilpa, this does look correct. It sets up the
>dfs share in the same way as the case options are created
>in source3/smbd/service.c:make_connection_snum().
>
>I think the best fix here would be to factor this code
>out into a function called by both make_connection_snum()
>and create_conn_struct_as_root() so we know they are
>setting things up identically.
>
>I'll set up a gitlab-MR for this. Thanks for your
>help !

Logged as bug: https://bugzilla.samba.org/show_bug.cgi?id=14612
so we can track it. Thanks !


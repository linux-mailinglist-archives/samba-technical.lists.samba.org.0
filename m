Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 584D52EB386
	for <lists+samba-technical@lfdr.de>; Tue,  5 Jan 2021 20:34:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=5FvF0Jud+t+6VWA50Tn/kluulakKBm4c5bWTNxZ+heU=; b=aJ83w3RmlsEiXVTEkmJNj8ZoLS
	lU6/XvEnnG8st+jbqLaR3RwK0Tkwb9xuITBRBSe0F00YKNQjmWUFKHBC/rQXEOlVbg7A7Wiz0Hyc9
	SdSh2n7FLaUbTeAbHnV98yt/B8hXCrQrVM4T23Y1oYtmDm3T8atkSI4/GRmb5zMQsUpPGSXzS4s06
	MTLqwJSmU66anhqVEbba7ASIidUVECHqO35LXU4XBaOSdQICDuvZ07+TD1qzXJQ3KiP1V+tqgoGKk
	HnodxZJl61T1ekmsUr4bh6NUSbovJcaHKjqPINNCMGU3zx1cspi8CqYRGyK6Ek6S8I4vc3XvkCtYY
	CZaPnpBw==;
Received: from ip6-localhost ([::1]:59084 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kws5B-004u06-4S; Tue, 05 Jan 2021 19:33:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46014) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kws56-004tzv-Fy; Tue, 05 Jan 2021 19:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=5FvF0Jud+t+6VWA50Tn/kluulakKBm4c5bWTNxZ+heU=; b=fOmuT/PulPvWBdwxd34gwCJlnp
 DxAkqmB/l47nTOGBbHCmIT1VLmicS+mECv2RlwciQFzq3PlRQiifezvEgPq+4JTPnC1vktzz1cIoo
 x8FwrBGxSztiZHOZzoXbozruckQgvmD1CglD5j492Ye3WDiVnwxMm+tyASJH3ygzjKl/rhPw3FGi0
 NsdmYkfWcuT1HdT1wqcWS8/0b+r8BoBxn4hbvZu7k0g8HtGLgGRvuRAqLKcyB9RBl46JOTx3Yaax1
 +ZHmQjXxaBwGDDV81fActTDjbSV96U6gSZ0g9nlN8hZQxElPU3jrGxFjW65uoKYKLLxsMKwkXEOhY
 bjq9SxOokLQOd9ibHI7JGlwbyL9uYlo1HBTjFUc5sCUcYuBIO5zj/jDfBccBZzDlJIakGphXY1x4F
 wf4eO2Yq+b4sIugYHsRl8+WqPdIbI7xWyC2+CvTsYfu0ZowBHwjJajXM2bpVaqbkM6FoJpJyDvxjc
 U2KndQ13ZN+xyagJApTn9Ee0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kws55-0007Ic-3T; Tue, 05 Jan 2021 19:33:23 +0000
Date: Tue, 5 Jan 2021 11:33:20 -0800
To: Yogesh Kulkarni <yoknfs@gmail.com>
Subject: Re: Samba and Adobe Illustrator locking issues.
Message-ID: <20210105193320.GA400861@jeremy-acer>
References: <CAOGdD2oUwmRRCC5JQ7d+0=187ruhoL0N15suf67GtWrav2qhrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAOGdD2oUwmRRCC5JQ7d+0=187ruhoL0N15suf67GtWrav2qhrA@mail.gmail.com>
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
Cc: Samba Listing <samba@lists.samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Jan 04, 2021 at 11:44:34PM -0800, Yogesh Kulkarni via samba-technical wrote:
>Hi,
>
> I have a strange case of lost updates with the Adobe Illustrator .ai files
>and
> samba server. I am writing this to validate my findings and ask if there
>is a
> known workaround to this issue.
> The samba version is 4.9.5 running on debian 10.x and clients are multiple
>MacOS
> versions.
>
> The customer reports an issue with multiple users working on .ai files.
>Here is
> the use case -
> User A - edits a file test.ai and saves the changes
> User B - opens the file and expects the changes to be present in the file.
> (almost immediately). So, they are not co-editing, but opening the files in
> quick succession.
> However, it turns out that User B cannot see the changes.
>
> Observations -
> On the client side, finder shows that one or more '.tmp' files are getting
> created when a user saves the .ai file. These .tmp files sometimes go away
>and
> other times stay till the user disconnects the share.
> Network caps indicate that the application does **not** use oplocks/leases.
>
> Hypothesis -
> UserA writes to the test.ai file and the application writes the updates to
>.tmp file.
> UserB has their finder open and obtains a lock on the .tmp file. Now, when
>UserA
> tries to rename the file from xyz.tmp to the test.ai file, since UserB has
>a lock
> this operation does not go through. In a way this is a deadlock as UserB
>will try
> to open the file to see the updated content, but it cannot do so, since it
>locks
> the resource and that prevents UserA from updating the content.
>
> Experimentation and results
> In order to verify this hypothesis and cater to the customer case, we
>experimented
> renaming the locking.tdb without restarting the daemon. This addresses the
>issue.
> Obviously, if we take out the locking component, there is always potential
>risk
> of simultaneous users overwriting each others data.
> I experimented with the locking = No, and checked with smbstatus, but with
>preview
> enabled, I see that a .pdf file shows as locked in output of smbstatus
>command.
> So I conclude that the samba process internally acquires the advisory lock
>on
> the file.
>
> Is there a more elegant way of turning off the locking than just renaming
>the
> locking.tdb ? We do not use clustered mode and will probably never support
>that in
> the product.
> Are there any such cases seen in the field in your knowledge ?
> Is there a tried and tested solution to this issue ?

You can always set "locking = no" but that turns off only the
byte range locking not the share mode locks.

I'd recommend you log a bug and upload the wireshark traces
so this can be investigated. Might be an issue with the
MacOSX client but it's hard to tell from the description.


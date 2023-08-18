Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 751AA781059
	for <lists+samba-technical@lfdr.de>; Fri, 18 Aug 2023 18:29:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=or2kPMZ1bEbdXRN3ju2GbfH7PXiFicHLVfIAi+ubNbw=; b=Z9+isPvves6ni194hlITLPjD0S
	ZZhglAaSXkfWLljDubW+xqaJyYE9/lys1V3TBXkBUPrpFJzc5Iwopfc0EwNfYVpHhBT9n+mXqU9Xr
	UImZiBLNr6EDPi5xw8ktiZQAszJY9cqG2sDub6QqjG/Re/sSk0wpmLZ8Vbrn4fELXb0i55w1jjpnr
	VyjjdzHxl7Cc+wIZDMLDDVZFVXEDb3hSHz7pxc4MS2SARxoScyQV6+JzcoYl22+8XltznJH3rYq/c
	Kuq0WFFwOUEnIRE6nUJYurpvU3pAK52BWVGUJGw3Cdo8ctZiwgtwe6JU7+YXwbA0McXtJaA2noCB8
	6Y0t6ZlQ==;
Received: from ip6-localhost ([::1]:37308 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qX2LY-00D9AZ-3m; Fri, 18 Aug 2023 16:29:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17494) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qX2LS-00D9AP-8I
 for samba-technical@lists.samba.org; Fri, 18 Aug 2023 16:29:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=or2kPMZ1bEbdXRN3ju2GbfH7PXiFicHLVfIAi+ubNbw=; b=m5lOewWrV/5DMQx8p9RrQ6+Qqq
 DDGjiKn4wyLXMU4uJf/XUew2bZAaT6I3ZbY01p/paCv0Sp+IUzQgUYpbdzGO4sipLmJ6D+SD1tBFK
 Pi6lOS6C2m1436R8EzaKJVONcCAIFrmrVXNbdw3NSnCge93WQLsjl90gLJm3fIekUPNV1NT4InZZc
 unNJ9zr9qMVUXseP+UQcGVlrKbz9AV1GWL6QKRtSZCWa1H2QItRUZb8k485pEeftMwiZJLrSSUpBI
 yWBP2cDeLVfMoyZcdMEt1uIZhUtJCGwX2w+VJq5C/3wOObc8/rS9ImWMPDI+TzzR+BJ8wjK+2FHfU
 6pw0BT9akkZEGmjkGnojzg4GU4SNV+L8lKGp69+SmvKj5J4GzywO8cCD3RlDJIo+fbhPnXmnzJkl/
 PKqkJv00LHLdcAtQ3KgB3NKAjg9YNPhraclwCJx0FQmqIHpz3ykxeVt7PE9aclaVMzrhHIBCU28Ge
 ZDypejN9asQndpRA9+ibbxop;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qX2LR-008m6p-0D; Fri, 18 Aug 2023 16:29:05 +0000
Date: Fri, 18 Aug 2023 17:29:03 +0100
To: samba-technical@lists.samba.org
Subject: Re: Loading users into a Samba AD DC using LDIF?
Message-ID: <20230818172903.7ce3652f@devstation.samdom.example.com>
In-Reply-To: <CACyXjPwRaW=Nn6XOeMbpNj5YeLHhVnxiLeu42huE2JnSKeEKmA@mail.gmail.com>
References: <CACyXjPwRaW=Nn6XOeMbpNj5YeLHhVnxiLeu42huE2JnSKeEKmA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 18 Aug 2023 08:59:35 -0700
Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
wrote:

> Hi Folks,
> 
> In testing user creation with samba-tool, I found it takes around ten
> minutes to create 10,000 users. This was with a VM but with real
> hardware we might only expect a small factor of improvement.
> 
> Is there a way to use LDIF to load large numbers of users and groups
> into Samba as an AD controller?
> 
> Of course, that might not be faster, but I am hoping.
> 

Hi Richard,
yes it is possible to use an ldif in a script, but I don't think this
will be any faster, because that is what samba-tool basically does when
adding a new user.

Rowland




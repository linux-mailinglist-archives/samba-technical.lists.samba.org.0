Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C7628F922
	for <lists+samba-technical@lfdr.de>; Thu, 15 Oct 2020 21:03:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=QVPfcTjuoylOumg0gASvf/p8zbqjFV4HicT3b5hDxhY=; b=F4uTfDzF9FZPtH12S3lWoLbG/D
	sPGL56IeQ1J4sFvYfLmvt3hhecFSCbVpHAq/KPYBBqB0HwR7H0Wng3pv2+H6iYt5oJGbn1NreOjyZ
	1U6rAEPyiKqnQbelEifWLnn6yVngoAZzdwiMeWRgkrFtde5HN5VZ1vFAYuwNAVzfaBHfUibVUfQsZ
	GPtv6ufiuQhU6x6OrLht4IYYEFPyvCVKh/fEA3ahk7OEABiSrVqbiHiabY/A4hKx6uOD2+shrCuOn
	2oOlb4tjxXeP0DDOtYRqJ2RKTqBAWU2iewCyDZM0rTG8kTdP68Cz9YrbQxpApBydDdaLZ1baWj1Lq
	WpH7xioA==;
Received: from ip6-localhost ([::1]:58724 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kT8X7-00CJ3Y-6l; Thu, 15 Oct 2020 19:03:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41692) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT8X3-00CJ3R-Ki
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 19:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=QVPfcTjuoylOumg0gASvf/p8zbqjFV4HicT3b5hDxhY=; b=GHXLuslQN0w4jdKSXz12iPceoS
 bi/OCKMA7ni8sItU/mSXwcTCUGjXapF0rNF1Y2DTb2buqbI55xUySnVsVARE+JUj3AuNPxlcJ4ld2
 Bidjh7zZukCokgvZOzos9QC8nqwQn3McVOxXXtr260LVWWHwJB5B5FA3EJQ4fdynBbzhd175D8f3i
 ukB1sX/Qwv/OphJQvVWvBpPsXMOwXN4m8XCvZ+ZmbBPnNu3pPCwq/hliXl80M11A+tuhz5Lx5wfIJ
 pOLfuTQ4NWaWkEoRuvFj6l8TyDG4Nxz3uA/q7G+c3QDW1ZFIXiA8gZnyHUi8cnuRe3DPTt0NOj7VO
 WSAWcawSB5rOrOAE5qsvNckOE8w3wywsJvuJYCzYKeclr7R1U6ZzU5+jjQTdnafA0BpxuPpN830ag
 3Qv5P7yMBbprM8DuFzhOPdQrAFn82cV6mCV454dptfBINqppAoBM1E1/DDbaBiC42xkOmSuPt8BEP
 jlA5bFo5D0/x/hbzv+4SGUoa;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT8X3-00030v-1a; Thu, 15 Oct 2020 19:03:21 +0000
Subject: Re: [PATCH] Documentation: Rename Samba's DCO to Samba Contributor
 Representation
To: Jeremy Allison <jra@samba.org>
References: <87mu0nidll.fsf@ebb.org> <20201015180510.GE3769001@jeremy-acer>
 <2231b5de-fa06-db61-feb0-08ad0374673e@samba.org>
 <20201015183632.GB3840862@jeremy-acer>
 <5f39ac65-2c4f-c569-2085-2b18f16b0956@samba.org>
 <20201015185142.GE3840862@jeremy-acer>
Message-ID: <fbd370e0-7cb1-4fe0-e1d3-e703b2dc8099@samba.org>
Date: Thu, 15 Oct 2020 20:03:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201015185142.GE3840862@jeremy-acer>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 15/10/2020 19:51, Jeremy Allison wrote:
> On Thu, Oct 15, 2020 at 07:46:44PM +0100, Rowland penny wrote:
>> On 15/10/2020 19:36, Jeremy Allison wrote:
>>> Well it's representing that you have the right to contribute,
>>> so it seemed OK to me.
>> Also myself and just about everybody else, if you be believe what Google
>> returns from a search on 'Developer's Certificate of Origin'
> Hahaha ! You're right :-). I should've done that
> myself first:
>
> 229,000 results, with many other FLOSS projects using the
> DCO name (in fact just about everyone doing this
> is using that name :-).
>

Just goes to show about Google, I got 627,000

Rowland



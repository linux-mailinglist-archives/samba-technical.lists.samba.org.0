Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C26D1169A25
	for <lists+samba-technical@lfdr.de>; Sun, 23 Feb 2020 22:00:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=vjJsZSP9C2OkSxl3gg07KFhnRse7DAPfuAE0MXhhhb0=; b=FQzzWAgS72XnCyGQbplj+VLg9U
	jwbG27h8qipkbruvytgO/f/bg27B3bt2JUPQ6lP3ntWV0pXJNTtA9Fsn3XfA+Dqak2BScIkG4AcEi
	rfCd+olIJ7wBqODJwS/+DY8W1O46cfjuHUkC6js9iTZWTFIKLbu4L4+KgJzdUJnKi32bFN1GrUsab
	pRuLPQN5p5IjjdNKF2xRKfUWHbAKJfLANlsLqTwtcTKqMVZtX+EcivOCnXS5KL2k0IQz2zmH+/dwu
	OX4amgwAUBmAPPUPlytE76ykQBE9fcHXC29sqbMk2qt6KHEC899jQDWAE+dyvdDUE9T3/aEvmN0+o
	z8c5g6Ow==;
Received: from localhost ([::1]:46106 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j5yMQ-00BFHe-FS; Sun, 23 Feb 2020 21:00:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30220) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j5yMI-00BFHX-HE
 for samba-technical@lists.samba.org; Sun, 23 Feb 2020 21:00:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=vjJsZSP9C2OkSxl3gg07KFhnRse7DAPfuAE0MXhhhb0=; b=xicwba/bRz3QaCbgJlaPSpK4t+
 Ptm5cHjvC6333U1FHno8WOrJyjZ1ro8xUxNBz7Mb5rKIMLf3aI+E6zcq80UNIcflrapW42MJQQjUK
 wwbywV9BR1q3Pf55ZmXumvym+jFIQye1SZ3sg5pIAKwvNSOvy5zLWR8qfcWSrAr0s8TJUkFwkwgDZ
 O2Z0QHKpF+AeRGUjyNimTDL1aDzTdHfW4snquUQnaS0TvGCj/HQTw0Dh8m3CV3lu2b5v6KsBjGtMJ
 00VaTOb96S8A+FJ7prnVgn90EznD+GSrAydHYyd+jCp0U5q7tWQDs+4Y/3b3LoC8s5035XjaLhW5d
 RxG3PP+KUdl72pZLLiMHm/2O3Z3LLbnMrPte8vtFQg8fgUBWqYmG5s8suUv3Bq55hje5iYNnd49lO
 L9W1cXYxasCth8gZGMmnsiWSmm6Eb4J4aTOW7eicp6xvIXxs0X5D+TTVXyjhgPku7H417qzApDQrd
 M6KXzTI+lLnjnOhIDmkhpIIb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j5yMH-000741-Pc
 for samba-technical@lists.samba.org; Sun, 23 Feb 2020 21:00:14 +0000
Subject: Re: Internal Samba DNS issue with AD
References: <1582476460641-0.post@n4.nabble.com>
 <c66458ef-aa76-c022-05e9-6c5d122cedc6@samba.org>
 <03da01d5ea88$1dd2e530$5978af90$@free.fr>
To: samba-technical <samba-technical@lists.samba.org>
Message-ID: <8a3ef579-cbed-cd4a-90c8-8ebf0f6f5a4c@samba.org>
Date: Sun, 23 Feb 2020 21:00:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <03da01d5ea88$1dd2e530$5978af90$@free.fr>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 23/02/2020 20:30, Lionel Monchecourt wrote:
> I Rowland,
> Thanks for your answer.
> I'm not sure of my English, so should I post somewhere else or it was a joke ? :P
No, it wasn't a joke, your post is more than likely a configuration 
problem and the 'samba-technical' list is meant for developer 
discussions about the internals od Samba. You should post to the 'samba' 
mailing list.
> I have nothing running on 127.0.0.1:53
I never mentioned '127.0.0.1', I said 'port 53'
> Checking :
>
> root@myhost~/test# sudo netstat -tulpn | grep LISTEN
>
> tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTEN      744/systemd-resolve
systemd-resolve is running on port 53

Try removing systemd-resolve and see if this fixes your problem, if it 
doesn't, run the debug script again and post the output to the 'samba' 
mailing list and not the 'samba-technical' list.

Rowland




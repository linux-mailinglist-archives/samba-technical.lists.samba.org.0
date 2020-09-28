Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 311C627AA69
	for <lists+samba-technical@lfdr.de>; Mon, 28 Sep 2020 11:12:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=PSO1xIF8y0bfGBHDADJ+4Nu6YT4ZDZfKOjC9Wca9FF8=; b=u5IXS+3/QGynrHctDy9rvjAC9K
	GgptoNqy65EUUeVu9mJHlzB2KlOe+7lvI3B+tsu81ylB/YDnkNR3G1moIlG+vMsTTcU4a5fEkySZN
	bkFn25aEsc9h1m4x3PQ5hPe6XMsUp6D4pcUK4yvcfAO7LW1QfcuWz855mMsYKHsL2O2v2GtBGHdaf
	1EqXVzLUSRQvCZ6NJkqKYe3LA4J1pY8YrHqaMvxTGI1dwJgLHTpVz/t1j+9sn5kQtto1Hhz91dumm
	8LmsDojP3PWdVXfUpG03+GxJ1rN7/EQ29diPBS4K9vPTj4DtqgjP0OQeqx+OnvGDmyBrw1PglbYXh
	3rv4HO2w==;
Received: from ip6-localhost ([::1]:63798 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kMpCp-007fHq-F3; Mon, 28 Sep 2020 09:12:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41734) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kMpCk-007fHj-Mx
 for samba-technical@lists.samba.org; Mon, 28 Sep 2020 09:12:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=PSO1xIF8y0bfGBHDADJ+4Nu6YT4ZDZfKOjC9Wca9FF8=; b=wgZeBBu2F9q5vv8vRAxPktdX8l
 JcY0xWTDyEao2k7fpfahkS0gbmYqXZ87geA6o3zu5bqPVSFgi2fd/QsGhpmZHlBbpN+Zgohkd4Qgl
 GXD5G4zMa5dgEIj3Q2kfPN7kx9jAvk3B+LWrVWChZj9glXvPAjn+TtIMMM59iWXQLphCXmtWAErFn
 //JmxmVltxoBusZmnw7O8Zmm2WhPsharRbW/HJapYCT+ZZj67zLnor8s/fth5MlH11QHL/D4aTbfk
 TrWPqH/F72FVQiiAcKtHxINqEVKNsLklbcQ6rpiWtJdbgU0UwIGqcSS2D55BBmhTMpWjiGzDTqXIC
 FmWPKECpJ5eH0VY7tqsVdHME6Q0wIabCDWTpPlM5OIOCp67AElwlwnWh+dTGxbEYm4+6fGy16Yo98
 x+i9nfob3ZQwLwyrZVBQmFFwf3U/Jtr6Oh4dZvSN3xPUoGDeqmDyx/1/QLhtohHdnZxL6S7QoH5Rz
 6hISDxZ9hMJ7yp0Mk38tMBxS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kMpCk-0004QP-8f
 for samba-technical@lists.samba.org; Mon, 28 Sep 2020 09:12:18 +0000
Subject: Re: winbindd callbacks not triggered
To: samba-technical@lists.samba.org
References: <CAC-fF8S+4hyY+dsWLFPcfxjR0thU64SrCGX8u8n_3YEi-0RwVA@mail.gmail.com>
Message-ID: <58ea03e2-f2ff-12b3-7369-aaa2288bf415@samba.org>
Date: Mon, 28 Sep 2020 10:12:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAC-fF8S+4hyY+dsWLFPcfxjR0thU64SrCGX8u8n_3YEi-0RwVA@mail.gmail.com>
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

On 28/09/2020 09:51, Isaac Boukris via samba-technical wrote:
> Hi,
>
> I'm looking into a customer issue which i couldn't reproduce, they are
> running v4.10.4 (i didn't find any recent related fixes), and report
> that when winbindd runs for a while it becomes slow to respond and
> commands like 'id root' may take more than a minute.
>
> The first thing that caught my eyes is this one time error I see in
> log.winbindd, of which looks quite strange:
>
> [2020/09/02 07:04:35.886276,  0, pid=42540, effective(0, 0), real(0,
> 0), class=winbind]
> ../../source3/winbindd/wb_lookupsids.c:663(wb_lookupsids_recv)
>    res_names->count = 2, expected 3
> [2020/09/02 07:04:35.886322,  5, pid=42540, effective(0, 0), real(0,
> 0), class=winbind]
> ../../source3/winbindd/wb_sids2xids.c:426(wb_sids2xids_recv)
>    wb_sids_to_xids failed: NT_STATUS_INTERNAL_ERROR
>
> But the real issue is with requests that seem to get lost and for
> which the callbacks do not seem to be triggered, for example:
>
> [2020/09/01 20:12:01.603270,  6, pid=15783, effective(0, 0), real(0,
> 0), class=winbind]
> ../../source3/winbindd/winbindd.c:920(new_connection)
>    accepted socket 32
> [2020/09/01 20:12:01.603329, 10, pid=15783, effective(0, 0), real(0,
> 0), class=winbind]
> ../../source3/winbindd/winbindd.c:768(process_request_send)
>    process_request_send: process_request: request fn INTERFACE_VERSION
> [2020/09/01 20:12:01.603346,  3, pid=15783, effective(0, 0), real(0,
> 0), class=winbind]
> ../../source3/winbindd/winbindd_misc.c:432(winbindd_interface_version)
>    winbindd_interface_version: [nss_winbind (19519)]: request interface
> version (version = 31)
> [2020/09/01 20:12:01.603376, 10, pid=15783, effective(0, 0), real(0,
> 0), class=winbind]
> ../../source3/winbindd/winbindd.c:854(process_request_written)
>    process_request_written: [nss_winbind(19519):unknown request]:
> delivered response to client
> [2020/09/01 20:12:01.603441, 10, pid=15783, effective(0, 0), real(0,
> 0), class=winbind]
> ../../source3/winbindd/winbindd.c:744(process_request_send)
>    process_request_send: process_request: Handling async request
> nss_winbind(19519):GETGROUPS
> [2020/09/01 20:12:01.603460,  3, pid=15783, effective(0, 0), real(0,
> 0), class=winbind]
> ../../source3/winbindd/winbindd_getgroups.c:66(winbindd_getgroups_send)
>    winbindd_getgroups_send: [nss_winbind (19519)] getgroups root
> [2020/09/01 20:12:01.603723, 10, pid=15783, effective(0, 0), real(0,
> 0), class=winbind]
> ../../source3/winbindd/wb_sids2xids.c:114(wb_sids2xids_send)
>    SID 0: S-1-22-1-0
> [2020/09/01 20:12:01.603767, 10, pid=15783, effective(0, 0), real(0,
> 0), class=winbind]
> ../../source3/winbindd/winbindd_util.c:1462(find_lookup_domain_from_sid)
>    find_lookup_domain_from_sid: SID [S-1-22-1-0]
>
> And that's it, after that winbindd goes back to the main loop and
> handles another request, notice the pid (some times after several
> seconds like here, which shows that winbind is rather idle, sometimes
> immediately):
>
> [2020/09/01 20:12:13.111935,  6, pid=15783, effective(0, 0), real(0,
> 0), class=winbind]
> ../../source3/winbindd/winbindd.c:920(new_connection)
>    accepted socket 29
>
> Reviewing the code flow from wb_sids2xids_send() it is not clear why
> it doesn't get it from cache, but mostly I could not make sense of
> these logs (assuming level 10), that is I expect to see more printouts
> before winbind goes back to the event loop...
>
> Then after a minute we get this (lp_winbind_request_timeout):
>
> [2020/09/01 20:13:02.700696,  5, pid=15783, effective(0, 0), real(0,
> 0), class=winbind]
> ../../source3/winbindd/winbindd.c:1212(remove_timed_out_clients)
>    Client request timed out, shutting down sock 32, pid 19519
>
> Or sometimes the client gives up first, and we see some like this:
>
> [2020/09/01 20:13:05.144441,  6, pid=15783, effective(0, 0), real(0,
> 0), class=winbind]
> ../../source3/winbindd/winbindd.c:1019(winbind_client_activity)
>    winbind_client_activity[19583:GETGROUPS]: client has closed
> connection - removing client
>
> Thoughts?
>
> Thanks!
>
Sounds to me like a misconfiguration in /etc/nsswitch.conf, running 'id 
root' should check /etc/passwd and /etc/group first. winbind shouldn't 
even be consulted.

Rowland




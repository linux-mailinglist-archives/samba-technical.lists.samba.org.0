Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CF65B533A
	for <lists+samba-technical@lfdr.de>; Mon, 12 Sep 2022 06:26:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=GVlCwFf0yxWOITi/UsPeDfPlkirPqMavyIjWgdU1uPA=; b=Mc2k+b5Hvx8qMoE77N1Td7SV/X
	kWQd/XGKaBvaA2QAiPWF96TDWV5r1HNUGCgkhrtaePWJNi12P0WQvbESWn1qvA5IRBrMSEoTpJR/Z
	Dxqv5Db67sYWwqLxeJgn3BEuHUkBcFeYucK69Jpki9jTeT4X4hHIWUilMdvJq+33VWFVuRCr0WfnM
	5Yt5PVF76ZOmYWECc1Fsb2/U8PnHMcZcuD65xiWWpmAqjsCbO3r0J1Id28/qI3Se58jWFkQGkoDg0
	qNs27v7frvKyOwSfBa8owm4fELh+l9/iF9gwUxgUnvfprgFeXTytRTJ+VLf2h22WEuEwGskxzE+5N
	UFiA/Wvw==;
Received: from ip6-localhost ([::1]:24148 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oXb18-00024K-He; Mon, 12 Sep 2022 04:25:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50256) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oXb13-00024B-J4
 for samba-technical@lists.samba.org; Mon, 12 Sep 2022 04:25:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=GVlCwFf0yxWOITi/UsPeDfPlkirPqMavyIjWgdU1uPA=; b=H+1TtP3RpdfDnyyNvNSvNnQECF
 mtVCQPIFqSI0WgmYJzTEaslLvw+ZTnKsWkJJbqoCUbPMeWTDkFTyJYvpJI8fHdJyv0RCblSOI8Hs4
 XsXhkfaJLWVceUfaoBPCB2w85qN9Mi4qv4016898zwJLRWHafQsujhr3DjHI5i6Jt9fqBxtKe+KPr
 +aOoseOUhNL1qSh9arBSJk8OltdM5CSE5aNo6a+OJmj/vEaSwA9urFG+WtLH1a7Fd49GzvViZbExS
 JZ7EDl+F7LuMCMW34/KRtZajny9cO7wxkfTUpNlc60s4wxMCPg+nUrz894mLFBZeuTdsb9kDl5ko/
 f+8NSO8RW6TMyxGCQm2R1yInR+dtBDWbVyJPQamESV+RwA+Bvs0AwBZVlqjcrDi4NaBLWl7d+x/7r
 HHEF3/enoiWQVFJfsw4uRB4/rRzNaLCXgfVi80ovAOVqsSArcaZEeOioWfP62cyDVxHVdYkMDBFu6
 /Ea5jUmX7C26gupfbazWFvFc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oXb11-00025r-PE; Mon, 12 Sep 2022 04:25:48 +0000
Date: Sun, 11 Sep 2022 21:25:43 -0700
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: various spelling fixes (round2)
Message-ID: <Yx60x1EV0W519MMr@jeremy-acer>
References: <20220909180007.1890214-1-mjt@msgid.tls.msk.ru>
 <314de86f41ab87231457266e376eda06b1b1bbfd.camel@samba.org>
 <33659228-a774-3c68-ade9-f40e54506606@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <33659228-a774-3c68-ade9-f40e54506606@msgid.tls.msk.ru>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Sep 09, 2022 at 09:20:48PM +0300, Michael Tokarev via samba-technical wrote:
>09.09.2022 21:16, Rowland Penny via samba-technical wrote:
>..
>>>Do whatever you want with this. Remembering previous
>>>attempts to fix something in samba I don't have much
>>>hope for this one either.
>...
>>Well, they all look correct to myself, but, according to protocol, they
>>should really be presented via gitlab.
>
>We've been there already. I can't use gitlab because I can't
>verify my account because russian banks are banned from swift
>and gitlab uses credit card to verify.
>
>So, as I initially said, do whatever you like, including nothing.
>I use this patch for the benefit of debian users.

Merged as 3ce1d2fde5dac8a9da2ff0a91ec104cb52d0c6bd.


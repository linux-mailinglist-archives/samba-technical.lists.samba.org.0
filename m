Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1A029E7C
	for <lists+samba-technical@lfdr.de>; Fri, 24 May 2019 20:52:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=OQ5taIzs8yJvurxZtguP2vHLHeidppcRyolrqvpouPI=; b=3cI1m6Omb9L1/PrI8JyfnZKd83
	SC1UwdzdHvU1DlN+M4q29sITMJYSNtbnRwQqS0Y/DfY/zDmntHmhG8IuyAShPMHSs/R9236qBAlwz
	ZMqCP/b7UMrfipYpJs/UL0SAR0/QO1s5SselfghZjs+0w+Gf6EpNI5S4ClBQHOue07QsoqRHtJNEd
	CsunxSIbO5HRYRjFOeYiCctJu11tCs+N9ZKR1+8v2nTNzlmozMwFC8YpnNcb36+Iex2uSNMYT025Z
	cEUf8cTR4o3e2OQyV5LMqSdpwZC9twkXEMUWDxX2c+u4T1sbCGEYmaokC+PEivZmOvlyK52s9GELx
	IvsAfL4g==;
Received: from localhost ([::1]:30558 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hUFIx-001dqp-Bj; Fri, 24 May 2019 18:52:35 +0000
Received: from [2a01:4f8:192:486::147:1] (port=14728 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hUFIs-001dqi-U2
 for samba-technical@lists.samba.org; Fri, 24 May 2019 18:52:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=OQ5taIzs8yJvurxZtguP2vHLHeidppcRyolrqvpouPI=; b=IReSqetFqnTIQEROWY3nZ9OCH+
 zRWjiiQoeHzdjOxYt4+WDY31iKrzumi6dUE5f1wjVgIuFnSIm6hty5uv4pfu7p3x5FMheLTOdVphl
 M71bP8+ktuvkbDA9nWM9uHAsdqtpbTqc4ynTeGcJsncQop1qPD23Vsbts2IbxR3kShNA=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hUFIn-0003n2-0Y; Fri, 24 May 2019 18:52:25 +0000
Date: Fri, 24 May 2019 11:52:22 -0700
To: Uri Simchoni <uri@samba.org>
Subject: Re: gitlab question.
Message-ID: <20190524185222.GA191396@jra4>
References: <20190524174326.GB136126@jra4>
 <84ab1d9b-32b5-e51d-fbda-8ed801a1a878@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84ab1d9b-32b5-e51d-fbda-8ed801a1a878@samba.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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

On Fri, May 24, 2019 at 09:49:27PM +0300, Uri Simchoni wrote:
> It's git fu that you probably already know :)
> 
> git remote add gitlab git@gitlab.com:samba-team/devel/samba.git
> git fetch gitlab
> git checkout -b slow-bug13964 gitlab/slow-bug13964

W00t! Thanks Uri, if Samba-Team had peer-bonuses I'd
give you one right now !!!

This one is going in my 'gitlab-help' folder :-).

Thanks so much, especially as it avoids using the
Web interface :-) :-).

Jeremy.


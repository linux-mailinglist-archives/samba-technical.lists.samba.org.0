Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D393F2133D3
	for <lists+samba-technical@lfdr.de>; Fri,  3 Jul 2020 08:03:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=2oxRQSnl+qV36G/coXaAyvSO+p+mkWoqyW4lEUSLcxs=; b=qdmZK3s0JHyKrKjeyzgNgiWmwi
	ftCtydyo2qPEHSqCAEvBvHsNXFWDsrHkOoGtn5KWWH5ndvkvMqFnvMK6PyHb3hwCSjKZbDEekRDZt
	SgN6eMrdaOLq6TEEul//doTn9GISpxCjxYglx/5OgfbiK45RLCCLbjeUvjj4mkkIUjZfzPplk1ZHC
	VwUjI8rdX+kGhWebyp7nHsSQnfVRjx5GIa/jxQHHWP3S02P+6G7UHbsribnnyeP+amp8sAf6Wbbws
	zPVCRxfmJ3wEZtOXLI3R3WoqGkCO/cMITPDE3tFfvaniLSj122Z3Fi12n3H8w38UXaG737goafLaG
	KZOY5wYA==;
Received: from localhost ([::1]:48432 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jrEmB-005DMm-2J; Fri, 03 Jul 2020 06:02:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24192) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jrEm5-005DMf-C9
 for samba-technical@lists.samba.org; Fri, 03 Jul 2020 06:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=2oxRQSnl+qV36G/coXaAyvSO+p+mkWoqyW4lEUSLcxs=; b=YCnTSMGEqXD3L4a6erUnhGH1GS
 mcAVcSKHDGuhJgA6/8rWqmY6TInZJvIJg4ZSaKNqjgIyE4l7cVa/IaBSzCkP0te1U1nhrmqSmHv+z
 u3H9hdPEpK86uqVuvnwkqBRjRYZ5UY/mV3UupHoCdON6jjdwj883OZQObtRTKa4PJ+CN/wXNN/4ix
 Xa7d54ZyptVstzll0/UoPBVQdIT38D6do0hXd1e9V7WVLGQ/697l0bT51Mjzkzc0YdP0ttvYgbl2H
 3IMQlE28QcqCB2schJ4IJL5vR57Aa/fMkd/ETh1TBEevns5UX/EzMHhJO4ftaBuw//1RAnlB2wPtT
 M4FxJWs+bHS5o2g+/sRPTKvm+tmiiJR+tv905yFFULLlTWq5APQc/qPOvxZp764BqW+Le+liGLrMM
 +mK+GS8UOMhlWQ+i68mSPkAz29sEGH8VE9uf+R4HTg1aMRmT5vRUX9NSjYGgGxSzyY7p09heYGnMP
 c2zFxu7v6JBVHZn+2nB9TSm5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jrEly-0005tE-Ce; Fri, 03 Jul 2020 06:02:06 +0000
To: samba-technical <samba-technical@lists.samba.org>,
 Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Subject: Re: [PATCH nsswrapper] nwrap_files_getaddrinfo: avoid crash on empty
 name
Date: Fri, 03 Jul 2020 08:02:05 +0200
Message-ID: <2140785.WgoT3CsFaA@magrathea>
In-Reply-To: <abd3c805-c26b-972c-e721-eb3d373d3682@catalyst.net.nz>
References: <abd3c805-c26b-972c-e721-eb3d373d3682@catalyst.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, 3 July 2020 00:18:51 CEST Douglas Bagnall wrote:
> This patch helps the test environment stay up when you are looking at
> bad DNS packets.

Thank you very much Douglas! Could you please create a merge request at:

https://gitlab.com/cwrap/nss_wrapper/


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D




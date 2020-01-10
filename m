Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FD8136550
	for <lists+samba-technical@lfdr.de>; Fri, 10 Jan 2020 03:26:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=7tvtC/AI36l3YIoy6abje5xpWMX8ZM5KaujiCyGZ/nA=; b=16llkram1uA9qpdNjCn9Ydf4uf
	gQJcMY1tYKFMsPw7yCiSVhzET3fFmHDTvB5u0V6uVpTQqWnf7tQl4dZzAseYFNAn0ECg51ghugXj7
	gB54YzMKpVuXiQtHvKJSMp7imufE+iLLMQgpBCs13TgNLvd1dI4FwUDIDEphfa6kXf/2uA/9HYqwf
	3K8rrZuWy0ZkBp+NDWA0YmtC7E6J7OYIUI+mAvzY6ouXSMPk3xWE59kq8ivfsTqdH0uw9YyMFmHBI
	v338Z3skc5tfu+bUxvljEG0fCUeznhDwNELUOeUBZ4STvUjawmGQNUzq14Aac2ZBv+OaBtY73d/An
	vHvPzwpw==;
Received: from localhost ([::1]:61424 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ipk03-002tOU-CO; Fri, 10 Jan 2020 02:26:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48852) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ipjzw-002tMo-PE
 for samba-technical@lists.samba.org; Fri, 10 Jan 2020 02:26:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=WQe1a3kYAPluydN3WwpE28aYWJLlUSjQ8P2q9VVjgHc=; b=zjxDq5QJo6b1SjmCKgSBkhryFf
 dgrlhsSonsyx6iIQ/IE41J2sxxaVt8Oaa0rmMsQVGyRRbaYAOvJG4J3BsvlEVGLo2pCdo5anj0xAg
 A3YShdrtosHTncZszuT0VHzCs3U5dDnmGsdT/wfrh518ZuVOuv2BN9FB/LmQE+3uWXJvIcZCxG+fj
 Yh8UGjE7UX8Px6ANqP/HHaO3S99eggsigf/v2gVlhZav+2GL1s67b4kh2j0hkyTSa8+eJtm3lIu+h
 tGM874Q9GikxAGXF5EZvCTzFGbCJHkr1MSaOmnSraA4zZvmoHck9G1zmhjStLBkPxBigMmUKpmNtA
 OK08ZMJy/mPNjB8zlFo+pDaU//FCq1UBz+M5PW2c6WVaEch8STsoBbTfJ5x9+UKAk36Fj+FDh4+ZO
 arVuqjg5UNOrdHskdccMKR9holMDMXG2zkp6lgeAto+dxUhhAIJWzICfJBjDhPwKF5CBDoX7sc+AH
 j/mUJqExZSLSLvoXLIK48zOD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ipjzw-00067T-8p
 for samba-technical@lists.samba.org; Fri, 10 Jan 2020 02:26:04 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1ipjzw-0030Na-36
 for samba-technical@lists.samba.org; Fri, 10 Jan 2020 02:26:04 +0000
MIME-Version: 1.0
Subject: Re: gensec_gssapi: Improve debug messages
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-5@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-5@samba.org>
Date: Fri, 10 Jan 2020 02:26:04 +0000
Message-Id: <E1ipjzw-0030Na-36@hr3.samba.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Github bot account via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: github@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

TmV3IGNvbW1lbnQgYnkgYWJhcnRsZXQgb24gU2FtYmEgR2l0aHViIHJlcG9zaXRvcnkKCmh0dHBz
Oi8vZ2l0aHViLmNvbS9zYW1iYS10ZWFtL3NhbWJhL3B1bGwvNSNpc3N1ZWNvbW1lbnQtNTcyODQ0
NzUyCkNvbW1lbnQ6ClRoaXMgaXNuJ3QgZ29pbmcgYW55d2hlcmUsIGNsb3NpbmcgbXkgb2xkIFBS
Lgo=

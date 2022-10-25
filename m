Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C6160C960
	for <lists+samba-technical@lfdr.de>; Tue, 25 Oct 2022 12:06:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=kkMfSQsxThvn23cXQJ2CPEP3NoQNlT1LUYGzC6T7xeI=; b=52EnvDi2o0I+zisjPUPKJjpA6t
	zJDIhOe71Zl7E+BdbhLXwvX94jqkeMSZdaF3HPFWZS3nIh6kT/t4nk6l6HufWamMLPcl+WvyRhl2i
	kObLNyGtm4JIzpjYyOGlS4TCyVHd9i3S5d3AaIYUCxtxNNpJpx0AjawLcJqg6vf3RnlQia4I4uZSB
	f+bJhDjlizM55h3//f5tIgtU5Z2MA096WoAQ1Eh4xbFtLRYtQ0/paS1M5uORk9Zz6ctooIM8HXnlr
	armRKxBFQ+ZEqhuyAPuZ0F+smpQ6EtkuG9h1QrVR6d6eWK1CrGJyhgTcZEXlo/so//GLX3nBcBONE
	x9Ghdp1w==;
Received: from ip6-localhost ([::1]:32052 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1onGog-005qVj-Av; Tue, 25 Oct 2022 10:05:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44688) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1onGob-005qVZ-HO
 for samba-technical@lists.samba.org; Tue, 25 Oct 2022 10:05:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:From:Date:Message-ID:CC;
 bh=kkMfSQsxThvn23cXQJ2CPEP3NoQNlT1LUYGzC6T7xeI=; b=aDa3WAM6zVHfxFFLPZJ7vfVF68
 sw/ll7MKkb6xKOZikO+/+wCg07I3ncFQKZHdtHc1sucvN9pygl60CBqH64e54w5/6E978dNqYMSIG
 Z8/EPcmK6iZKUaahYecNZzMU0jP+EPAchdwQjBuifa8zf1chcTwdIhKe74uFBTIQ31OkspYIT5uZY
 ONJMNQnAbSUDvKQyq1cqjHOPZugpkyQHXMZzRUPFpL1bPkY4cK4rLlzQFZHKne7rVqbohQuVuG+cf
 yTzgucvdd6rUjlzN3qj0voPYKWImRrwAYudOh/sIcSwVZmq7GB901Lt3EzM1RdPN+qjuOkHHLr8vi
 1PmL5E+muWl0Bavj0ysBT4gMUthlA0oOq30986eqa62u0YDmjGXosdn3wFTZFvSuknR5HYl8f/Z3T
 2QBx1X6KNKICgPF22rZ8DpeN4TQEOUrP5n2WwYgRFupUxdjGjXO0lavwA4wIFd2Yhjs9My8aZoffu
 Mp1nqJ9GkqiFnl44eUGL0MAY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1onGoa-005h8z-No
 for samba-technical@lists.samba.org; Tue, 25 Oct 2022 10:05:44 +0000
Message-ID: <9c8042d2-07f8-ed24-8580-80956bc0dbbe@samba.org>
Date: Tue, 25 Oct 2022 12:05:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: de-DE
Subject: [Release Planning 4.17 and 4.16] Samba 4.17.3 and 4.16.3
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.17.3 is scheduled for Tuesday, December 06 2022.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.17
has been updated accordingly.


Samba 4.16.7 is scheduled for Thursday, January 05 2023.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.16
has been updated accordingly.


Best,
Jule

-- 
Jule Anger
Release Manager Samba Team      https://samba.org
SerNet Samba Team               https://sernet.de



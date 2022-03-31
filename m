Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E3C4ED507
	for <lists+samba-technical@lfdr.de>; Thu, 31 Mar 2022 09:52:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=s+ImVzRhFHUgbF4OW25iIlsEIFRUQ0wl2HrpXDNmwB8=; b=ALfdosiQ31GEctEm7OIyeQMA1L
	ZMGXQrkctHzIhZ/qIysQSKXnUiR3BuSu0XLGLOjY48DhLy+YmjwHJY5eb8vebxMr+Sqt05Zv4uvw3
	Ti/35mMcWXlDplE6Z4EWMRw0WBubgkgE7j+qB6vHf2wTH4p2NyyH7P6lFuqFEpxkXklzEKS308Zgd
	gGqcG1qIAYH3+mFwLXw7gX6nNr9Ajc3I5hB9Q4GYgP5Nq6NjeA9cAoOESdkKnOf14zMxN91gxFs5l
	wdsRsBks/A85zRVEkpDjZgHlMqALMT5SAliIDZyLdhZOqTBuOZNmSUut02foeUqBrz8kqzR1VLkmC
	JJdxEg9Q==;
Received: from ip6-localhost ([::1]:25132 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nZpb0-0070yA-Qf; Thu, 31 Mar 2022 07:51:54 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:36626) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nZpav-0070y0-Fl
 for samba-technical@lists.samba.org; Thu, 31 Mar 2022 07:51:51 +0000
Received: by mail-ej1-x633.google.com with SMTP id bi12so46397341ejb.3
 for <samba-technical@lists.samba.org>; Thu, 31 Mar 2022 00:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=s+ImVzRhFHUgbF4OW25iIlsEIFRUQ0wl2HrpXDNmwB8=;
 b=gryWaCwV9anr0uEkPyV/0LPnF4NwaGkfT0zN2l2gfqzxiQNMHCk+aYNFqew+rbZXh/
 g9gONUtBQRcvi21lhxEFXkxJx1/zD1KSWAzP2ndgukDysbbXzjfRYrbNysPKQuFIziW0
 wzhMzKFsXkbxMNAabCk5+Vfic38RmcouVBrPFCpipe2PcPoftpMb4cXmFI2guU39sqZk
 fwR4Gyd/NRYnQb4wdGeLnr7U0qpzaFqgycCjXZHgal34Cx+cASnSvDO5F5ARn5O0UAai
 tScAl7P6hdvQl8W01F7tT8vDUp6ijKmqy8KvX9URwNNXR8KFBlIy8m8LLjUJAeXHPwn3
 cfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=s+ImVzRhFHUgbF4OW25iIlsEIFRUQ0wl2HrpXDNmwB8=;
 b=sS+aLdlyfnunemgBaOgHPBvYKUGlgKNOAbk5k52XKz+UtnybsgL7qrb6gT+8oY9vNH
 tOWpXGqacKhWBNhvI/sYou2kgmLjJH/1XxjotIRaoJN8ifBQT89XQJtGoJDy2Poism9w
 jAAtUdgNJHKaEH5JqxkaagIk/N4Zv7dQMl+2Pd8VLiYLJfF6EGPW3FQ5XCED9p/ab+xa
 ib+PNWhlWh5EzXmewzCkBRiSbwqgJhPnXDPe0K9/RSShicpw7sDndEQW3rWYC+kKUHe+
 YQjxT0ipSFOxMljrsIJihclTupxsHMXUoU0RRYwyg4qdB3jMdkVVRINCwpqixaLUJJvj
 SFsQ==
X-Gm-Message-State: AOAM533BRIEDvjUYmn+jV7BE7gKDOfZgBlXYlOgNhQ24FNuhjh/yxh5Y
 YWk4pZJPaF7TqnyjYYo9LQ7Zdvc6N1o=
X-Google-Smtp-Source: ABdhPJy943O48HLELL7rmCMZ8gC33fIne/13Ak+Uclo510o47VWsJZknUumqokpFyxLz4Aj+7Ncbaw==
X-Received: by 2002:a17:906:7943:b0:6df:e5b3:6553 with SMTP id
 l3-20020a170906794300b006dfe5b36553mr3883376ejo.398.1648713106688; 
 Thu, 31 Mar 2022 00:51:46 -0700 (PDT)
Received: from [192.168.10.106] ([45.83.235.18])
 by smtp.gmail.com with ESMTPSA id
 y16-20020aa7d510000000b004197c1cec7dsm10791099edq.6.2022.03.31.00.51.45
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 00:51:46 -0700 (PDT)
To: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Subject: Offline question - waf install recompiles another 4k files after waf
 build built its own 4k?
Message-ID: <03946334-dac7-96b0-405c-b24c4f2acb3b@gmail.com>
Date: Thu, 31 Mar 2022 09:51:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: nl
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
From: Kees van Vloten via samba-technical <samba-technical@lists.samba.org>
Reply-To: Kees van Vloten <keesvanvloten@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Stefan,

I am following the discussion on samba-technical around building 
packages for Debian, which you take part in as Samba team-member.

I am quite suprised that no one has pointed a Louis' packaging work so 
far. He is doing exactly the same a what Michael wants to achieve, or am 
I completely mistaken?

Louis has not jumped in himself, but he is having some family matters 
lately (which is probably why his 4.16.0 packages are delayed).

- Kees



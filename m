Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE5B10CEED
	for <lists+samba-technical@lfdr.de>; Thu, 28 Nov 2019 20:37:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=JSXnD4bjmIvnQmDzKRSfetrPyqCX7JCBseEv0OC7Wv0=; b=f50M/CYFc5SJTfkrcaK3TPWsEq
	0ENEjhlCEjRMWerkxaMwMJ3bGMOIoZgPqV8GwAYy+KLlpcxYbBPZN7Y1QZRJt/KzPifv/852iVSfA
	Y19rzeeDT7w3fHLN5CZ7NX3g+ZWnqAFl2f8aUPi3kJiNKG5jCYuN7LAWnmcohSiE5cIgcPmDWBFIC
	JypU3Rm6SjT3wgbwTivKFBm2DXnphOx85n7Xc0W27XWIz+jBcGNkKolkBZXprrWa6lhUkCEmBL1u2
	JN+3DfWm69nxqIqs8CBd1PIGuBKrH43dz6m+qSRC122WpCH+WFwn4zTthYzhax+biqn1RrsC3sxM6
	ybMnEF+Q==;
Received: from localhost ([::1]:33054 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iaPak-0034qM-UK; Thu, 28 Nov 2019 19:36:42 +0000
Received: from youngberry.canonical.com ([91.189.89.112]:40486) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iaPah-0034qF-VB
 for samba-technical@lists.samba.org; Thu, 28 Nov 2019 19:36:41 +0000
Received: from mail-ot1-f70.google.com ([209.85.210.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <andreas.hasenack@canonical.com>) id 1iaPaf-0006HM-1P
 for samba-technical@lists.samba.org; Thu, 28 Nov 2019 19:36:37 +0000
Received: by mail-ot1-f70.google.com with SMTP id 60so14032801otd.19
 for <samba-technical@lists.samba.org>; Thu, 28 Nov 2019 11:36:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=JSXnD4bjmIvnQmDzKRSfetrPyqCX7JCBseEv0OC7Wv0=;
 b=krq0JQALG73rpYDwG7lJsVdquUhkCPQnHz1raCrBzala2QGZfHEG/wqJCpkgbAtsyx
 VRf2QNjrEqpUMeZFjMgg78VP2hPdu0zXFuLZqm6Gk701AzI4uwXJyTlEJTwsUg5qROlb
 RjeaZFFiHGE/8LvfPZ/Hw9SvzfhSoXVGT5mlpEO6AeDVqiSa2VfKwuQSCVP5nG4PrYe/
 ibSTZF1BRkCtNFZR0mtO6toMJv6GoCaddQ0ABHAVDLV4B5XSKNq5wd2uKUmFNF1W8ZP4
 3CLANbJPY4PhQiQ6nsmZ8WJzwi1Zp/LLEAinnaKSqmcCQ9RhMGYyetZNVBIZ/ArdlDw2
 LJFg==
X-Gm-Message-State: APjAAAUq6re///be9BPauJacUg6OUtHIXvwdTRn5qRBVZFZA2VCyviFh
 8jR9UdadQtGVe/KE1gYnlowo837IKuovQbsyPKSlpxb2ZrkG8zWnAH3K2L9HU8GEK3mO3V5nLuN
 HUuWk5Y8nR71qX2w0/pg2o3mEgCfUBPRW3h8QP95p9v8D8VsBxDoJ4+S5eRhr0g==
X-Received: by 2002:a05:6830:2116:: with SMTP id
 i22mr4937810otc.0.1574969795837; 
 Thu, 28 Nov 2019 11:36:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqyK7PjUlewcaGMWSKQ/VYMNVepNHES1A7U+mWsn4imuSbGqPcFvoKUaeilngkZdOJRv/jCDXR3ABzIR+UdoQMQ=
X-Received: by 2002:a05:6830:2116:: with SMTP id
 i22mr4937794otc.0.1574969795555; 
 Thu, 28 Nov 2019 11:36:35 -0800 (PST)
MIME-Version: 1.0
References: <CANYNYEEyavNVwax-aWu+qLZYMw+f=hFNA=6WH2gREh9WjHQ8oQ@mail.gmail.com>
In-Reply-To: <CANYNYEEyavNVwax-aWu+qLZYMw+f=hFNA=6WH2gREh9WjHQ8oQ@mail.gmail.com>
Date: Thu, 28 Nov 2019 16:36:24 -0300
Message-ID: <CANYNYEEdYJQ8S-+iAYRn0eepuiA4FXFqpVpa0sMXRN0r_XAXrA@mail.gmail.com>
Subject: Re: smbspool without authentication no longer works?
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
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
From: Andreas Hasenack via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Hasenack <andreas@canonical.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Nov 28, 2019 at 3:11 PM Andreas Hasenack <andreas@canonical.com> wrote:
>
> Hi,
>
> is smbspool supposed to work without authentication, in the case the
> printer is shared like that?
>
> I've been tracking some bug reports about printing no longer working
> with samba 4.8 or higher. The last one where I got this command below
> to work was 4.7.6:
>
> ubuntu@bionic-smb-printer:~$ /usr/lib/cups/backend/smb
> smb://10.10.1.6/ds216laser 34 root page 1 options .bashrc;echo
> Kerberos auth with 'root@WORKGROUP' (WORKGROUP\root) to access
> '10.10.1.6' not possible
> ERROR: Session setup failed: NT_STATUS_ACCESS_DENIED
> DEBUG: get_exit_code(cli=0x561bb8db7d70,
> nt_status=NT_STATUS_ACCESS_DENIED [c0000022])
> ATTR: auth-info-required=negotiate
> DEBUG: Connected with NTLMSSP...
>
> ubuntu@bionic-smb-printer:~$ echo $?
> 0
>
> With, say, 4.10.7, I get:
> root@nsnx:~# /usr/lib/cups/backend/smb smb://10.10.1.6/ds216laser 34
> root page 1 options .bashrc; r=$?;echo;echo $r
> kerberos_ccache_is_valid: Failed to get default principal from ccache:
> FILE:/tmp/krb5cc_0
> DEBUG: This backend requires credentials!
> DEBUG: get_exit_code(nt_status=NT_STATUS_ACCESS_DENIED [c0000022])
> ATTR: auth-info-required=none
> DEBUG: Unable to connect to CIFS host: NT_STATUS_ACCESS_DENIED
> 2
>
> If I pass "anonymous" as the username, or even a blank space (!), then it works:
> root@nsnx:~# /usr/lib/cups/backend/smb smb://\ @10.10.1.6/ds216laser
> 34 root page 1 options .bashrc; r=$?;echo;echo $r
> DEBUG: SMB connection established.
>
> 0

It's weird, the code seems to explicitly prevent unauthenticated
access and gives up if auth_info_required is "none" for example, but
after that exit point it has attempts (never reached) using
passwordless NTLMSSP with the current unix username, and even guest
auth with a blank user and password.


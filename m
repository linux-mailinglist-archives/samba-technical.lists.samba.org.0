Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 770DD7CEE0D
	for <lists+samba-technical@lfdr.de>; Thu, 19 Oct 2023 04:27:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=6d/LTTqaVunacMzs6j7M6fR+J9n73q/qJJoG2gZ3b7c=; b=a5DlfIgTowEYU0v9/VwQeEpQFw
	MFNmn4rpSOi2yVuu3XiP1HHJy8L1AL3IRYcvcnJ2iyc1zdp3dmjE0R0zR0so9uVxvprvDtoL+Wdai
	zBaxnoq244efYDYAnn55fMib9djYF9uSFfBREWpZxWUYmsjvoO9ew4c78FVFe/gkR3lTMyMD1E3w8
	yJbpAEh9tVPlpXI4pbUGACCXA6npeiono0Jm5ZmGoQ5/wISW9+ZEPebIIdHZ7cxXdmXfVCfzgmr3t
	tlBLUFC+UxsYoH+TnqYyngqBTN9iiYstf9Lszdc6g5bXCJZ0wl2D5Z31G1JCBVZr8aq9JKAXw9Mnm
	yYYxAXLg==;
Received: from ip6-localhost ([::1]:25734 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qtIke-001AJ0-61; Thu, 19 Oct 2023 02:27:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48270) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qtIkY-001AIr-RM
 for samba-technical@lists.samba.org; Thu, 19 Oct 2023 02:27:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=6d/LTTqaVunacMzs6j7M6fR+J9n73q/qJJoG2gZ3b7c=; b=tHWaONslGH8tlzVTMI8r4ZSTHf
 ByFC8ThB2Po3B7eHD01qRSEMolcpk0NPehjHuEMW9YJrKPCsYJIhDK5RQh/3DX4cy+FX6AcVehxNY
 HCDsxz9G+Sv5EI8rXyUSm0vu2GxjrkL0WBlYcJ3gfPqPWZ6UGRbALaKgBl8Nobi/HcUl+/YO/ZB2d
 jiO9/U6TYzjA+/x+4NXuPh7dYdp8lP+oE3wJ3VxGFIFReEum+HyF4OodefSwCUm6uHBvpHhIYSLKL
 Npkg3BKrevadJzOPGPRxD4vFTI/5JifQTcgh6kPTcK0p4B4g6SuruKYZ2kQ22cAdLpOe7GkMb1BkT
 OhYsrcLI7FAPo2uWcAu96FNdUFKtwmFITHDpQ0vBpPWhqMNhauk78WAXiYE5yxbEwUKPgr2S9tkMZ
 irs+BSpH1XCgX65d3o4TAcl+KYDALalzJLPRpueDl4Hk/D8E4GOANyNWcn9/0TsMwl0f5CiTqa7Mo
 xXEgIQ/uGoq2abvyuKsynOMe;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qtIkX-001Oji-2s for samba-technical@lists.samba.org;
 Thu, 19 Oct 2023 02:27:02 +0000
Message-ID: <2198cc41-84f5-4568-b708-ed78a7c8b234@samba.org>
Date: Thu, 19 Oct 2023 15:26:56 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: s4:torture: Increase multichannel timeout
Content-Language: en-GB
To: samba-technical@lists.samba.org
References: <E1qsqak-005Ezi-2G@hrx0.samba.org> <5999563.lOV4Wx5bFT@magrathea>
 <00f9d78e-01c6-4bad-a627-42adb3870fa2@samba.org>
In-Reply-To: <00f9d78e-01c6-4bad-a627-42adb3870fa2@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: Joseph Sutton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Joseph Sutton <jsutton@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 19/10/23 2:54 pm, Joseph Sutton via samba-technical wrote:
> On 18/10/23 7:28 pm, Andreas Schneider via samba-technical wrote:
>> On Tuesday, 17 October 2023 22:23:02 CEST Andrew Bartlett wrote:
>>> The branch, master has been updated
>>>         via  f392fdfd47f shadow_copy2: Add missing TALLOC_FREE
>>>         via  c6d0df787a1 s4:torture: Increase multichannel timeout
>>
>> Hi,
>>
>> I've increased the timeout which worked for me and the test didn't run 
>> into
>> timeouts anymore. However Joseph run into the issue again with
>>
>> https://gitlab.com/samba-team/devel/samba/-/jobs/5316200327
>>
>> Does it make sense to further increase the timeout or could there be 
>> another
>> issue. I'm not an expert in this area of the code.
>>
>> https://gitlab.com/samba-team/samba/-/commit/
>> c6d0df787a1f6007e1f4594f68ff1f75a46bd293
>>
> 
> Here’s some more detailed output from a failed run:
> https://gitlab.com/samba-team/devel/samba/-/jobs/5324774640
> 
> Testing for BUG 15346
> 2023-10-19T01:09:58.811178Z: conn[0]: negprot done
> 2023-10-19T01:09:58.811246Z: conn[3]: negprot done
> 2023-10-19T01:09:58.811290Z: conn[5]: negprot done
> […]
> 2023-10-19T01:09:58.883395Z: conn[30]: echo done
> 2023-10-19T01:11:31.861815Z: conn[3]: echo timed out
> UNEXPECTED(failure): samba3.smb2.multichannel.bugs.bug_15346(nt4_dc)
> REASON: Exception: Exception: 
> ../../source4/torture/smb2/multichannel.c:2474: status was 
> NT_STATUS_IO_TIMEOUT, expected NT_STATUS_OK: smb2cli_echo_recv failed
> 
> Connection 3 took just over 93 seconds to time out. 93 happens to be 
> equal to ‘state->num_conns * 3’, the current timeout value in seconds.
> 
> So it would appear that the failure is indeed due to this timeout. But 
> when the timeout is so long already, I don’t think that increasing it 
> further is going to help.
> 

Also, when the test fails, it is nearly always the second connection to 
complete protocol negotiation that gets stuck and eventually times out. 
But in [0], it is the twelfth (connection 12). And in [1], both the 
second (connection 1) and the fourth (connection 4) appear to have timed 
out.

Regards,
Joseph

[0] https://gitlab.com/samba-team/devel/samba/-/jobs/5300258543

[1] https://gitlab.com/samba-team/devel/samba/-/jobs/5301618462

